DSCH 2.7a
VERSION 11/11/2024 16:29:59
BB(21,-125,384,35)
SYM  #nmos
BB(145,-15,165,5)
TITLE 160 -10  #nmos
MODEL 901
PROP   1.0u 0.12u                                                                                                                                                                                                       
REC(146,-10,19,15,r)
VIS 2
PIN(165,5,0.000,0.000)s
PIN(145,-5,0.000,0.000)g
PIN(165,-15,0.030,0.280)d
LIG(155,-5,145,-5)
LIG(155,1,155,-11)
LIG(157,1,157,-11)
LIG(165,-11,157,-11)
LIG(165,-15,165,-11)
LIG(165,1,157,1)
LIG(165,5,165,1)
VLG  nmos nmos(drain,source,gate);
FSYM
SYM  #nmos
BB(145,5,165,25)
TITLE 160 10  #nmos
MODEL 901
PROP   1.0u 0.12u                                                                                                                                                                                                       
REC(146,10,19,15,r)
VIS 2
PIN(165,25,0.000,0.000)s
PIN(145,15,0.000,0.000)g
PIN(165,5,0.030,0.070)d
LIG(155,15,145,15)
LIG(155,21,155,9)
LIG(157,21,157,9)
LIG(165,9,157,9)
LIG(165,5,165,9)
LIG(165,21,157,21)
LIG(165,25,165,21)
VLG  nmos nmos(drain,source,gate);
FSYM
SYM  #vss
BB(160,27,170,35)
TITLE 164 32  #vss
MODEL 0
PROP                                                                                                                                                                                                            
REC(160,25,0,0,b)
VIS 0
PIN(165,25,0.000,0.000)vss
LIG(165,25,165,30)
LIG(160,30,170,30)
LIG(160,33,162,30)
LIG(162,33,164,30)
LIG(164,33,166,30)
LIG(166,33,168,30)
FSYM
SYM  #pmos
BB(200,-90,220,-70)
TITLE 215 -85  #pmos
MODEL 902
PROP   2.0u 0.12u                                                                                                                                                                                                       
REC(201,-85,19,15,r)
VIS 2
PIN(220,-90,0.000,0.000)s
PIN(200,-80,0.000,0.000)g
PIN(220,-70,0.030,0.280)d
LIG(200,-80,206,-80)
LIG(208,-80,208,-80)
LIG(210,-74,210,-86)
LIG(212,-74,212,-86)
LIG(220,-86,212,-86)
LIG(220,-90,220,-86)
LIG(220,-74,212,-74)
LIG(220,-70,220,-74)
VLG  pmos pmos(drain,source,gate);
FSYM
SYM  #pmos
BB(125,-115,145,-95)
TITLE 140 -110  #pmos
MODEL 902
PROP   2.0u 0.12u                                                                                                                                                                                                       
REC(126,-110,19,15,r)
VIS 2
PIN(145,-115,0.000,0.000)s
PIN(125,-105,0.000,0.000)g
PIN(145,-95,0.030,0.280)d
LIG(125,-105,131,-105)
LIG(133,-105,133,-105)
LIG(135,-99,135,-111)
LIG(137,-99,137,-111)
LIG(145,-111,137,-111)
LIG(145,-115,145,-111)
LIG(145,-99,137,-99)
LIG(145,-95,145,-99)
VLG  pmos pmos(drain,source,gate);
FSYM
SYM  #nmos
BB(330,-15,350,5)
TITLE 345 -10  #nmos
MODEL 901
PROP   1.0u 0.12u                                                                                                                                                                                                       
REC(331,-10,19,15,r)
VIS 2
PIN(350,5,0.000,0.000)s
PIN(330,-5,0.000,0.000)g
PIN(350,-15,0.030,0.140)d
LIG(340,-5,330,-5)
LIG(340,1,340,-11)
LIG(342,1,342,-11)
LIG(350,-11,342,-11)
LIG(350,-15,350,-11)
LIG(350,1,342,1)
LIG(350,5,350,1)
VLG  nmos nmos(drain,source,gate);
FSYM
SYM  #pmos
BB(330,-85,350,-65)
TITLE 345 -80  #pmos
MODEL 902
PROP   2.0u 0.12u                                                                                                                                                                                                       
REC(331,-80,19,15,r)
VIS 2
PIN(350,-85,0.000,0.000)s
PIN(330,-75,0.000,0.000)g
PIN(350,-65,0.030,0.140)d
LIG(330,-75,336,-75)
LIG(338,-75,338,-75)
LIG(340,-69,340,-81)
LIG(342,-69,342,-81)
LIG(350,-81,342,-81)
LIG(350,-85,350,-81)
LIG(350,-69,342,-69)
LIG(350,-65,350,-69)
VLG  pmos pmos(drain,source,gate);
FSYM
SYM  #light1
BB(378,-50,384,-36)
TITLE 380 -36  #light
MODEL 49
PROP                                                                                                                                                                                                           
REC(379,-49,4,4,r)
VIS 1
PIN(380,-35,0.000,0.000)out1
LIG(383,-44,383,-49)
LIG(383,-49,382,-50)
LIG(379,-49,379,-44)
LIG(382,-39,382,-42)
LIG(381,-39,384,-39)
LIG(381,-37,383,-39)
LIG(382,-37,384,-39)
LIG(378,-42,384,-42)
LIG(380,-42,380,-35)
LIG(378,-44,378,-42)
LIG(384,-44,378,-44)
LIG(384,-42,384,-44)
LIG(380,-50,379,-49)
LIG(382,-50,380,-50)
FSYM
SYM  #vss
BB(345,7,355,15)
TITLE 349 12  #vss
MODEL 0
PROP                                                                                                                                                                                                            
REC(345,5,0,0,b)
VIS 0
PIN(350,5,0.000,0.000)vss
LIG(350,5,350,10)
LIG(345,10,355,10)
LIG(345,13,347,10)
LIG(347,13,349,10)
LIG(349,13,351,10)
LIG(351,13,353,10)
FSYM
SYM  #vdd
BB(345,-95,355,-85)
TITLE 348 -89  #vdd
MODEL 1
PROP                                                                                                                                                                                                           
REC(0,0,0,0,)
VIS 0
PIN(350,-85,0.000,0.000)vdd
LIG(350,-85,350,-90)
LIG(350,-90,345,-90)
LIG(345,-90,350,-95)
LIG(350,-95,355,-90)
LIG(355,-90,350,-90)
FSYM
SYM  #vdd
BB(195,-125,205,-115)
TITLE 198 -119  #vdd
MODEL 1
PROP                                                                                                                                                                                                           
REC(0,0,0,0,)
VIS 0
PIN(200,-115,0.000,0.000)vdd
LIG(200,-115,200,-120)
LIG(200,-120,195,-120)
LIG(195,-120,200,-125)
LIG(200,-125,205,-120)
LIG(205,-120,200,-120)
FSYM
SYM  #button10
BB(91,-44,100,-36)
TITLE 95 -40  #button
MODEL 59
PROP                                                                                                                                                                                                           
REC(92,-43,6,6,r)
VIS 1
PIN(100,-40,0.000,0.000)B
LIG(99,-40,100,-40)
LIG(91,-36,91,-44)
LIG(99,-36,91,-36)
LIG(99,-44,99,-36)
LIG(91,-44,99,-44)
LIG(92,-37,92,-43)
LIG(98,-37,92,-37)
LIG(98,-43,98,-37)
LIG(92,-43,98,-43)
FSYM
SYM  #button9
BB(21,-64,30,-56)
TITLE 25 -60  #button
MODEL 59
PROP                                                                                                                                                                                                           
REC(22,-63,6,6,r)
VIS 1
PIN(30,-60,0.000,0.000)A
LIG(29,-60,30,-60)
LIG(21,-56,21,-64)
LIG(29,-56,21,-56)
LIG(29,-64,29,-56)
LIG(21,-64,29,-64)
LIG(22,-57,22,-63)
LIG(28,-57,22,-57)
LIG(28,-63,28,-57)
LIG(22,-63,28,-63)
FSYM
CNC(350 -35)
CNC(165 -50)
CNC(165 -70)
CNC(330 -50)
LIG(350,-65,350,-35)
LIG(330,-50,330,-5)
LIG(165,-50,165,-15)
LIG(145,-115,220,-115)
LIG(145,-70,165,-70)
LIG(145,-95,145,-70)
LIG(350,-35,350,-15)
LIG(220,-90,220,-115)
LIG(350,-35,380,-35)
LIG(165,-70,165,-50)
LIG(165,-70,220,-70)
LIG(165,-50,330,-50)
LIG(330,-75,330,-50)
LIG(30,-105,30,-5)
LIG(30,-105,125,-105)
LIG(200,-85,100,-85)
LIG(30,-5,145,-5)
LIG(100,-85,100,15)
LIG(100,15,145,15)
FFIG C:\CODE\TahmidRaven\UNI\CSE460\Export dsch2\Export dsch2\LabFiles\tahmidassesment01.sch
