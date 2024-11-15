DSCH 2.7a
VERSION 11/4/2024 3:19:23 PM
BB(91,-15,199,65)
SYM  #button1
BB(91,1,100,9)
TITLE 95 5  #button
MODEL 59
PROP                                                                                                                                                                                                           
REC(92,2,6,6,r)
VIS 1
PIN(100,5,0.000,0.000)A
LIG(99,5,100,5)
LIG(91,9,91,1)
LIG(99,9,91,9)
LIG(99,1,99,9)
LIG(91,1,99,1)
LIG(92,8,92,2)
LIG(98,8,92,8)
LIG(98,2,98,8)
LIG(92,2,98,2)
FSYM
SYM  #pmos
BB(150,-5,170,15)
TITLE 165 0  #pmos
MODEL 902
PROP   2.0u 0.12u                                                                                                                                                                                                       
REC(151,0,19,15,r)
VIS 2
PIN(170,-5,0.000,0.000)s
PIN(150,5,0.000,0.000)g
PIN(170,15,0.030,0.210)d
LIG(150,5,156,5)
LIG(158,5,158,5)
LIG(160,11,160,-1)
LIG(162,11,162,-1)
LIG(170,-1,162,-1)
LIG(170,-5,170,-1)
LIG(170,11,162,11)
LIG(170,15,170,11)
VLG  pmos pmos(drain,source,gate);
FSYM
SYM  #vss
BB(165,57,175,65)
TITLE 169 62  #vss
MODEL 0
PROP                                                                                                                                                                                                            
REC(165,55,0,0,b)
VIS 0
PIN(170,55,0.000,0.000)vss
LIG(170,55,170,60)
LIG(165,60,175,60)
LIG(165,63,167,60)
LIG(167,63,169,60)
LIG(169,63,171,60)
LIG(171,63,173,60)
FSYM
SYM  #nmos
BB(150,35,170,55)
TITLE 165 40  #nmos
MODEL 901
PROP   1.0u 0.12u                                                                                                                                                                                                       
REC(151,40,19,15,r)
VIS 2
PIN(170,55,0.000,0.000)s
PIN(150,45,0.000,0.000)g
PIN(170,35,0.030,0.070)d
LIG(160,45,150,45)
LIG(160,51,160,39)
LIG(162,51,162,39)
LIG(170,39,162,39)
LIG(170,35,170,39)
LIG(170,51,162,51)
LIG(170,55,170,51)
VLG  nmos nmos(drain,source,gate);
FSYM
SYM  #pmos
BB(100,-5,120,15)
TITLE 115 0  #pmos
MODEL 902
PROP   2.0u 0.12u                                                                                                                                                                                                       
REC(101,0,19,15,r)
VIS 2
PIN(120,-5,0.000,0.000)s
PIN(100,5,0.000,0.000)g
PIN(120,15,0.030,0.210)d
LIG(100,5,106,5)
LIG(108,5,108,5)
LIG(110,11,110,-1)
LIG(112,11,112,-1)
LIG(120,-1,112,-1)
LIG(120,-5,120,-1)
LIG(120,11,112,11)
LIG(120,15,120,11)
VLG  pmos pmos(drain,source,gate);
FSYM
SYM  #nmos
BB(150,15,170,35)
TITLE 165 20  #nmos
MODEL 901
PROP   1.0u 0.12u                                                                                                                                                                                                       
REC(151,20,19,15,r)
VIS 2
PIN(170,35,0.000,0.000)s
PIN(150,25,0.000,0.000)g
PIN(170,15,0.030,0.210)d
LIG(160,25,150,25)
LIG(160,31,160,19)
LIG(162,31,162,19)
LIG(170,19,162,19)
LIG(170,15,170,19)
LIG(170,31,162,31)
LIG(170,35,170,31)
VLG  nmos nmos(drain,source,gate);
FSYM
SYM  #vdd
BB(165,-15,175,-5)
TITLE 168 -9  #vdd
MODEL 1
PROP                                                                                                                                                                                                           
REC(0,0,0,0,)
VIS 0
PIN(170,-5,0.000,0.000)vdd
LIG(170,-5,170,-10)
LIG(170,-10,165,-10)
LIG(165,-10,170,-15)
LIG(170,-15,175,-10)
LIG(175,-10,170,-10)
FSYM
SYM  #button3
BB(141,21,150,29)
TITLE 145 25  #button
MODEL 59
PROP                                                                                                                                                                                                           
REC(142,22,6,6,r)
VIS 1
PIN(150,25,0.000,0.000)B
LIG(149,25,150,25)
LIG(141,29,141,21)
LIG(149,29,141,29)
LIG(149,21,149,29)
LIG(141,21,149,21)
LIG(142,28,142,22)
LIG(148,28,142,28)
LIG(148,22,148,28)
LIG(142,22,148,22)
FSYM
SYM  #light1
BB(193,0,199,14)
TITLE 195 14  #light
MODEL 49
PROP                                                                                                                                                                                                           
REC(194,1,4,4,r)
VIS 1
PIN(195,15,0.000,0.000)Y
LIG(198,6,198,1)
LIG(198,1,197,0)
LIG(194,1,194,6)
LIG(197,11,197,8)
LIG(196,11,199,11)
LIG(196,13,198,11)
LIG(197,13,199,11)
LIG(193,8,199,8)
LIG(195,8,195,15)
LIG(193,6,193,8)
LIG(199,6,193,6)
LIG(199,8,199,6)
LIG(195,0,194,1)
LIG(197,0,195,0)
FSYM
LIG(120,15,195,15)
LIG(120,-5,170,-5)
LIG(150,5,150,25)
LIG(100,5,100,45)
LIG(150,45,100,45)
FFIG F:\21201701_TahmidRaven\dsch2\TahmidRaven\tahmid_nand.sch
