* nor example source code

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

Vin1	in1	0	pulse(0 3.3 td1 tr1 tf1 pw1 per1 )
Vin2	in2	0	pulse(0 3.3 td2 tr2 tf2 pw2 per2 )
*************************************************************************

************* Define the Vdd and Vss voltage level***********************
Vdd	vdd	0	DC	3.3v
*************************************************************************

************* Your Circuits *********************************************
X1	in1	in2	out      vdd	0      nor
*************************************************************************

************* Subcircuits ***********************************************

.subckt	nor	in1	in2     out	vdd	gnd
Mp1	n1	in1	vdd	vdd	PMOS	l=0.5u	w=20u
Mp2	out	in2	n1	vdd	PMOS	l=0.5u	w=20u
Mn1	out	in1	gnd	gnd	NMOS	l=0.5u	w=10u
Mn2	out	in2	gnd	gnd	NMOS	l=0.5u	w=10u
.ends
*************************************************************************

************* Define the resoltion and simulation time ******************
.tran 1p 25n
*************************************************************************

************* Plot the results ******************************************
.control
run
plot	v(in1) v(in2) v(out)
.endc
*************************************************************************

.end