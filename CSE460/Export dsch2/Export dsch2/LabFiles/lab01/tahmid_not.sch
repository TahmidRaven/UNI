DSCH 2.7a
VERSION 11/4/2024 3:00:45 PM
BB(51,-5,119,55)
SYM  #pmos
BB(60,5,80,25)
TITLE 75 10  #pmos
MODEL 902
PROP   2.0u 0.12u                                                                                                                                                                                                       
REC(61,10,19,15,r)
VIS 2
PIN(80,5,0.000,0.000)s
PIN(60,15,0.000,0.000)g
PIN(80,25,0.030,0.140)d
LIG(60,15,66,15)
LIG(68,15,68,15)
LIG(70,21,70,9)
LIG(72,21,72,9)
LIG(80,9,72,9)
LIG(80,5,80,9)
LIG(80,21,72,21)
LIG(80,25,80,21)
VLG  pmos pmos(drain,source,gate);
FSYM
SYM  #nmos
BB(60,25,80,45)
TITLE 75 30  #nmos
MODEL 901
PROP   1.0u 0.12u                                                                                                                                                                                                       
REC(61,30,19,15,r)
VIS 2
PIN(80,45,0.000,0.000)s
PIN(60,35,0.000,0.000)g
PIN(80,25,0.030,0.140)d
LIG(70,35,60,35)
LIG(70,41,70,29)
LIG(72,41,72,29)
LIG(80,29,72,29)
LIG(80,25,80,29)
LIG(80,41,72,41)
LIG(80,45,80,41)
VLG  nmos nmos(drain,source,gate);
FSYM
SYM  #vss
BB(75,47,85,55)
TITLE 79 52  #vss
MODEL 0
PROP                                                                                                                                                                                                            
REC(75,45,0,0,b)
VIS 0
PIN(80,45,0.000,0.000)vss
LIG(80,45,80,50)
LIG(75,50,85,50)
LIG(75,53,77,50)
LIG(77,53,79,50)
LIG(79,53,81,50)
LIG(81,53,83,50)
FSYM
SYM  #vdd
BB(75,-5,85,5)
TITLE 78 1  #vdd
MODEL 1
PROP                                                                                                                                                                                                           
REC(0,0,0,0,)
VIS 0
PIN(80,5,0.000,0.000)vdd
LIG(80,5,80,0)
LIG(80,0,75,0)
LIG(75,0,80,-5)
LIG(80,-5,85,0)
LIG(85,0,80,0)
FSYM
SYM  #button1
BB(51,21,60,29)
TITLE 55 25  #button
MODEL 59
PROP                                                                                                                                                                                                           
REC(52,22,6,6,r)
VIS 1
PIN(60,25,0.000,0.000)A
LIG(59,25,60,25)
LIG(51,29,51,21)
LIG(59,29,51,29)
LIG(59,21,59,29)
LIG(51,21,59,21)
LIG(52,28,52,22)
LIG(58,28,52,28)
LIG(58,22,58,28)
LIG(52,22,58,22)
FSYM
SYM  #light1
BB(113,10,119,24)
TITLE 115 24  #light
MODEL 49
PROP                                                                                                                                                                                                           
REC(114,11,4,4,r)
VIS 1
PIN(115,25,0.000,0.000)Y
LIG(118,16,118,11)
LIG(118,11,117,10)
LIG(114,11,114,16)
LIG(117,21,117,18)
LIG(116,21,119,21)
LIG(116,23,118,21)
LIG(117,23,119,21)
LIG(113,18,119,18)
LIG(115,18,115,25)
LIG(113,16,113,18)
LIG(119,16,113,16)
LIG(119,18,119,16)
LIG(115,10,114,11)
LIG(117,10,115,10)
FSYM
LIG(60,15,60,35)
LIG(80,25,115,25)
FFIG F:\21201701_TahmidRaven\dsch2\TahmidRaven\tahmid_not.sch
