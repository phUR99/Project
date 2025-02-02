* SPICE3 file created from /home/hw4/2bit_counter.ext - technology: scmos

*********************** transistor tech file ****************************
.include mosfet.txt
*************************************************************************

************* Define the input signal info. *****************************
Vin1	clk	0	pulse(0 3.3 0 0 0 10n 20n)
Vin2	M	0	pulse(0 3.3 0 0 0 90n 190n)
Vin3	logic1	0	pulse(0 3.3 0 0 0 300n 0)

*************************************************************************

************* Define the vdd and Vss voltage level***********************
vdd	vdd	0	DC	3.3v
*************************************************************************

************* Your Circuits *********************************************
X1	clk	M	Logic1	   Q1	  Q2	vdd	0	counter
*************************************************************************

************* Subcircuits ***********************************************
.subckt	counter	clk	M	Logic1	   Q1	  Q2	vdd	gnd

M1000 BQ2 tff_1/dff_0/nand2_7/in1 vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=630p ps=819u 
M1001 vdd Q2 BQ2 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1002 tff_1/dff_0/nand2_7/a_1_n26# tff_1/dff_0/nand2_7/in1 gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=315p ps=432u 
M1003 BQ2 Q2 tff_1/dff_0/nand2_7/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1004 tff_1/dff_0/nand2_7/in1 tff_1/dff_0/nand2_4/in1 vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1005 vdd clk tff_1/dff_0/nand2_7/in1 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1006 tff_1/dff_0/nand2_4/a_1_n26# tff_1/dff_0/nand2_4/in1 gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1007 tff_1/dff_0/nand2_7/in1 clk tff_1/dff_0/nand2_4/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1008 tff_1/dff_0/nand2_4/in1 tff_1/dff_0/nand2_3/in1 vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1009 vdd tff_1/dff_0/nand2_5/in1 tff_1/dff_0/nand2_4/in1 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1010 tff_1/dff_0/nand2_3/a_1_n26# tff_1/dff_0/nand2_3/in1 gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1011 tff_1/dff_0/nand2_4/in1 tff_1/dff_0/nand2_5/in1 tff_1/dff_0/nand2_3/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1012 tff_1/dff_0/nand2_3/in1 tff_1/dff_0/inv_1/out vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1013 vdd tff_1/dff_0/inv_0/out tff_1/dff_0/nand2_3/in1 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1014 tff_1/dff_0/nand2_1/a_1_n26# tff_1/dff_0/inv_1/out gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1015 tff_1/dff_0/nand2_3/in1 tff_1/dff_0/inv_0/out tff_1/dff_0/nand2_1/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1016 tff_1/dff_0/inv_1/out clk vdd vdd PMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1017 tff_1/dff_0/inv_1/out clk gnd gnd NMOS w=2u l=1.5u
+ ad=5p pd=9u as=0p ps=0u 
M1018 Q2 tff_1/dff_0/nand2_6/in1 vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1019 vdd BQ2 Q2 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1020 tff_1/dff_0/nand2_6/a_1_n26# tff_1/dff_0/nand2_6/in1 gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1021 Q2 BQ2 tff_1/dff_0/nand2_6/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1022 tff_1/dff_0/nand2_6/in1 tff_1/dff_0/nand2_5/in1 vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1023 vdd clk tff_1/dff_0/nand2_6/in1 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1024 tff_1/dff_0/nand2_5/a_1_n26# tff_1/dff_0/nand2_5/in1 gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1025 tff_1/dff_0/nand2_6/in1 clk tff_1/dff_0/nand2_5/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1026 tff_1/dff_0/nand2_5/in1 tff_1/dff_0/nand2_2/in1 vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1027 vdd tff_1/dff_0/nand2_4/in1 tff_1/dff_0/nand2_5/in1 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1028 tff_1/dff_0/nand2_2/a_1_n26# tff_1/dff_0/nand2_2/in1 gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1029 tff_1/dff_0/nand2_5/in1 tff_1/dff_0/nand2_4/in1 tff_1/dff_0/nand2_2/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1030 tff_1/dff_0/nand2_2/in1 tff_1/dff_0/D vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1031 vdd tff_1/dff_0/inv_1/out tff_1/dff_0/nand2_2/in1 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1032 tff_1/dff_0/nand2_0/a_1_n26# tff_1/dff_0/D gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1033 tff_1/dff_0/nand2_2/in1 tff_1/dff_0/inv_1/out tff_1/dff_0/nand2_0/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1034 tff_1/dff_0/inv_0/out tff_1/dff_0/D vdd vdd PMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1035 tff_1/dff_0/inv_0/out tff_1/dff_0/D gnd gnd NMOS w=2u l=1.5u
+ ad=5p pd=9u as=0p ps=0u 
M1036 tff_1/dff_0/D tff_1/xor2_0/nand2_3/in1 vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1037 vdd tff_1/xor2_0/nand2_3/in2 tff_1/dff_0/D vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1038 tff_1/xor2_0/nand2_3/a_1_n26# tff_1/xor2_0/nand2_3/in1 gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1039 tff_1/dff_0/D tff_1/xor2_0/nand2_3/in2 tff_1/xor2_0/nand2_3/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1040 tff_1/xor2_0/nand2_3/in2 tff_1/T vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1041 vdd tff_1/xor2_0/nand2_2/in2 tff_1/xor2_0/nand2_3/in2 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1042 tff_1/xor2_0/nand2_2/a_1_n26# tff_1/T gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1043 tff_1/xor2_0/nand2_3/in2 tff_1/xor2_0/nand2_2/in2 tff_1/xor2_0/nand2_2/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1044 tff_1/xor2_0/nand2_3/in1 Q2 vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1045 vdd tff_1/xor2_0/nand2_2/in2 tff_1/xor2_0/nand2_3/in1 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1046 tff_1/xor2_0/nand2_1/a_1_n26# Q2 gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1047 tff_1/xor2_0/nand2_3/in1 tff_1/xor2_0/nand2_2/in2 tff_1/xor2_0/nand2_1/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1048 tff_1/xor2_0/nand2_2/in2 Q2 vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1049 vdd tff_1/T tff_1/xor2_0/nand2_2/in2 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1050 tff_1/xor2_0/nand2_0/a_1_n26# Q2 gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1051 tff_1/xor2_0/nand2_2/in2 tff_1/T tff_1/xor2_0/nand2_0/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1052 inv_0/out M vdd vdd PMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1053 inv_0/out M gnd gnd NMOS w=2u l=1.5u
+ ad=5p pd=9u as=0p ps=0u 
M1054 or2_0/in2 and2_0/inv_0/in vdd vdd PMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1055 or2_0/in2 and2_0/inv_0/in gnd gnd NMOS w=2u l=1.5u
+ ad=5p pd=9u as=0p ps=0u 
M1056 and2_0/inv_0/in M vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1057 vdd BQ1 and2_0/inv_0/in vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1058 and2_0/nand2_0/a_1_n26# M gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1059 and2_0/inv_0/in BQ1 and2_0/nand2_0/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1060 tff_1/T or2_0/inv_1/out vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1061 vdd or2_0/inv_0/out tff_1/T vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1062 or2_0/nand2_0/a_1_n26# or2_0/inv_1/out gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1063 tff_1/T or2_0/inv_0/out or2_0/nand2_0/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1064 or2_0/inv_0/out or2_0/in2 vdd vdd PMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1065 or2_0/inv_0/out or2_0/in2 gnd gnd NMOS w=2u l=1.5u
+ ad=5p pd=9u as=0p ps=0u 
M1066 or2_0/inv_1/out or2_0/in1 vdd vdd PMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1067 or2_0/inv_1/out or2_0/in1 gnd gnd NMOS w=2u l=1.5u
+ ad=5p pd=9u as=0p ps=0u 
M1068 or2_0/in1 and2_1/inv_0/in vdd vdd PMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1069 or2_0/in1 and2_1/inv_0/in gnd gnd NMOS w=2u l=1.5u
+ ad=5p pd=9u as=0p ps=0u 
M1070 and2_1/inv_0/in inv_0/out vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1071 vdd Q1 and2_1/inv_0/in vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1072 and2_1/nand2_0/a_1_n26# inv_0/out gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1073 and2_1/inv_0/in Q1 and2_1/nand2_0/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1074 BQ1 tff_0/dff_0/nand2_7/in1 vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1075 vdd Q1 BQ1 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1076 tff_0/dff_0/nand2_7/a_1_n26# tff_0/dff_0/nand2_7/in1 gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1077 BQ1 Q1 tff_0/dff_0/nand2_7/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1078 tff_0/dff_0/nand2_7/in1 tff_0/dff_0/nand2_4/in1 vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1079 vdd clk tff_0/dff_0/nand2_7/in1 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1080 tff_0/dff_0/nand2_4/a_1_n26# tff_0/dff_0/nand2_4/in1 gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1081 tff_0/dff_0/nand2_7/in1 clk tff_0/dff_0/nand2_4/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1082 tff_0/dff_0/nand2_4/in1 tff_0/dff_0/nand2_3/in1 vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1083 vdd tff_0/dff_0/nand2_5/in1 tff_0/dff_0/nand2_4/in1 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1084 tff_0/dff_0/nand2_3/a_1_n26# tff_0/dff_0/nand2_3/in1 gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1085 tff_0/dff_0/nand2_4/in1 tff_0/dff_0/nand2_5/in1 tff_0/dff_0/nand2_3/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1086 tff_0/dff_0/nand2_3/in1 tff_0/dff_0/inv_1/out vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1087 vdd tff_0/dff_0/inv_0/out tff_0/dff_0/nand2_3/in1 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1088 tff_0/dff_0/nand2_1/a_1_n26# tff_0/dff_0/inv_1/out gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1089 tff_0/dff_0/nand2_3/in1 tff_0/dff_0/inv_0/out tff_0/dff_0/nand2_1/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1090 tff_0/dff_0/inv_1/out clk vdd vdd PMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1091 tff_0/dff_0/inv_1/out clk gnd gnd NMOS w=2u l=1.5u
+ ad=5p pd=9u as=0p ps=0u 
M1092 Q1 tff_0/dff_0/nand2_6/in1 vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1093 vdd BQ1 Q1 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1094 tff_0/dff_0/nand2_6/a_1_n26# tff_0/dff_0/nand2_6/in1 gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1095 Q1 BQ1 tff_0/dff_0/nand2_6/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1096 tff_0/dff_0/nand2_6/in1 tff_0/dff_0/nand2_5/in1 vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1097 vdd clk tff_0/dff_0/nand2_6/in1 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1098 tff_0/dff_0/nand2_5/a_1_n26# tff_0/dff_0/nand2_5/in1 gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1099 tff_0/dff_0/nand2_6/in1 clk tff_0/dff_0/nand2_5/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1100 tff_0/dff_0/nand2_5/in1 tff_0/dff_0/nand2_2/in1 vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1101 vdd tff_0/dff_0/nand2_4/in1 tff_0/dff_0/nand2_5/in1 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1102 tff_0/dff_0/nand2_2/a_1_n26# tff_0/dff_0/nand2_2/in1 gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1103 tff_0/dff_0/nand2_5/in1 tff_0/dff_0/nand2_4/in1 tff_0/dff_0/nand2_2/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1104 tff_0/dff_0/nand2_2/in1 tff_0/dff_0/D vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1105 vdd tff_0/dff_0/inv_1/out tff_0/dff_0/nand2_2/in1 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1106 tff_0/dff_0/nand2_0/a_1_n26# tff_0/dff_0/D gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1107 tff_0/dff_0/nand2_2/in1 tff_0/dff_0/inv_1/out tff_0/dff_0/nand2_0/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1108 tff_0/dff_0/inv_0/out tff_0/dff_0/D vdd vdd PMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1109 tff_0/dff_0/inv_0/out tff_0/dff_0/D gnd gnd NMOS w=2u l=1.5u
+ ad=5p pd=9u as=0p ps=0u 
M1110 tff_0/dff_0/D tff_0/xor2_0/nand2_3/in1 vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1111 vdd tff_0/xor2_0/nand2_3/in2 tff_0/dff_0/D vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1112 tff_0/xor2_0/nand2_3/a_1_n26# tff_0/xor2_0/nand2_3/in1 gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1113 tff_0/dff_0/D tff_0/xor2_0/nand2_3/in2 tff_0/xor2_0/nand2_3/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1114 tff_0/xor2_0/nand2_3/in2 Logic1 vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1115 vdd tff_0/xor2_0/nand2_2/in2 tff_0/xor2_0/nand2_3/in2 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1116 tff_0/xor2_0/nand2_2/a_1_n26# Logic1 gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1117 tff_0/xor2_0/nand2_3/in2 tff_0/xor2_0/nand2_2/in2 tff_0/xor2_0/nand2_2/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1118 tff_0/xor2_0/nand2_3/in1 Q1 vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1119 vdd tff_0/xor2_0/nand2_2/in2 tff_0/xor2_0/nand2_3/in1 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1120 tff_0/xor2_0/nand2_1/a_1_n26# Q1 gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1121 tff_0/xor2_0/nand2_3/in1 tff_0/xor2_0/nand2_2/in2 tff_0/xor2_0/nand2_1/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
M1122 tff_0/xor2_0/nand2_2/in2 Q1 vdd vdd PMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1123 vdd Logic1 tff_0/xor2_0/nand2_2/in2 vdd PMOS w=4u l=1.5u
+ ad=0p pd=0u as=0p ps=0u 
M1124 tff_0/xor2_0/nand2_0/a_1_n26# Q1 gnd gnd NMOS w=4u l=1.5u
+ ad=12p pd=14u as=0p ps=0u 
M1125 tff_0/xor2_0/nand2_2/in2 Logic1 tff_0/xor2_0/nand2_0/a_1_n26# gnd NMOS w=4u l=1.5u
+ ad=10p pd=13u as=0p ps=0u 
C0 Logic1 tff_0/xor2_0/nand2_2/in2 3.1fF
C1 vdd tff_1/dff_0/nand2_4/in1 2.8fF
C2 vdd tff_0/dff_0/nand2_5/in1 2.2fF
C3 vdd Q1 4.4fF
C4 vdd Q2 3.8fF
C5 vdd tff_0/dff_0/D 2.2fF
C6 tff_1/T tff_1/xor2_0/nand2_2/in2 3.1fF
C7 vdd clk 5.1fF
C8 vdd inv_0/out 2.0fF
C9 vdd tff_0/dff_0/inv_1/out 2.2fF
C10 vdd tff_0/dff_0/nand2_4/in1 2.8fF
C11 vdd tff_1/dff_0/D 2.2fF
C12 vdd BQ1 2.7fF
C13 vdd tff_1/dff_0/nand2_5/in1 2.2fF
C14 vdd BQ2 2.1fF
C15 vdd tff_1/dff_0/inv_1/out 2.2fF
C16 tff_0/xor2_0/nand2_2/in2 gnd 17.8fF
C17 Logic1 gnd 18.5fF
C18 tff_0/xor2_0/nand2_3/in2 gnd 8.1fF
C19 tff_0/xor2_0/nand2_3/in1 gnd 12.5fF
C20 tff_0/dff_0/inv_0/out gnd 12.9fF
C21 tff_0/dff_0/D gnd 22.8fF
C22 tff_0/dff_0/nand2_2/in1 gnd 8.2fF
C23 tff_0/dff_0/nand2_5/in1 gnd 18.5fF
C24 tff_0/dff_0/nand2_6/in1 gnd 8.0fF
C25 tff_0/dff_0/inv_1/out gnd 15.6fF
C26 tff_0/dff_0/nand2_3/in1 gnd 8.3fF
C27 tff_0/dff_0/nand2_4/in1 gnd 20.9fF
C28 tff_0/dff_0/nand2_7/in1 gnd 8.3fF
C29 Q1 gnd 50.0fF
C30 inv_0/out gnd 21.2fF
C31 and2_1/inv_0/in gnd 6.7fF
C32 or2_0/in1 gnd 8.1fF
C33 or2_0/in2 gnd 15.2fF
C34 or2_0/inv_0/out gnd 8.5fF
C35 or2_0/inv_1/out gnd 10.9fF
C36 BQ1 gnd 22.3fF
C37 and2_0/inv_0/in gnd 6.7fF
C38 M gnd 16.5fF
C39 Q2 gnd 44.1fF
C40 tff_1/xor2_0/nand2_2/in2 gnd 17.8fF
C41 tff_1/T gnd 18.3fF
C42 tff_1/xor2_0/nand2_3/in2 gnd 8.1fF
C43 tff_1/xor2_0/nand2_3/in1 gnd 12.5fF
C44 tff_1/dff_0/inv_0/out gnd 12.9fF
C45 tff_1/dff_0/D gnd 22.8fF
C46 tff_1/dff_0/nand2_2/in1 gnd 8.2fF
C47 tff_1/dff_0/nand2_5/in1 gnd 18.2fF
C48 tff_1/dff_0/nand2_6/in1 gnd 8.0fF
C49 tff_1/dff_0/inv_1/out gnd 15.6fF
C50 tff_1/dff_0/nand2_3/in1 gnd 8.3fF
C51 clk gnd 111.2fF
C52 tff_1/dff_0/nand2_4/in1 gnd 20.9fF
C53 BQ2 gnd 16.5fF
C54 tff_1/dff_0/nand2_7/in1 gnd 8.3fF
C55 vdd gnd 1303.0fF

.ends
*************************************************************************

************* Define the resoltion and simulation time ******************
.tran 100p 200n
*************************************************************************

************* Plot the results ******************************************
.control
.options color0=white
run
plot	v(logic1)
plot	v(CLK) v(M) 
plot 	v(Q1) v(Q2)

.endc
*************************************************************************

.end