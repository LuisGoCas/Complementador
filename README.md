Complementador
==============

<h2>Complementador a 2 de 8 bits</h2>

<h3>Input  A: 8 bits number</h3>
<h3>Output B: A 2-complement </h3>

Despite the fact that it is possible to specify
this circuit as a big combinational design, it
becomes quite cumbersome as the number of bits increases,
thus by taking the structural approach we can guarantee
an easy to manage and scalable system which makes it 
relatively straightforward to modify for a bigger 
number of bits however, the real main reason for this
project is to grasp the workflow of an ASM
and the general steps in structural design which includes
registers and Control Units Block.

Project for starting to learn structural Design in VHDL
<h4>The proyect contains:</h4>
<ul>
<li>1 Top file : complementador.vhd</li>
<li>2 Registers </li>
<li>1 Control Unit </li>
<li>1 Combinational Circuit </li>
</ul>
<h4>Main workflow idea:</h4>
the algorithm finds the first "1" starting from its lsb, and then negates (complements) the bits at the left of it.
