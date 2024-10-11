# File saved with Nlview 7.0r6  2020-01-29 bk=1.5227 VDI=41 GEI=36 GUI=JA:10.0 non-TLS-threadsafe
# 
# non-default properties - (restore without -noprops)
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 18
property maxzoom 7.5
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #0095ff
property objecthighlight4 #8000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlapcolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 8
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 18
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 4
property timelimit 1
#
module new lock_control work:lock_control:NOFILE -nosplit
load symbol RTL_OR0 workI0 OR pin I0 input.neg pin I1 input pin O output fillcolor 1
load symbol RTL_OR workI1 OR pin I0 input pin I1 input.neg pin O output fillcolor 1
load symbol shift_register_3bit work:shift_register_3bit:NOFILE HIERBOX pin clk input.left pin data_in input.left pin q0 output.right pin q1 output.right pin q2 output.right boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_INV work INV pin I0 input pin O output fillcolor 1
load symbol dff_7474 work:dff_7474:NOFILE HIERBOX pin clk input.left pin clr_n input.left pin d input.left pin pre_n input.left pin q output.right pin q_n output.right boxcolor 1 fillcolor 2 minwidth 13%
load symbol dff_7474 work:abstract:NOFILE HIERBOX pin clk input.left pin clr_n input.left pin d input.left pin pre_n input.left pin q output.right pin q_n output.right boxcolor 1 fillcolor 2 minwidth 13%
load port clk input -pg 1 -lvl 0 -x -20 -y 50
load port data_in input -pg 1 -lvl 0 -x -20 -y 80
load port lock_led output -pg 1 -lvl 5 -x 1100 -y 20
load port unlock_led output -pg 1 -lvl 5 -x 1100 -y 60
load inst or1_i RTL_OR0 workI0 -attr @cell(#000000) RTL_OR -pg 1 -lvl 2 -x 700 -y 110
load inst or1_i__0 RTL_OR workI1 -attr @cell(#000000) RTL_OR -pg 1 -lvl 3 -x 840 -y 50
load inst sr shift_register_3bit work:shift_register_3bit:NOFILE -autohide -attr @cell(#000000) shift_register_3bit -attr @fillcolor #fafafa -pg 1 -lvl 1 -x 100 -y 58
load inst unlock_led_i RTL_INV work -attr @cell(#000000) RTL_INV -pg 1 -lvl 4 -x 980 -y 60
load inst sr|ff0 dff_7474 work:dff_7474:NOFILE -hier sr -autohide -attr @cell(#000000) dff_7474 -attr @name ff0 -pinAttr q_n @attr n/c -pg 1 -lvl 1 -x 240 -y 88
load inst sr|ff1 dff_7474 work:abstract:NOFILE -hier sr -autohide -attr @cell(#000000) dff_7474 -attr @name ff1 -pinAttr q_n @attr n/c -pg 1 -lvl 1 -x 240 -y 268
load inst sr|ff2 dff_7474 work:abstract:NOFILE -hier sr -autohide -attr @cell(#000000) dff_7474 -attr @name ff2 -pinAttr q_n @attr n/c -pg 1 -lvl 2 -x 450 -y 208
load net clk -port clk -pin sr clk
netloc clk 1 0 1 20J 50n
load net data_in -port data_in -pin sr data_in
netloc data_in 1 0 1 0J 80n
load net lock_led -port lock_led -pin or1_i__0 O -pin unlock_led_i I0
netloc lock_led 1 3 2 930 20 NJ
load net or1 -pin or1_i O -pin or1_i__0 I0
netloc or1 1 2 1 790 40n
load net q0 -pin or1_i__0 I1 -pin sr q0
netloc q0 1 1 2 610J 60 N
load net q1 -pin or1_i I1 -pin sr q1
netloc q1 1 1 1 650 120n
load net q2 -pin or1_i I0 -pin sr q2
netloc q2 1 1 1 630 100n
load net unlock_led -port unlock_led -pin unlock_led_i O
netloc unlock_led 1 4 1 NJ 60
load net sr|<const1> -power -attr @name <const1> -pin sr|ff0 clr_n -pin sr|ff0 pre_n -pin sr|ff1 clr_n -pin sr|ff1 pre_n -pin sr|ff2 clr_n -pin sr|ff2 pre_n
load net sr|clk -attr @name clk -hierPin sr clk -pin sr|ff0 clk -pin sr|ff1 clk -pin sr|ff2 clk
netloc sr|clk 1 0 2 130 218 N
load net sr|data_in -attr @name data_in -hierPin sr data_in -pin sr|ff0 d
netloc sr|data_in 1 0 1 N 138
load net sr|q0 -attr @name q0 -hierPin sr q0 -pin sr|ff0 q -pin sr|ff1 d
netloc sr|q0 1 0 3 150 198 340 118 NJ
load net sr|q1 -attr @name q1 -hierPin sr q1 -pin sr|ff1 q -pin sr|ff2 d
netloc sr|q1 1 1 2 360 138 N
load net sr|q2 -attr @name q2 -hierPin sr q2 -pin sr|ff2 q
netloc sr|q2 1 2 1 N 238
levelinfo -pg 1 -20 100 700 840 980 1100
levelinfo -hier sr * 240 450 *
pagesize -pg 1 -db -bbox -sgen -120 -10 1220 410
pagesize -hier sr -db -bbox -sgen 100 28 560 378
show
fullfit
#
# initialize ictrl to current module lock_control work:lock_control:NOFILE
ictrl init topinfo |
