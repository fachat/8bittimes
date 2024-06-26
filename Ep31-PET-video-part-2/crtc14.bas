
; $0401

100 rem change character height while adjusting screen geo
110 print "{clr}use + and - to adjust char height"
120 print "use x to quit"
200 tr=400:rem total number of raster lines
210 oh=8  :rem original line height
220 lh=8  :rem line height
230 li=25 :rem display 25 lines
240 c = 59520:rem crtc base address
250 gosub 1000:rem set to lh

300 get a$: if a$="" then 300
310 if a$="+" then lh = lh + 1: gosub 1000: goto 300
320 if a$="-" then lh = lh - 1: gosub 1000: goto 300
330 if a$="x" then end
390 goto 300

1000 rem calculate screen geo for given lh
1010 rem as R4 is 7 bit only, at max we have 128 character lines,
1020 rem so for 400 rasterlines total, lh must at least be 4
1030 if lh < 4 then lh = 4
1040 rem as lh is a 5 bit register, lh can at max be 32
1050 if lh > 32 then lh = 32
1110 rem total number of char lines
1120 tl = int(tr / lh)
1130 rem adjustment
1140 ad = tr - (tl * lh)
1150 rem adjust vertical sync
1160 vs = tl - 13:if vs < 1 then vs = 2
1200 rem print
1210 print "{home}{down}{down}{down}{down}{down}{down}"
1215 print "rlines/char:    {left}{left}{left}";lh
1220 print "total lines:    {left}{left}{left}";tl
1230 print "adjustment :    {left}{left}{left}";ad
1235 print "vert. sync :    {left}{left}{left}";vs
1240 print "total rlines:   {left}{left}{left}";tl * lh + ad
1299 rem return
1300 rem set
1310 poke c,9:poke c+1,lh-1: rem r9 - rasterlines/char-1
1320 poke c,4:poke c+1,tl-1: rem r4 - vertical total (char) rows
1330 poke c,5:poke c+1,ad  : rem r5 - vertical adjust
1340 poke c,7:poke c+1,vs  : rem r7 - vertical sync
1400 return

