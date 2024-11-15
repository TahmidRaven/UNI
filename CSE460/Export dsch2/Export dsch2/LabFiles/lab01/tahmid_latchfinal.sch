DSCH 2.7a
VERSION 11/4/2024 3:51:27 PM
BB(-49,-15,199,60)
SYM  #light2
BB(193,30,199,44)
TITLE 195 44  #light
MODEL 49
PROP                                                                                                                                                                                                           
REC(194,31,4,4,r)
VIS 1
PIN(195,45,0.000,0.000)Q'
LIG(198,36,198,31)
LIG(198,31,197,30)
LIG(194,31,194,36)
LIG(197,41,197,38)
LIG(196,41,199,41)
LIG(196,43,198,41)
LIG(197,43,199,41)
LIG(193,38,199,38)
LIG(195,38,195,45)
LIG(193,36,193,38)
LIG(199,36,193,36)
LIG(199,38,199,36)
LIG(195,30,194,31)
LIG(197,30,195,30)
FSYM
SYM  #light1
BB(193,-15,199,-1)
TITLE 195 -1  #light
MODEL 49
PROP                                                                                                                                                                                                           
REC(194,-14,4,4,r)
VIS 1
PIN(195,0,0.000,0.000)Q
LIG(198,-9,198,-14)
LIG(198,-14,197,-15)
LIG(194,-14,194,-9)
LIG(197,-4,197,-7)
LIG(196,-4,199,-4)
LIG(196,-2,198,-4)
LIG(197,-2,199,-4)
LIG(193,-7,199,-7)
LIG(195,-7,195,0)
LIG(193,-9,193,-7)
LIG(199,-9,193,-9)
LIG(199,-7,199,-9)
LIG(195,-15,194,-14)
LIG(197,-15,195,-15)
FSYM
SYM  #tahmid_nand
BB(30,30,70,60)
TITLE 40 28  #tahmid_nand_symb
MODEL 6000
PROP                                                                                                                                                                                                           
REC(35,35,30,20,r)
VIS 5
PIN(30,40,0.000,0.000)A
PIN(30,50,0.000,0.000)B
PIN(70,40,0.060,0.350)Y
LIG(30,40,35,40)
LIG(30,50,35,50)
LIG(65,40,70,40)
LIG(35,35,35,55)
LIG(35,35,65,35)
LIG(65,35,65,55)
LIG(65,55,35,55)
VLG  module tahmid_nand( A,B,Y);
VLG   input A,B;
VLG   output Y;
VLG   pmos #(24) pmos(Y,vdd,B); // 2.0u 0.12u
VLG   nmos #(10) nmos(w4,vss,A); // 1.0u 0.12u
VLG   pmos #(24) pmos(Y,vdd,A); // 2.0u 0.12u
VLG   nmos #(24) nmos(Y,w4,B); // 1.0u 0.12u
VLG  endmodule
FSYM
SYM  #tahmid_nand
BB(30,-5,70,25)
TITLE 40 -7  #tahmid_nand_symb
MODEL 6000
PROP                                                                                                                                                                                                           
REC(35,0,30,20,r)
VIS 5
PIN(30,5,0.000,0.000)A
PIN(30,15,0.000,0.000)B
PIN(70,5,0.060,0.350)Y
LIG(30,5,35,5)
LIG(30,15,35,15)
LIG(65,5,70,5)
LIG(35,0,35,20)
LIG(35,0,65,0)
LIG(65,0,65,20)
LIG(65,20,35,20)
VLG  module tahmid_nand( A,B,Y);
VLG   input A,B;
VLG   output Y;
VLG   pmos #(24) pmos(Y,vdd,B); // 2.0u 0.12u
VLG   nmos #(10) nmos(w4,vss,A); // 1.0u 0.12u
VLG   pmos #(24) pmos(Y,vdd,A); // 2.0u 0.12u
VLG   nmos #(24) nmos(Y,w4,B); // 1.0u 0.12u
VLG  endmodule
FSYM
SYM  #tahmid_nand
BB(110,30,150,60)
TITLE 120 28  #tahmid_nand_symb
MODEL 6000
PROP                                                                                                                                                                                                           
REC(115,35,30,20,r)
VIS 5
PIN(110,40,0.000,0.000)A
PIN(110,50,0.000,0.000)B
PIN(150,40,0.060,0.420)Y
LIG(110,40,115,40)
LIG(110,50,115,50)
LIG(145,40,150,40)
LIG(115,35,115,55)
LIG(115,35,145,35)
LIG(145,35,145,55)
LIG(145,55,115,55)
VLG  module tahmid_nand( A,B,Y);
VLG   input A,B;
VLG   output Y;
VLG   pmos #(24) pmos(Y,vdd,B); // 2.0u 0.12u
VLG   nmos #(10) nmos(w4,vss,A); // 1.0u 0.12u
VLG   pmos #(24) pmos(Y,vdd,A); // 2.0u 0.12u
VLG   nmos #(24) nmos(Y,w4,B); // 1.0u 0.12u
VLG  endmodule
FSYM
SYM  #tahmid_nand
BB(110,-5,150,25)
TITLE 120 -7  #tahmid_nand_symb
MODEL 6000
PROP                                                                                                                                                                                                           
REC(115,0,30,20,r)
VIS 5
PIN(110,5,0.000,0.000)A
PIN(110,15,0.000,0.000)B
PIN(150,5,0.060,0.420)Y
LIG(110,5,115,5)
LIG(110,15,115,15)
LIG(145,5,150,5)
LIG(115,0,115,20)
LIG(115,0,145,0)
LIG(145,0,145,20)
LIG(145,20,115,20)
VLG  module tahmid_nand( A,B,Y);
VLG   input A,B;
VLG   output Y;
VLG   pmos #(24) pmos(Y,vdd,B); // 2.0u 0.12u
VLG   nmos #(10) nmos(w4,vss,A); // 1.0u 0.12u
VLG   pmos #(24) pmos(Y,vdd,A); // 2.0u 0.12u
VLG   nmos #(24) nmos(Y,w4,B); // 1.0u 0.12u
VLG  endmodule
FSYM
SYM  #button1
BB(-44,-4,-35,4)
TITLE -40 0  #button
MODEL 59
PROP                                                                                                                                                                                                           
REC(-43,-3,6,6,r)
VIS 1
PIN(-35,0,0.000,0.000)CLK
LIG(-36,0,-35,0)
LIG(-44,4,-44,-4)
LIG(-36,4,-44,4)
LIG(-36,-4,-36,4)
LIG(-44,-4,-36,-4)
LIG(-43,3,-43,-3)
LIG(-37,3,-43,3)
LIG(-37,-3,-37,3)
LIG(-43,-3,-37,-3)
FSYM
SYM  #tahmid_not
BB(-25,35,15,55)
TITLE -15 33  #tahmid_not_symb
MODEL 6000
PROP                                                                                                                                                                                                           
REC(-20,40,30,10,r)
VIS 5
PIN(-25,45,0.000,0.000)A
PIN(15,45,0.060,0.280)Y
LIG(-25,45,-20,45)
LIG(10,45,15,45)
LIG(-20,40,-20,50)
LIG(-20,40,10,40)
LIG(10,40,10,50)
LIG(10,50,-20,50)
VLG  module tahmid_not( A,Y);
VLG   input A;
VLG   output Y;
VLG   pmos #(17) pmos(Y,vdd,A); // 2.0u 0.12u
VLG   nmos #(17) nmos(Y,vss,A); // 1.0u 0.12u
VLG  endmodule
FSYM
SYM  #button2
BB(-49,41,-40,49)
TITLE -45 45  #button
MODEL 59
PROP                                                                                                                                                                                                           
REC(-48,42,6,6,r)
VIS 1
PIN(-40,45,0.000,0.000)D
LIG(-41,45,-40,45)
LIG(-49,49,-49,41)
LIG(-41,49,-49,49)
LIG(-41,41,-41,49)
LIG(-49,41,-41,41)
LIG(-48,48,-48,42)
LIG(-42,48,-48,48)
LIG(-42,42,-42,48)
LIG(-48,42,-42,42)
FSYM
CNC(15 5)
CNC(-30 45)
CNC(160 40)
CNC(180 0)
LIG(70,5,110,5)
LIG(70,40,85,40)
LIG(110,50,85,50)
LIG(85,40,85,50)
LIG(-35,0,0,0)
LIG(0,0,0,5)
LIG(0,5,15,5)
LIG(20,50,30,50)
LIG(15,5,15,25)
LIG(15,5,30,5)
LIG(20,45,20,50)
LIG(30,25,30,40)
LIG(15,25,30,25)
LIG(15,45,20,45)
LIG(-40,45,-30,45)
LIG(30,15,-30,15)
LIG(-30,15,-30,45)
LIG(-30,45,-25,45)
LIG(150,5,170,5)
LIG(170,5,170,0)
LIG(170,0,180,0)
LIG(150,40,160,40)
LIG(170,40,170,45)
LIG(170,45,195,45)
LIG(180,0,195,0)
LIG(110,15,110,25)
LIG(110,25,160,25)
LIG(160,25,160,40)
LIG(160,40,170,40)
LIG(110,40,100,40)
LIG(100,40,100,30)
LIG(180,30,180,0)
LIG(100,30,180,30)
FFIG F:\21201701_TahmidRaven\dsch2\TahmidRaven\tahmid_latch.sch
