library ieee;
use ieee.std_logic_1164.all;

---------------------------Entity Declaration------------------------------------------

entity Multiplier is  
	port( 	Input_A: 		in std_logic_vector(7 downto 0);
		Input_B: 		in std_logic_vector(7 downto 0);
	      	Output_C: 		out std_logic_vector(15 downto 0)
	);

end Multiplier;

--------------------------Architectures Declaration-------------------------------------

architecture Multiplier_Arch of Multiplier is

--------------------------Components Declaration----------------------------------------

component CarrySkipAdder is 
	generic (M :integer :=4); 	--Number Of Bits 
	port( 	Input_A: 		in std_logic_vector(M downto 1);
		Input_B: 		in std_logic_vector(M downto 1);
		Input_Cin: 		in std_logic;
		Output_Cout:		out std_logic;
	      	Output_Sum: 		out std_logic_vector(M downto 1)
	);

end component;

component CarrySaveAdder is 
	generic (M :integer :=4); 	--Number Of Bits 
	port( 	Input_A: 		in std_logic_vector(M downto 1);
		Input_B: 		in std_logic_vector(M downto 1);
		Input_C: 		in std_logic_vector(M downto 1);
		Output_Carry:		out std_logic_vector(M downto 1);
	      	Output_Sum: 		out std_logic_vector (M downto 1)
	);
end component;

--------------------------Architecture Internal Signals Declaration--------------------

signal PartialProduct_1:	std_logic_vector(8 downto 0);
signal PartialProduct_2:	std_logic_vector(7 downto 0);
signal PartialProduct_3:	std_logic_vector(7 downto 0);
signal PartialProduct_4:	std_logic_vector(7 downto 0);
signal PartialProduct_5:	std_logic_vector(7 downto 0);
signal PartialProduct_6:	std_logic_vector(7 downto 0);
signal PartialProduct_7:	std_logic_vector(7 downto 0);
signal PartialProduct_8:	std_logic_vector(8 downto 0);
signal Sum_1:			std_logic_vector(8 downto 0);
signal Carry_1:			std_logic_vector(8 downto 0);
signal AddA_1:			std_logic_vector(8 downto 0);
signal AddB_1:			std_logic_vector(8 downto 0);
signal AddC_1:			std_logic_vector(8 downto 0);
signal Sum_2:			std_logic_vector(8 downto 0);
signal Carry_2:			std_logic_vector(8 downto 0);
signal AddA_2:			std_logic_vector(8 downto 0);
signal AddB_2:			std_logic_vector(8 downto 0);
signal AddC_2:			std_logic_vector(8 downto 0);
signal Sum_3:			std_logic_vector(8 downto 0);
signal Carry_3:			std_logic_vector(8 downto 0);
signal AddA_3:			std_logic_vector(8 downto 0);
signal AddB_3:			std_logic_vector(8 downto 0);
signal AddC_3:			std_logic_vector(8 downto 0);
signal Sum_4:			std_logic_vector(8 downto 0);
signal Carry_4:			std_logic_vector(8 downto 0);
signal AddA_4:			std_logic_vector(8 downto 0);
signal AddB_4:			std_logic_vector(8 downto 0);
signal AddC_4:			std_logic_vector(8 downto 0);
signal Sum_5:			std_logic_vector(8 downto 0);
signal Carry_5:			std_logic_vector(8 downto 0);
signal AddA_5:			std_logic_vector(8 downto 0);
signal AddB_5:			std_logic_vector(8 downto 0);
signal AddC_5:			std_logic_vector(8 downto 0);
signal Sum_6:			std_logic_vector(9 downto 0);
signal Carry_6:			std_logic_vector(9 downto 0);
signal AddA_6:			std_logic_vector(9 downto 0);
signal AddB_6:			std_logic_vector(9 downto 0);
signal AddC_6:			std_logic_vector(9 downto 0);
signal Sum_7:			std_logic_vector(8 downto 0);
signal AddA_7:			std_logic_vector(8 downto 0);
signal AddB_7:			std_logic_vector(8 downto 0);
signal AuxCarry:		std_logic;

--------------------------Body of Architecture------------------------------------------

begin
	PartialProduct_1 <= '1' & (NOT (Input_A(7) AND Input_B(0))) & (Input_A(6) AND Input_B(0)) & (Input_A(5) AND Input_B(0)) & (Input_A(4) AND Input_B(0)) & (Input_A(3) AND Input_B(0)) & (Input_A(2) AND Input_B(0)) & (Input_A(1) AND Input_B(0)) & (Input_A(0) AND Input_B(0));
	PartialProduct_2 <= (NOT (Input_A(7) AND Input_B(1))) & (Input_A(6) AND Input_B(1)) & (Input_A(5) AND Input_B(1)) & (Input_A(4) AND Input_B(1)) & (Input_A(3) AND Input_B(1)) & (Input_A(2) AND Input_B(1)) & (Input_A(1) AND Input_B(1)) & (Input_A(0) AND Input_B(1));
	PartialProduct_3 <= (NOT (Input_A(7) AND Input_B(2))) & (Input_A(6) AND Input_B(2)) & (Input_A(5) AND Input_B(2)) & (Input_A(4) AND Input_B(2)) & (Input_A(3) AND Input_B(2)) & (Input_A(2) AND Input_B(2)) & (Input_A(1) AND Input_B(2)) & (Input_A(0) AND Input_B(2));
	PartialProduct_4 <= (NOT (Input_A(7) AND Input_B(3))) & (Input_A(6) AND Input_B(3)) & (Input_A(5) AND Input_B(3)) & (Input_A(4) AND Input_B(3)) & (Input_A(3) AND Input_B(3)) & (Input_A(2) AND Input_B(3)) & (Input_A(1) AND Input_B(3)) & (Input_A(0) AND Input_B(3));
	PartialProduct_5 <= (NOT (Input_A(7) AND Input_B(4))) & (Input_A(6) AND Input_B(4)) & (Input_A(5) AND Input_B(4)) & (Input_A(4) AND Input_B(4)) & (Input_A(3) AND Input_B(4)) & (Input_A(2) AND Input_B(4)) & (Input_A(1) AND Input_B(4)) & (Input_A(0) AND Input_B(4));
	PartialProduct_6 <= (NOT (Input_A(7) AND Input_B(5))) & (Input_A(6) AND Input_B(5)) & (Input_A(5) AND Input_B(5)) & (Input_A(4) AND Input_B(5)) & (Input_A(3) AND Input_B(5)) & (Input_A(2) AND Input_B(5)) & (Input_A(1) AND Input_B(5)) & (Input_A(0) AND Input_B(5));
	PartialProduct_7 <= (NOT (Input_A(7) AND Input_B(6))) & (Input_A(6) AND Input_B(6)) & (Input_A(5) AND Input_B(6)) & (Input_A(4) AND Input_B(6)) & (Input_A(3) AND Input_B(6)) & (Input_A(2) AND Input_B(6)) & (Input_A(1) AND Input_B(6)) & (Input_A(0) AND Input_B(6));
	PartialProduct_8 <= '1' & (Input_A(7) AND Input_B(7)) & (NOT (Input_A(6) AND Input_B(7))) & (NOT (Input_A(5) AND Input_B(7))) & (NOT (Input_A(4) AND Input_B(7))) & (NOT (Input_A(3) AND Input_B(7))) & (NOT (Input_A(2) AND Input_B(7))) & (NOT (Input_A(1) AND Input_B(7))) & (NOT (Input_A(0) AND Input_B(7)));
	
	Output_C(0) <= PartialProduct_1(0);
	
	AddA_1 <= '0' & PartialProduct_1(8 downto 1);
	AddB_1 <= '0' & PartialProduct_2;
	AddC_1 <= PartialProduct_3 & '0';
	First_Add:	CarrySaveAdder generic map(9) port map(	Input_A => AddA_1,
								Input_B => AddB_1,
								Input_C => AddC_1,
								Output_Carry => Carry_1,
								Output_Sum => Sum_1
								);
	Output_C(1) <= Sum_1(0);
	
	AddA_2 <= '0' & Sum_1(8 downto 1);
	AddB_2 <= Carry_1;
	AddC_2 <= PartialProduct_4 & '0';
	Second_Add:	CarrySaveAdder generic map(9) port map(	Input_A => AddA_2,
								Input_B => AddB_2,
								Input_C => AddC_2,
								Output_Carry => Carry_2,
								Output_Sum => Sum_2
								);
	Output_C(2) <= Sum_2(0);

	AddA_3 <= '0' & Sum_2(8 downto 1);
	AddB_3 <= Carry_2;
	AddC_3 <= PartialProduct_5 & '0';
	Third_Add:	CarrySaveAdder generic map(9) port map(	Input_A => AddA_3,
								Input_B => AddB_3,
								Input_C => AddC_3,
								Output_Carry => Carry_3,
								Output_Sum => Sum_3
								);
	Output_C(3) <= Sum_3(0);

	AddA_4 <= '0' & Sum_3(8 downto 1);
	AddB_4 <= Carry_3;
	AddC_4 <= PartialProduct_6 & '0';
	Fourth_Add:	CarrySaveAdder generic map(9) port map(	Input_A => AddA_4,
								Input_B => AddB_4,
								Input_C => AddC_4,
								Output_Carry => Carry_4,
								Output_Sum => Sum_4
								);
	Output_C(4) <= Sum_4(0);


	AddA_5 <= '0' & Sum_4(8 downto 1);
	AddB_5 <= Carry_4;
	AddC_5 <= PartialProduct_7 & '0';
	Fifth_Add:	CarrySaveAdder generic map(9) port map(	Input_A => AddA_5,
								Input_B => AddB_5,
								Input_C => AddC_5,
								Output_Carry => Carry_5,
								Output_Sum => Sum_5
								);
	Output_C(5) <= Sum_5(0);

	AddA_6 <= "00" & Sum_5(8 downto 1);
	AddB_6 <= '0' & Carry_5;
	AddC_6 <= PartialProduct_8 & '0';
	Sixth_Add:	CarrySaveAdder generic map(10) port map(	Input_A => AddA_6,
									Input_B => AddB_6,
									Input_C => AddC_6,
									Output_Carry => Carry_6,
									Output_Sum => Sum_6
								);
	Output_C(6) <= Sum_6(0);
	
	AddA_7 <= Sum_6(9 downto 1);
	AddB_7 <= Carry_6(8 downto 0);
	Carry_Skip_Add:	CarrySkipAdder generic map(9) port map(		Input_A => AddA_7,
									Input_B => AddB_7,
									Input_Cin => '0',
									Output_Cout => AuxCarry,
	      								Output_Sum => Sum_7
								);

	Output_C(15 downto 7) <= Sum_7;

end Multiplier_Arch;
