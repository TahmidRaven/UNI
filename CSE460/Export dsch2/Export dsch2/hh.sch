DSCH 2.7a
VERSION 3/21/2004 8:45:14 PM
BB(-69,-15,94,45)
SYM  #button1
BB(-69,-14,-60,-6)
TITLE -65 -10  #button
MODEL 59
PROP                                                                                                                                                                                                           
REC(-68,-13,6,6,r)
VIS 1
PIN(-60,-10,0.000,0.000)in1
LIG(-61,-10,-60,-10)
LIG(-69,-6,-69,-14)
LIG(-61,-6,-69,-6)
LIG(-61,-14,-61,-6)
LIG(-69,-14,-61,-14)
LIG(-68,-7,-68,-13)
LIG(-62,-7,-68,-7)
LIG(-62,-13,-62,-7)
LIG(-68,-13,-62,-13)
FSYM
SYM  #nand2
BB(45,-10,80,10)
TITLE 57 1  #&
MODEL 202
PROP                                                                                                                                                                                                           
REC(0,0,0,0,)
VIS 0
PIN(45,5,0.000,0.000)b
PIN(45,-5,0.000,0.000)a
PIN(80,0,0.060,0.070)s
LIG(45,5,53,5)
LIG(53,-10,53,10)
LIG(72,2,69,6)
LIG(73,0,72,2)
LIG(72,-2,73,0)
LIG(69,-6,72,-2)
LIG(64,-9,69,-6)
LIG(69,6,64,9)
LIG(64,9,53,10)
LIG(53,-10,64,-9)
LIG(45,-5,53,-5)
LIG(77,0,80,0)
LIG(75,0,75,0)
VLG  nand nand2(out,a,b);
FSYM
SYM  #nand2
BB(45,15,80,35)
TITLE 57 26  #&
MODEL 202
PROP                                                                                                                                                                                                           
REC(0,0,0,0,)
VIS 0
PIN(45,30,0.000,0.000)b
PIN(45,20,0.000,0.000)a
PIN(80,25,0.060,0.070)s
LIG(45,30,53,30)
LIG(53,15,53,35)
LIG(72,27,69,31)
LIG(73,25,72,27)
LIG(72,23,73,25)
LIG(69,19,72,23)
LIG(64,16,69,19)
LIG(69,31,64,34)
LIG(64,34,53,35)
LIG(53,15,64,16)
LIG(45,20,53,20)
LIG(77,25,80,25)
LIG(75,25,75,25)
VLG  nand nand2(out,a,b);
FSYM
SYM  #nand2
BB(-20,-15,15,5)
TITLE -8 -4  #&
MODEL 202
PROP                                                                                                                                                                                                           
REC(-20,5,0,0,)
VIS 0
PIN(-20,0,0.000,0.000)b
PIN(-20,-10,0.000,0.000)a
PIN(15,-5,0.060,0.070)s
LIG(-20,0,-12,0)
LIG(-12,-15,-12,5)
LIG(7,-3,4,1)
LIG(8,-5,7,-3)
LIG(7,-7,8,-5)
LIG(4,-11,7,-7)
LIG(-1,-14,4,-11)
LIG(4,1,-1,4)
LIG(-1,4,-12,5)
LIG(-12,-15,-1,-14)
LIG(-20,-10,-12,-10)
LIG(12,-5,15,-5)
LIG(10,-5,10,-5)
VLG  nand nand2(out,a,b);
FSYM
SYM  #nand2
BB(-20,20,15,40)
TITLE -8 31  #&
MODEL 202
PROP                                                                                                                                                                                                           
REC(0,0,0,0,)
VIS 0
PIN(-20,35,0.000,0.000)b
PIN(-20,25,0.000,0.000)a
PIN(15,30,0.060,0.070)s
LIG(-20,35,-12,35)
LIG(-12,20,-12,40)
LIG(7,32,4,36)
LIG(8,30,7,32)
LIG(7,28,8,30)
LIG(4,24,7,28)
LIG(-1,21,4,24)
LIG(4,36,-1,39)
LIG(-1,39,-12,40)
LIG(-12,20,-1,21)
LIG(-20,25,-12,25)
LIG(12,30,15,30)
LIG(10,30,10,30)
VLG  nand nand2(out,a,b);
FSYM
SYM  #inv
BB(-55,25,-20,45)
TITLE -40 35  #~
MODEL 101
PROP                                                                                                                                                                                                           
REC(5,0,0,0,)
VIS 0
PIN(-55,35,0.000,0.000)in
PIN(-20,35,0.030,0.070)out
LIG(-55,35,-45,35)
LIG(-45,25,-45,45)
LIG(-45,25,-30,35)
LIG(-45,45,-30,35)
LIG(-28,35,-28,35)
LIG(-26,35,-20,35)
VLG  not not1(out,in);
FSYM
SYM  #clock1
BB(-40,7,-25,13)
TITLE -35 10  #clock
MODEL 69
PROP   10.00 10.00                                                                                                                                                                                                       
REC(-38,8,6,4,r)
VIS 1
PIN(-25,10,1.500,0.140)clk1
LIG(-30,10,-25,10)
LIG(-35,8,-37,8)
LIG(-31,8,-33,8)
LIG(-30,7,-30,13)
LIG(-40,13,-40,7)
LIG(-35,12,-35,8)
LIG(-33,8,-33,12)
LIG(-33,12,-35,12)
LIG(-37,12,-39,12)
LIG(-37,8,-37,12)
LIG(-30,13,-40,13)
LIG(-30,7,-40,7)
FSYM
SYM  #light1
BB(88,-15,94,-1)
TITLE 90 -1  #light
MODEL 49
PROP                                                                                                                                                                                                           
REC(89,-14,4,4,r)
VIS 1
PIN(90,0,0.000,0.000)out1
LIG(93,-9,93,-14)
LIG(93,-14,92,-15)
LIG(89,-14,89,-9)
LIG(92,-4,92,-7)
LIG(91,-4,94,-4)
LIG(91,-2,93,-4)
LIG(92,-2,94,-4)
LIG(88,-7,94,-7)
LIG(90,-7,90,0)
LIG(88,-9,88,-7)
LIG(94,-9,88,-9)
LIG(94,-7,94,-9)
LIG(90,-15,89,-14)
LIG(92,-15,90,-15)
FSYM
CNC(-20 10)
CNC(-55 -10)
LIG(45,5,50,10)
LIG(50,10,55,15)
LIG(55,15,80,15)
LIG(80,15,80,25)
LIG(45,20,50,15)
LIG(50,15,55,10)
LIG(55,10,80,10)
LIG(80,10,80,0)
LIG(80,0,90,0)
LIG(80,25,90,25)
LIG(15,-5,45,-5)
LIG(15,30,45,30)
LIG(-20,25,-20,10)
LIG(-25,10,-20,10)
LIG(-20,10,-20,0)
LIG(-20,-10,-55,-10)
LIG(-55,35,-55,-10)
LIG(-55,-10,-60,-10)
FFIG C:\Export dsch2\hh.sch
