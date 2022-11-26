library ieee;
use ieee.std_logic_1164.all;

---------------------------Entity Declaration------------------------------------------

entity FullAdderPropagate is 

	port( 	Input_A: 		in std_logic;
              	Input_B: 		in std_logic;
		Input_Cin:		in std_logic;
		Output_Propagate:	out std_logic;
		Output_Sum:		out std_logic;
	      	Output_Cout: 		out std_logic
	);

end FullAdderPropagate;

--------------------------Architectures Declaration-------------------------------------

architecture FullAdderPropagate_Arch of FullAdderPropagate is

--------------------------Architecture Internal Signals Declaration--------------------

signal A_XOR_B:		std_logic;	--Signal 1
signal A_AND_B:		std_logic;
signal Sig1_AND_Cin:	std_logic;

--------------------------Body of Architecture------------------------------------------

begin

	A_XOR_B <= Input_A XOR Input_B;
	A_AND_B <= Input_A AND Input_B;
	Sig1_AND_Cin <= A_XOR_B AND Input_Cin;
	Output_Propagate <= A_XOR_B;
	Output_Sum <= A_XOR_B XOR Input_Cin;
	Output_Cout <= A_AND_B OR Sig1_AND_Cin;	

end FullAdderPropagate_Arch;

