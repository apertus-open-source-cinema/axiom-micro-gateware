----------------------------------------------------------------------------
--  axihp_writer.vhd
--	AXIHP Writer (Async, In Flight)
--	Version 1.5
--
--  Copyright (C) 2013 H.Poetzl
--
--	This program is free software: you can redistribute it and/or
--	modify it under the terms of the GNU General Public License
--	as published by the Free Software Foundation, either version
--	2 of the License, or (at your option) any later version.
----------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

library unisim;
use unisim.VCOMPONENTS.all;

entity axihp_writer is
  generic (
	DATA_WIDTH : natural := 64;
	DATA_COUNT : natural := 16;
--	ADDR_MASK : std_logic_vector (31 downto 0) := x"00FFFFFF";
--	ADDR_DATA : std_logic_vector (31 downto 0) := x"1B000000";
	ADDR_MAX : std_logic_vector (31 downto 0) := x"1A000000" );

  port (
	m_axi_aclk	: in std_logic;
	m_axi_areset_n	: in std_logic;
	enable		: in std_logic;
	inactive	: out std_logic;
	--

    -- unfornunately this is not supported by vivado block designs, we need to
    -- break out these signals

	-- m_axi_wo	: out axi3s_write_in_r;
	--	write address
	m_axi_wo_awid	: out std_logic_vector (2 downto 0);
	m_axi_wo_awaddr	: out std_logic_vector (31 downto 0);
	m_axi_wo_awburst	: out std_logic_vector (1 downto 0);
	m_axi_wo_awlen	: out std_logic_vector (3 downto 0);
	m_axi_wo_awsize	: out std_logic_vector (2 downto 0);
	m_axi_wo_awprot	: out std_logic_vector (2 downto 0);
	m_axi_wo_awvalid	: out std_ulogic;
	m_axi_wo_awcache	: out std_logic_vector(3 downto 0);
	--	write data
	m_axi_wo_wid	    : out std_logic_vector (2 downto 0);
	m_axi_wo_wdata	: out std_logic_vector (63 downto 0);
	m_axi_wo_wstrb	: out std_logic_vector (7 downto 0);
	m_axi_wo_wlast	: out std_ulogic;
	m_axi_wo_wvalid	: out std_ulogic;
	--	write response
	m_axi_wo_bready	: out std_ulogic;

	-- m_axi_wi	: in axi3s_write_out_r;
	--	write address
	m_axi_wi_awready	: in std_ulogic;
	m_axi_wi_wacount	: in std_logic_vector (5 downto 0);
	--	write data
	m_axi_wi_wready	: in std_ulogic;
	m_axi_wi_wcount	: in std_logic_vector (7 downto 0);
	--	write response
	m_axi_wi_bid	    : in std_logic_vector (5 downto 0);
	m_axi_wi_bresp	: in std_logic_vector (1 downto 0);
	m_axi_wi_bvalid	: in std_ulogic;

	--
	addr_clk	: out std_logic;
	addr_enable	: out std_logic;
	addr_in		: in std_logic_vector (31 downto 0);
	addr_empty	: in std_logic;
	--
	data_clk	: out std_logic;
	data_enable	: out std_logic;
	data_in		: in std_logic_vector (DATA_WIDTH - 1 downto 0);
	data_empty	: in std_logic;
	--
	write_strobe	: in std_logic_vector (7 downto 0);
	--
	writer_error	: out std_logic;
	writer_active	: out std_logic_vector (3 downto 0);
	writer_unconf	: out std_logic_vector (3 downto 0) );

end entity axihp_writer;


architecture RTL of axihp_writer is
  ATTRIBUTE KEEP_HIERARCHY : STRING;
  attribute KEEP_HIERARCHY of RTL : architecture is "TRUE";

  constant awlen_c : std_logic_vector (3 downto 0)
	:= std_logic_vector (to_unsigned(DATA_COUNT - 1, 4));

  signal active : unsigned(3 downto 0) := x"0";
  signal unconf : unsigned(3 downto 0) := x"0";

  signal awvalid : std_logic := '0';
  signal wvalid : std_logic := '0';
  signal wlast : std_logic;
  signal bready : std_logic := '0';

  signal data_en : std_logic;
  signal addr_en : std_logic;
  signal resp_en : std_logic;

  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO of m_axi_wo_awid: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI AWID";
  ATTRIBUTE X_INTERFACE_INFO of m_axi_wo_awaddr: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI AWADDR";
  ATTRIBUTE X_INTERFACE_INFO of m_axi_wo_awlen: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI AWLEN";
  ATTRIBUTE X_INTERFACE_INFO of m_axi_wo_awsize: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO of m_axi_wo_awburst: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI AWBURST";
  ATTRIBUTE X_INTERFACE_INFO of m_axi_wo_awprot: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI AWPROT";
  ATTRIBUTE X_INTERFACE_INFO of m_axi_wo_awvalid: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI AWVALID";
  ATTRIBUTE X_INTERFACE_INFO of m_axi_wo_wid: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI WID";
  ATTRIBUTE X_INTERFACE_INFO of m_axi_wo_wdata: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI WDATA";
  ATTRIBUTE X_INTERFACE_INFO of m_axi_wo_wstrb: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI WSTRB";
  ATTRIBUTE X_INTERFACE_INFO of m_axi_wo_wlast: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI WLAST";
  ATTRIBUTE X_INTERFACE_INFO of m_axi_wo_wvalid: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI WVALID";
  ATTRIBUTE X_INTERFACE_INFO of m_axi_wo_bready: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI BREADY";
  ATTRIBUTE X_INTERFACE_INFO of m_axi_wo_awcache: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI AWCACHE";

  ATTRIBUTE X_INTERFACE_INFO of m_axi_wi_wready: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI WREADY";
  ATTRIBUTE X_INTERFACE_INFO of m_axi_wi_bid: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI BID";
  ATTRIBUTE X_INTERFACE_INFO of m_axi_wi_bresp: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI BRESP";
  ATTRIBUTE X_INTERFACE_INFO of m_axi_wi_bvalid: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI BVALID";
  ATTRIBUTE X_INTERFACE_INFO of m_axi_wi_awready: SIGNAL is "xilinx.com:interface:aximm:1.0 M_AXI AWREADY";

begin

  --------------------------------------------------------------------
  -- Address Pipeline
  --------------------------------------------------------------------

  addr_en <= awvalid and m_axi_wi_awready;

  addr_proc : process (m_axi_aclk, m_axi_wi_awready, m_axi_wi_wacount, m_axi_wi_wready, m_axi_wi_wcount, m_axi_wi_bid, m_axi_wi_bresp, m_axi_wi_bvalid)
  begin
	if rising_edge(m_axi_aclk) then
      if m_axi_areset_n = '0' then	-- reset
		awvalid <= '0';

      elsif awvalid = '0' then		-- idle phase
		if enable = '1' and		-- writer enabled
                       addr_empty = '0' and	-- address available
                       active(3) = '0' then	-- below max
          awvalid <= '1';
		end if;
      end if;

      if awvalid = '1' then		-- active phase
		if m_axi_wi_awready = '1' then
          awvalid <= '0';
		end if;
      end if;
	end if;
  end process;

  m_axi_wo_awaddr <= addr_in when addr_in < ADDR_MAX else ADDR_MAX;
  m_axi_wo_awvalid <= awvalid;

  addr_enable <= addr_en;


  --------------------------------------------------------------------
  -- Data Pipeline
  --------------------------------------------------------------------

  SRL16E_inst : SRL16E
	generic map (
      INIT => x"0001")
	port map (
      CLK => m_axi_aclk,			-- Clock input
      CE => data_en,			-- Clock enable input
      D => wlast,				-- SRL data input
      Q => wlast,				-- SRL data output
      A0 => awlen_c(0),			-- Select[0] input
      A1 => awlen_c(1),			-- Select[1] input
      A2 => awlen_c(2),			-- Select[2] input
      A3 => awlen_c(3) );			-- Select[3] input

  data_en <= wvalid and m_axi_wi_wready;

  write_proc : process (m_axi_aclk, m_axi_wi_awready, m_axi_wi_wacount, m_axi_wi_wready, m_axi_wi_wcount, m_axi_wi_bid, m_axi_wi_bresp, m_axi_wi_bvalid)
  begin
	if rising_edge(m_axi_aclk) then
      if m_axi_areset_n = '0' then	-- reset
		wvalid <= '0';

      elsif wvalid = '0' then		-- idle phase
		if data_empty = '0' and		-- fifo not empty
                      active /= x"0" then		-- inactive
          wvalid <= '1';
		end if;

      else				-- active phase
		if wlast = '1' then
          wvalid <= '0';
		end if;
      end if;
	end if;
  end process;

  m_axi_wo_wdata(DATA_WIDTH - 1 downto 0) <= data_in;

  m_axi_wo_wvalid <= wvalid;
  m_axi_wo_wlast <= wlast;

  data_enable <= data_en;


  --------------------------------------------------------------------
  -- Response Pipeline
  --------------------------------------------------------------------

  resp_en <= bready and m_axi_wi_bvalid;

  bresp_proc : process (m_axi_aclk)
  begin
	if rising_edge(m_axi_aclk) then
      if m_axi_areset_n = '0' then	-- reset
		bready <= '0';

      elsif bready = '0' then		-- idle phase
		if enable = '1' then		-- writer enabled
          bready <= '1';
		end if;

      else				-- active phase
		if unconf = x"0" then		-- all done
          bready <= '0';
		end if;
      end if;
	end if;
  end process;

  m_axi_wo_bready <= bready;

  writer_error <= '1' when
                  resp_en = '1' and m_axi_wi_bresp /= "00" else '0';


  --------------------------------------------------------------------
  -- In Flight Accounting
  --------------------------------------------------------------------

  active_proc : process (m_axi_aclk)
  begin
	if rising_edge(m_axi_aclk) then
      if addr_en = '1' and
		wlast = '0' then		-- one more
		active <= active + "1";

      elsif addr_en = '0' and
		wlast = '1' then		-- one less
		active <= active - "1";

      end if;
	end if;
  end process;

  unconf_proc : process (m_axi_aclk)
  begin
	if rising_edge(m_axi_aclk) then
      if addr_en = '1' and
		resp_en = '0' then		-- one more
		unconf <= unconf + "1";

      elsif addr_en = '0' and
		resp_en = '1' then		-- one less
		unconf <= unconf - "1";

      end if;
	end if;
  end process;

  inactive <= '1' when active = x"0"
              and unconf = x"0" else '0';


  --------------------------------------------------------------------
  -- Constant Values, Clocks
  --------------------------------------------------------------------

  m_axi_wo_awid <= (others => '0');
  m_axi_wo_wid <= (others => '0');

  m_axi_wo_awlen <= awlen_c;

  m_axi_wo_awburst <= "01";

  -- 11 for 8 bytes
  -- 10 for 4 bytes
  m_axi_wo_awsize <= "011";

  m_axi_wo_wstrb <= write_strobe;

  m_axi_wo_awprot <= "000";
  m_axi_wo_awcache <= "0011";

  data_clk <= m_axi_aclk;
  addr_clk <= m_axi_aclk;

end RTL;
