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
X1	in1	in2	cin     X      vdd	0      A
X2	X	Cout	vdd	0	inv1
X3	X	in1	in2	cin     Y      vdd	0      B
X4	Y	Sum	vdd	0	inv2
*************************************************************************

************* Subcircuits ***********************************************

.subckt	A	in1	in2	cin	out	vdd	gnd
Mp1	out	in1	n1	vdd	PMOS	l=0.5u	w=20u
Mp2	n1	in2	n2	vdd	PMOS	l=0.5u	w=20u
Mp3	n2	in1	vdd	vdd	PMOS	l=0.5u	w=20u
Mp4	out	cin	n2	vdd	PMOS	l=0.5u	w=20u
Mp5	n2	in2	vdd	vdd	PMOS	l=0.5u	w=20u

Mn1	n4	in1	gnd	gnd	NMOS	l=0.5u	w=10u
Mn2	n4	in2	gnd	gnd	NMOS	l=0.5u	w=10u
Mn3	out	in1	n5	gnd	NMOS	l=0.5u	w=10u
Mn4	out	cin	n4	gnd	NMOS	l=0.5u	w=10u
Mn5	n5	in2	gnd	gnd	NMOS	l=0.5u	w=10u
.ends

.subckt	inv1	in	out	vdd	gnd
Mp1	out	in	vdd	vdd	PMOS	l=0.5u	w=20u
Mn1	out	in	gnd	gnd	NMOS	l=0.5u	w=10u
.ends

.subckt	B	in 	in1	in2     cin	out	vdd	gnd
Mp1	n4	cin	vdd	vdd	PMOS	l=0.5u	w=20u
Mp2	n4	in1	vdd	vdd	PMOS	l=0.5u	w=20u
Mp3	n4	in2	vdd	vdd	PMOS	l=0.5u	w=20u
Mp4	n5	in1	n4	vdd	PMOS	l=0.5u	w=20u
Mp5	n6	in2	n5	vdd	PMOS	l=0.5u	w=20u
Mp6	out	cin	n6	vdd	PMOS	l=0.5u	w=20u
Mp7	out	in	n4	vdd	PMOS	l=0.5u	w=20u


Mn1	n1	in1	gnd	gnd	NMOS	l=0.5u	w=10u
Mn2	n1	in2	gnd	gnd	NMOS	l=0.5u	w=10u
Mn3	n1	cin	gnd	gnd	NMOS	l=0.5u	w=10u
Mn4	out	cin	n2	gnd	NMOS	l=0.5u	w=10u
Mn5	n2	in1	n3	gnd	NMOS	l=0.5u	w=10u
Mn6	n3	in2	gnd	gnd	NMOS	l=0.5u	w=10u
Mn7	out	in	n1	gnd	NMOS	l=0.5u	w=10u

.ends

.subckt	inv2	in	out	vdd	gnd
Mp1	out	in	vdd	vdd	PMOS	l=0.5u	w=20u
Mn1	out	in	gnd	gnd	NMOS	l=0.5u	w=10u
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