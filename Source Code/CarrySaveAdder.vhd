library ieee;
use ieee.std_logic_1164.all;

---------------------------Entity Declaration------------------------------------------

entity CarrySaveAdder is 
	generic (M :integer :=4); --Number Of Bits 
	port( 	Input_A: 		in std_logic_vector(M downto 1);
		Input_B: 		in std_logic_vector(M downto 1);
		Input_C: 		in std_logic_vector(M downto 1);
		Output_Carry:		out std_logic_vector(M downto 1);
	      	Output_Sum: 		out std_logic_vector (M downto 1)
	);
end CarrySaveAdder;

--------------------------Architectures Declaration-------------------------------------

architecture CarrySaveAdder_Arch of CarrySaveAdder is

--------------------------Components Declaration----------------------------------------

component FullAdder is 
	port( 	Input_A: 		in std_logic;
              	Input_B: 		in std_logic;
		Input_Cin:		in std_logic;
		Output_Sum:		out std_logic;
	      	Output_Cout: 		out std_logic
	);
end component;

--------------------------Architecture Internal Signals Declaration--------------------

--------------------------Body of Architecture------------------------------------------

begin
	Generate_Adders:
		for i in 1 to M generate
			Adder_i:	FullAdder port map (Input_A => Input_A(i), Input_B => Input_B(i), Input_Cin => Input_C(i), Output_Sum => Output_Sum(i), Output_Cout => Output_Carry(i));
		end generate;
end CarrySaveAdder_Arch;
