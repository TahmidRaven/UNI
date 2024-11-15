DSCH 2.7a
VERSION 11/11/2024 15:26:21
BB(-119,-20,174,60)
SYM  #tahmid_latchfinal
BB(15,0,55,30)
TITLE 25 -2  #tahmid_latchfinal_symb
MODEL 6000
PROP                                                                                                                                                                                                            
REC(20,5,30,20,r)
VIS 5
PIN(15,20,0.000,0.000)CLK
PIN(15,10,0.000,0.000)D
PIN(55,10,0.060,0.350)Q'
PIN(55,20,0.060,0.630)Q
LIG(15,20,20,20)
LIG(15,10,20,10)
LIG(50,10,55,10)
LIG(50,20,55,20)
LIG(20,5,20,25)
LIG(20,5,50,5)
LIG(50,5,50,25)
LIG(50,25,20,25)
VLG   module tahmid_latchfinal( CLK,D,Q',Q);
VLG    input CLK,D;
VLG    output Q',Q;
VLG    wire w8,w9,w10,w11;
VLG    pmos #(40) pmos_ta1(w5,vdd,w4); //  
VLG    nmos #(12) nmos_ta2(w8,vss,CLK); //  
VLG    pmos #(40) pmos_ta3(w5,vdd,CLK); //  
VLG    nmos #(40) nmos_ta4(w5,w8,w4); //  
VLG    pmos #(40) pmos_ta5(w7,vdd,D); //  
VLG    nmos #(12) nmos_ta6(w9,vss,CLK); //  
VLG    pmos #(40) pmos_ta7(w7,vdd,CLK); //  
VLG    nmos #(40) nmos_ta8(w7,w9,D); //  
VLG    pmos #(47) pmos_ta9(Q',vdd,w5); //  
VLG    nmos #(12) nmos_ta10(w10,vss,Q); //  
VLG    pmos #(47) pmos_ta11(Q',vdd,Q); //  
VLG    nmos #(47) nmos_ta12(Q',w10,w5); //  
VLG    pmos #(47) pmos_ta13(Q,vdd,Q'); //  
VLG    nmos #(12) nmos_ta14(w11,vss,w7); //  
VLG    pmos #(47) pmos_ta15(Q,vdd,w7); //  
VLG    nmos #(47) nmos_ta16(Q,w11,Q'); //  
VLG    pmos #(30) pmos_ta17(w4,vdd,D); //  
VLG    nmos #(30) nmos_ta18(w4,vss,D); //  
VLG   endmodule
FSYM
SYM  #tahmid_latchfinal
BB(85,0,125,30)
TITLE 95 -2  #tahmid_latchfinal_symb
MODEL 6000
PROP                                                                                                                                                                                                            
REC(90,5,30,20,r)
VIS 5
PIN(85,20,0.000,0.000)CLK
PIN(85,10,0.000,0.000)D
PIN(125,10,0.060,0.420)Q'
PIN(125,20,0.060,0.420)Q
LIG(85,20,90,20)
LIG(85,10,90,10)
LIG(120,10,125,10)
LIG(120,20,125,20)
LIG(90,5,90,25)
LIG(90,5,120,5)
LIG(120,5,120,25)
LIG(120,25,90,25)
VLG    module tahmid_latchfinal( CLK,D,Q',Q);
VLG     input CLK,D;
VLG     output Q',Q;
VLG     wire w8,w9,w10,w11;
VLG     pmos #(40) pmos_ta1(w5,vdd,w4); //  
VLG     nmos #(12) nmos_ta2(w8,vss,CLK); //  
VLG     pmos #(40) pmos_ta3(w5,vdd,CLK); //  
VLG     nmos #(40) nmos_ta4(w5,w8,w4); //  
VLG     pmos #(40) pmos_ta5(w7,vdd,D); //  
VLG     nmos #(12) nmos_ta6(w9,vss,CLK); //  
VLG     pmos #(40) pmos_ta7(w7,vdd,CLK); //  
VLG     nmos #(40) nmos_ta8(w7,w9,D); //  
VLG     pmos #(47) pmos_ta9(Q',vdd,w5); //  
VLG     nmos #(12) nmos_ta10(w10,vss,Q); //  
VLG     pmos #(47) pmos_ta11(Q',vdd,Q); //  
VLG     nmos #(47) nmos_ta12(Q',w10,w5); //  
VLG     pmos #(47) pmos_ta13(Q,vdd,Q'); //  
VLG     nmos #(12) nmos_ta14(w11,vss,w7); //  
VLG     pmos #(47) pmos_ta15(Q,vdd,w7); //  
VLG     nmos #(47) nmos_ta16(Q,w11,Q'); //  
VLG     pmos #(30) pmos_ta17(w4,vdd,D); //  
VLG     nmos #(30) nmos_ta18(w4,vss,D); //  
VLG    endmodule
FSYM
SYM  #tahmid_not
BB(-45,15,-5,35)
TITLE -35 13  #tahmid_not_symb
MODEL 6000
PROP                                                                                                                                                                                                            
REC(-40,20,30,10,r)
VIS 5
PIN(-45,25,0.000,0.000)A
PIN(-5,25,0.060,0.420)Y
LIG(-45,25,-40,25)
LIG(-10,25,-5,25)
LIG(-40,20,-40,30)
LIG(-40,20,-10,20)
LIG(-10,20,-10,30)
LIG(-10,30,-40,30)
VLG    module tahmid_not( A,Y);
VLG     input A;
VLG     output Y;
VLG     pmos #(17) pmos(Y,vdd,A); // 2.0u 0.12u
VLG     nmos #(17) nmos(Y,vss,A); // 1.0u 0.12u
VLG    endmodule
FSYM
SYM  #light1
BB(148,-20,154,-6)
TITLE 150 -6  #light
MODEL 49
PROP                                                                                                                                                                                                            
REC(149,-19,4,4,r)
VIS 1
PIN(150,-5,0.000,0.000)Q
LIG(153,-14,153,-19)
LIG(153,-19,152,-20)
LIG(149,-19,149,-14)
LIG(152,-9,152,-12)
LIG(151,-9,154,-9)
LIG(151,-7,153,-9)
LIG(152,-7,154,-9)
LIG(148,-12,154,-12)
LIG(150,-12,150,-5)
LIG(148,-14,148,-12)
LIG(154,-14,148,-14)
LIG(154,-12,154,-14)
LIG(150,-20,149,-19)
LIG(152,-20,150,-20)
FSYM
SYM  #light2
BB(168,25,174,39)
TITLE 170 39  #light
MODEL 49
PROP                                                                                                                                                                                                            
REC(169,26,4,4,r)
VIS 1
PIN(170,40,0.000,0.000)Q'
LIG(173,31,173,26)
LIG(173,26,172,25)
LIG(169,26,169,31)
LIG(172,36,172,33)
LIG(171,36,174,36)
LIG(171,38,173,36)
LIG(172,38,174,36)
LIG(168,33,174,33)
LIG(170,33,170,40)
LIG(168,31,168,33)
LIG(174,31,168,31)
LIG(174,33,174,31)
LIG(170,25,169,26)
LIG(172,25,170,25)
FSYM
SYM  #button1
BB(-94,-14,-85,-6)
TITLE -90 -10  #button
MODEL 59
PROP                                                                                                                                                                                                            
REC(-93,-13,6,6,r)
VIS 1
PIN(-85,-10,0.000,0.000)D
LIG(-86,-10,-85,-10)
LIG(-94,-6,-94,-14)
LIG(-86,-6,-94,-6)
LIG(-86,-14,-86,-6)
LIG(-94,-14,-86,-14)
LIG(-93,-7,-93,-13)
LIG(-87,-7,-93,-7)
LIG(-87,-13,-87,-7)
LIG(-93,-13,-87,-13)
FSYM
SYM  #button2
BB(-119,1,-110,9)
TITLE -115 5  #button
MODEL 59
PROP                                                                                                                                                                                                            
REC(-118,2,6,6,r)
VIS 1
PIN(-110,5,0.000,0.000)CLK
LIG(-111,5,-110,5)
LIG(-119,9,-119,1)
LIG(-111,9,-119,9)
LIG(-111,1,-111,9)
LIG(-119,1,-111,1)
LIG(-118,8,-118,2)
LIG(-112,8,-118,8)
LIG(-112,2,-112,8)
LIG(-118,2,-112,2)
FSYM
SYM  #clock1
BB(-110,22,-95,28)
TITLE -105 25  #clock
MODEL 69
PROP   10.000 10.000                                                                                                                                                                                                        
REC(-108,23,6,4,r)
VIS 1
PIN(-95,25,0.030,0.420)ClK
LIG(-100,25,-95,25)
LIG(-105,23,-107,23)
LIG(-101,23,-103,23)
LIG(-100,22,-100,28)
LIG(-110,28,-110,22)
LIG(-105,27,-105,23)
LIG(-103,23,-103,27)
LIG(-103,27,-105,27)
LIG(-107,27,-109,27)
LIG(-107,23,-107,27)
LIG(-100,28,-110,28)
LIG(-100,22,-110,22)
FSYM
SYM  #clock2
BB(-100,2,-85,8)
TITLE -95 5  #clock
MODEL 69
PROP   20.000 20.000                                                                                                                                                                                                        
REC(-98,3,6,4,r)
VIS 1
PIN(-85,5,0.030,0.280)D
LIG(-90,5,-85,5)
LIG(-95,3,-97,3)
LIG(-91,3,-93,3)
LIG(-90,2,-90,8)
LIG(-100,8,-100,2)
LIG(-95,7,-95,3)
LIG(-93,3,-93,7)
LIG(-93,7,-95,7)
LIG(-97,7,-99,7)
LIG(-97,3,-97,7)
LIG(-90,8,-100,8)
LIG(-90,2,-100,2)
FSYM
CNC(-65 25)
LIG(-85,5,-30,5)
LIG(-30,5,-30,10)
LIG(-30,10,15,10)
LIG(-95,25,-65,25)
LIG(-5,25,5,25)
LIG(5,25,5,20)
LIG(5,20,15,20)
LIG(-65,25,-65,60)
LIG(-65,25,-45,25)
LIG(-65,60,85,60)
LIG(85,20,85,60)
LIG(145,40,170,40)
LIG(145,10,145,40)
LIG(150,-5,150,20)
LIG(125,20,150,20)
LIG(55,20,75,20)
LIG(85,10,75,10)
LIG(75,10,75,20)
LIG(125,10,145,10)
FFIG C:\CODE\TahmidRaven\UNI\CSE460\Export dsch2\Export dsch2\LabFiles\lab01\tahmid_flipflop.sch
