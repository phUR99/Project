* or example source code

*********************** transistor tech file ****************************
.include mosfet.txt
*************************************************************************

************* Define the input signal info. *****************************
.PARAM	bitrate1=0.2G
	+freq1='bitrate1/2'
	+per1='1/freq1'
	+td1=0
	+tr1='per1*0.1'
	+tf1='per1*0.1'
	+pw1='per1*0.4'


.PARAM	bitrate2=0.1G
	+freq2='bitrate2/2'
	+per2='1/freq2'
	+td2=0
	+tr2='per2*0.05'
	+tf2='per2*0.05'
	+pw2='per2*0.4'

.PARAM	bitrate3=0.05G
	+freq3='bitrate3/2'
	+per3='1/freq3'
	+td3=0
	+tr3='per3*0.025'
	+tf3='per3*0.025'
	+pw3='per3*0.4'

Vin1	in1	0	pulse(0 3.3 td1 tr1 tf1 pw1 per1 )
Vin2	in2	0	pulse(0 3.3 td2 tr2 tf2 pw2 per2 )
Vin3	cin	0	pulse(0 3.3 td3 tr3 tf3 pw3 per3 )
*************************************************************************

************* Define the Vdd and Vss voltage level***********************
Vdd	vdd	0	DC	3.3v
*************************************************************************

************* Your Circuits *********************************************
X1	in1	in2     n1      vdd	0       nand
X2	in1	n1	n2	vdd	0	nand
X3	n1	in2	n3	vdd     0	nand
X4	n2	n3	n4	vdd	0	nand
X5	n4	cin	n5	vdd	0	nand
X6	n4	n5	n6	vdd	0	nand
X7	n5	cin	n7	vdd	0	nand
X8	n5	n1	Cout	vdd	0	nand
X9	n6	n7	Sum	vdd	0	nand
*************************************************************************

************* Subcircuits ***********************************************

.subckt	nand	in1	in2     out	vdd	gnd
Mp1	        out	in1	vdd	vdd	PMOS	l=0.5u	w=20u
Mp2	        out	in2	vdd	vdd	PMOS	l=0.5u	w=20u
Mn1	        out	in1	n1	gnd	NMOS	l=0.5u	w=10u
Mn2	         n1	in2	gnd	gnd	NMOS	l=0.5u	w=10u
.ends
*************************************************************************

************* Define the resoltion and simulation time ******************
.tran 1p 25n
*************************************************************************

************* Plot the results ******************************************
.control
.options color0=white
run
plot v(in1) v(in2) v(cin) 
plot v(Cout) v(Sum) 
.endc
*************************************************************************

.end