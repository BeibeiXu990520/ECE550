<h1>
Zezhong Zhang (zz258)<br>
Keyu Chen (kc487)
</h1>
<hr>

<h3>Design Description:</h3>

This ALU has the following components: adder, shifter, logicer, isNotEqualDetecter, isLessThanDetecter. 
Adder, shifter and logicer work in parallel, producing results to be selected by muxes. The isNotEqualDetecter and isLessThanDetecter then use their results to output.

 
1. <h5>Adder:</h5>
Adder is used to calculate add and subtraction. Adder is composed of one 32-bit CSA, a 32-bit mux and a 32-bit not gate. <br>
32-bit mux and 32-bit not gate are used to produce an operand's one's complement and select the correct representation of this operand.<br>
The 32-bit CSA includes three 16-bit CSA and 3 muxes to select high 16-bit result, overflow and carry out.<br>
Recursively, 16-bit CSA includes three 8-bit CSA and 3 muxes. 8-bit CSA includes three 4-bit RCA and 3 muxes.<br>
A 4-bit RCA is composed of 4 full adders connected in series.<br>

2. <h5>Shifter:</h5>
Shifter is used to do SLL(Logical Left Shift) and SRA(Shift Right Arithmetic). Since the direction of SLL and SRA are inverse, the shifter has two components for them seperately. And each of them is implemented by 5 layers of muxes.

3.	<h5>Logicer</h5>
Logicer is used to do bit wise or and and. We just connect all or gates and and gates in parallel.

4.	<h5>isNotEqualDetecter/isLessThanDetecter</h5>
Use the output of adder(32-bit result, overflow, carry-out) to produce the correct output.
