DSCH 2.7a
VERSION 11/4/2024 15:20:47
BB(50,-5,70,35)
SYM  #nmos
BB(50,-5,70,15)
TITLE 65 0  #nmos
MODEL 901
PROP   1.0u 0.12u                                                                                                                                                                                                       
REC(51,0,19,15,r)
VIS 2
PIN(70,15,0.000,0.000)s
PIN(50,5,0.000,0.000)g
PIN(70,-5,0.030,0.070)d
LIG(60,5,50,5)
LIG(60,11,60,-1)
LIG(62,11,62,-1)
LIG(70,-1,62,-1)
LIG(70,-5,70,-1)
LIG(70,11,62,11)
LIG(70,15,70,11)
VLG  nmos nmos(drain,source,gate);
FSYM
SYM  #nmos
BB(50,15,70,35)
TITLE 65 20  #nmos
MODEL 901
PROP   1.0u 0.12u                                                                                                                                                                                                       
REC(51,20,19,15,r)
VIS 2
PIN(70,35,0.000,0.000)s
PIN(50,25,0.000,0.000)g
PIN(70,15,0.030,0.070)d
LIG(60,25,50,25)
LIG(60,31,60,19)
LIG(62,31,62,19)
LIG(70,19,62,19)
LIG(70,15,70,19)
LIG(70,31,62,31)
LIG(70,35,70,31)
VLG  nmos nmos(drain,source,gate);
FSYM
FFIG C:\CODE\TahmidRaven\UNI\CSE460\Export dsch2\Export dsch2\LabFiles\tahmid.sch
