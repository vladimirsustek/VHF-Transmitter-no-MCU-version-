--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;
--------------------------------------------------------------------------------
entity fm_transmitter is
  port(
    CLK : in    std_logic;
	 CLK_LFC : in std_logic;
	 	 
	 BTN_0 : in std_logic;
	 BTN_1 : in std_logic;
	 
	 LEDS : out std_logic_vector(3 downto 0);

	 ADC0_NCS : out std_logic;
	 ADC0_SDI : in std_logic;
	 ADC0_SCLK : out std_logic;

	 ADC1_NCS : out std_logic;
	 ADC1_SDI : in std_logic;
	 ADC1_SCLK : out std_logic;
	 
	 DAC0_CLK : out std_logic;
	 DAC0_DATA : out std_logic_vector(9 downto 0);
	 
	 -- DAC1 inputs workaround (otherwise DAC1 failure)
	 PORTD : in std_logic_vector(7 downto 6);
	 PORTE : in std_logic_vector(0 downto 0);
	 
	 DAC1_NLDAC : out std_logic;
	 DAC1_SCLK : out std_logic;
	 DAC1_NCS : out std_logic;
	 DAC1_MOSI : out std_logic;
	 DAC1_MISO : in std_logic;
	 
	 SYS_NRST : in std_logic);
	 
end fm_transmitter;
--------------------------------------------------------------------------------
 architecture Behavioral of fm_transmitter is
--------------------------------------------------------------------------------
	
	COMPONENT clk_enabler
	PORT(
		clk_i : IN std_logic;
	   hf_clk_i : IN std_logic;
		reset_i : IN std_logic;          
		clk_en_10Hz_o : OUT std_logic;
		clk_en_230400Hz_o : OUT std_logic;
		clk_en_22kHz_o : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT adc_interface
	PORT(
		clk_i : IN std_logic;
		reset_i : IN std_logic;
		clk_en_i : IN std_logic;
		miso_i : IN std_logic;          
		mosi_o : OUT std_logic;
		sclk_o : OUT std_logic;
		ncs_o : OUT std_logic;
		voltage_o : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
	COMPONENT da1_interface
	PORT(
		clk_i : IN std_logic;
		reset_i : IN std_logic;
		miso_i : IN std_logic;
		voltage_i : IN std_logic_vector(15 downto 0);          
		mosi_o : OUT std_logic;
		sclk_o : OUT std_logic;
		ncs_o : OUT std_logic;
		nldac_o : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT DDS_RF
	  PORT (
		 ce : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 pinc_in : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
		 rdy : OUT STD_LOGIC;
		 sine : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	  );
	END COMPONENT;

	component ClockUp
	port
	 (-- Clock in ports
	  CLK_IN1           : in     std_logic;
	  -- Clock out ports
	  CLK_OUT1          : out    std_logic;
	  CLK_OUT2          : out    std_logic;
	  -- Status and control signals
	  RESET             : in     std_logic;
	  LOCKED            : out    std_logic
	 );
	end component;
	
	COMPONENT keyboard_interface
	PORT(
		clk_i : IN std_logic;
		clk_lfc_i : IN std_logic;
		clk_22kHz : IN std_logic;
		clk_10Hz : IN std_logic;
		btn_0_i : IN std_logic;
		btn_1_i : IN std_logic;
		reset_i : IN std_logic;          
		num_0_o : out  STD_LOGIC_VECTOR (24 downto 0);
		num_1_o : OUT std_logic_vector(15 downto 0);
		state_o : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT DDS_LF
	  PORT (
		 ce : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 pinc_in : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
		 sine : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	  );
	END COMPONENT;
  ------------------------------------------------------------------------------
  
  constant c19kHzOffset : std_logic_vector(12 downto 0) := "1010011001010";
  signal sigCentralReset : std_logic := '0';
  
  signal sigDDSphInc : std_logic_vector(24 downto 0) := (others => '0');
  signal sigDDSphIncPreset : std_logic_vector(24 downto 0) := (others => '0');
  signal sigDDSpilotPhInc : std_logic_vector(24 downto 0) := (others => '0');
  signal sigManualVoltage : std_logic_vector(15 downto 0) := (others => '0');
  
  signal sigCLKBuff : std_logic := '0';
  signal sigClkHF : std_logic := '0';
  signal sigNotClkHF : std_logic := '0';
  
  signal sigKeyboardInterfaceState : std_logic_vector(1 downto 0) := (others => '0');
  signal sigADCaudio_0 : std_logic_vector(15 downto 0) := (others => '0');
  signal sigADCaudio_1 : std_logic_vector(15 downto 0) := (others => '0');
  signal sigDACinput : std_logic_vector(15 downto 0) := (others => '0');
  
  signal sig10Hz : std_logic := '0';
  signal sig230400Hz : std_logic := '0';
  signal sig22kHz : std_logic := '0';
  
  signal sigDDSPilot : std_logic_vector(6 downto 0) := (others => '0');
  signal sigDDSMonoRpL : std_logic_vector(9 downto 0) := (others => '0');
    
  type adjust_type is (NONE, DDS_PHINC, DAC_1_VOLT);
  
  signal sigAdjustVariable : adjust_type := NONE;
begin
--------------------------------------------------------------------------------

	DAC0_DATA <= std_logic_vector(unsigned(sigDDSMonoRpL) - shift_right(unsigned(sigDDSMonoRpL), 3) + unsigned(sigDDSPilot));
	
	LEDS(1 downto 0) <= sigKeyboardInterfaceState;		

	sigNotClkHF <= not(sigClkHF);
	
	sigCentralReset <= SYS_NRST;
	
	sigDDSphInc <= std_logic_vector(unsigned(sigDDSphIncPreset) + shift_left((unsigned(sigADCaudio_0) + unsigned(sigADCaudio_1)), 3) + shift_left((unsigned(sigADCaudio_0) + unsigned(sigADCaudio_1)), 1) + 8);
	
	sigDDSpilotPhInc <= std_logic_vector(unsigned(sigDDSphIncPreset) + unsigned(c19kHzOffset));
	
	device_state : process(SYS_NRST, CLK_LFC)
	begin
		if SYS_NRST = '1' then
			LEDS(2) <= '0';
			LEDS(3) <= '0';
		else
			LEDS(2) <= not(CLK_LFC);
			LEDS(3) <= CLK_LFC;
		end if;
	end process;
		
	  CLK_conversion : ClockUp
  port map
   (-- Clock in ports
    CLK_IN1 => CLK,
    -- Clock out ports
    CLK_OUT1 => sigClkHF,
    CLK_OUT2 => sigCLKBuff,
    -- Status and control signals
    RESET  => sigCentralReset,
    LOCKED => open);
	 
	 Inst_clk_enabler: clk_enabler PORT MAP(
	 clk_i => sigCLKBuff,
	 hf_clk_i => sigClkHF,
	 reset_i => sigCentralReset,
	 clk_en_10Hz_o => sig10Hz,
	 clk_en_230400Hz_o => sig230400Hz,
	 clk_en_22kHz_o => sig22kHz
	);
	
	MONO_RplusR : DDS_RF
  PORT MAP (
    ce => not(sigCentralReset),
    clk => sigClkHF,
    pinc_in => sigDDSphInc,
    rdy => open,
    sine => sigDDSMonoRpL
  );
  
  	Pilot : DDS_LF
  PORT MAP (
    ce => not(sigCentralReset),
    clk => sigCLKBuff,
    pinc_in => sigDDSpilotPhInc,
    sine => sigDDSPilot
  );
  
	DA0_CLK_O : ODDR2
	generic map(
	  DDR_ALIGNMENT => "NONE",
	  INIT => '0',
	  SRTYPE => "SYNC")
	port map (
	  Q => DAC0_CLK,
	  C0 => sigClkHF,
	  C1 => sigNotClkHF,
	  CE => '1',
	  D0 => '1',
	  D1 => '0',
	  R => sigCentralReset,
	  S =>'0'
	);
	
	main_audio_adc: adc_interface PORT MAP(
		clk_i => sigCLKBuff,
		reset_i => sigCentralReset,
		clk_en_i => '1',
		miso_i => ADC0_SDI,
		mosi_o => open,
		sclk_o => ADC0_SCLK,
		ncs_o => ADC0_NCS,
		voltage_o => sigADCaudio_0
	);
	
	second_audio_adc: adc_interface PORT MAP(
		clk_i => sigCLKBuff,
		reset_i => sigCentralReset,
		clk_en_i => '1',
		miso_i => ADC1_SDI,
		mosi_o => open,
		sclk_o => ADC1_SCLK,
		ncs_o => ADC1_NCS,
		voltage_o => sigADCaudio_1
	);	
		Inst_da1_interface: da1_interface PORT MAP(
		clk_i => sigCLKBuff,
		reset_i => sigCentralReset,
		miso_i => DAC1_MISO,
		voltage_i => sigManualVoltage,
		mosi_o => DAC1_MOSI,
		sclk_o => DAC1_SCLK,
		ncs_o => DAC1_NCS,
		nldac_o => DAC1_NLDAC
	);
	
	Inst_keyboard_interface: keyboard_interface PORT MAP(
		clk_i => sigCLKBuff,
		clk_lfc_i => CLK_LFC,
		clk_22kHz => sig22kHz,
		clk_10Hz => sig10Hz,
		btn_0_i => BTN_0,
		btn_1_i => BTN_1,
		reset_i => sigCentralReset,
		num_0_o => sigDDSphIncPreset,
		num_1_o => sigManualVoltage,
		state_o => sigKeyboardInterfaceState 
	);
		
  
--------------------------------------------------------------------------------
end Behavioral;
--------------------------------------------------------------------------------
