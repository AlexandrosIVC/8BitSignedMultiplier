library ieee;
use ieee.std_logic_1164.all;

---------------------------Entity Declaration------------------------------------------

entity CarrySkipAdder is 
	generic (M :integer :=4); --Number Of Bits 
	port( 	Input_A: 		in std_logic_vector(M downto 1);
		Input_B: 		in std_logic_vector(M downto 1);
		Input_Cin: 		in std_logic;
		Output_Cout:		out std_logic;
	      	Output_Sum: 		out std_logic_vector(M downto 1)
	);

end CarrySkipAdder;

--------------------------Architectures Declaration-------------------------------------

architecture CarrySkipAdder_Arch of CarrySkipAdder is

--------------------------Components Declaration----------------------------------------

component FullAdderPropagate is 
	port( 	Input_A: 		in std_logic;
              	Input_B: 		in std_logic;
		Input_Cin:		in std_logic;
		Output_Propagate:	out std_logic;
		Output_Sum:		out std_logic;
	      	Output_Cout: 		out std_logic
	);
end component;

component Mux2to1 is 
	port( 	Input_A: 		in std_logic;
              	Input_B: 		in std_logic;
		Input_Select:		in std_logic;
	      	Output_Mux: 		out std_logic
	);
end component;

--------------------------Architecture Internal Signals Declaration--------------------

signal Carry:		std_logic_vector(M downto 0);
signal Propagate:	std_logic_vector(M downto 1);
signal Sel:		std_logic;

--------------------------Body of Architecture------------------------------------------

begin
	Carry(0) <= Input_Cin;
	Generate_Adders:
		for i in 1 to M generate
			Adder_i:	FullAdderPropagate port map (Input_A => Input_A(i), Input_B => Input_B(i), Input_Cin => Carry(i-1), Output_Propagate => Propagate(i), Output_Sum => Output_Sum(i), Output_Cout => Carry(i));
		end generate;
	Sel <= '1' when (Propagate=(Propagate'range => '1')) else '0';
	MUX_Operation:	Mux2to1 port map ( Input_A => Carry(M), Input_B => Carry(0), Input_Select => Sel, Output_MUX => Output_Cout);

end CarrySkipAdder_Arch;

