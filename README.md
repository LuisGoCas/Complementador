Complementador
==============

<h2>Complementador a 2 de 8 bits</h2>

<h3>Input  A: 8 bits number</h3>
<h3>Output B: A 2-complement </h3>

Even though there's the possibility to do 
this as a big combinational circuit, the aim
of this project is to understand the workflow 
of an ASM and its structural design using a
Control Block.

Project for starting to learn structural Design in VHDL
<h4>The proyect contains:</h4>
<ul>
<li>1 Top file : complementador.vhd</li>
<li>2 Registers </li>
<li>1 Control Unit </li>
<li>1 Combinational Circuit </li>
</ul>
<h4>Main workflow idea:</h4>
the algorithm finds the first "1" starting from its lsb, and then negates (complements) the bits at the left.
