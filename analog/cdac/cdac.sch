v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {4C} 200 -240 0 0 0.4 0.4 {}
T {2C} 560 -220 0 0 0.4 0.4 {}
T {1C} 810 -220 0 0 0.4 0.4 {}
T {dummy} 1100 -230 0 0 0.4 0.4 {}
T {4C} 330 50 0 0 0.4 0.4 {}
T {Simulate clock
using a pulse} -10 330 0 0 0.4 0.4 {}
T {~clock & ~b2
~(clock + b2)} 280 320 0 0 0.4 0.4 {}
T {~(~clock & b2)
clock + ~b2} 490 320 0 0 0.4 0.4 {}
T {2C} 330 410 0 0 0.4 0.4 {}
T {~clock & ~b1
~(clock + b1)} 280 680 0 0 0.4 0.4 {}
T {~(~clock & b1)
clock + ~b1} 490 680 0 0 0.4 0.4 {}
T {1C} 320 760 0 0 0.4 0.4 {}
T {~clock & ~b0
~(clock + b0)} 270 1030 0 0 0.4 0.4 {}
T {~(~clock & b0)
clock + ~b0} 480 1030 0 0 0.4 0.4 {}
T {dummy} 320 1110 0 0 0.4 0.4 {}
T {~clock } 310 1330 0 0 0.4 0.4 {}
N 110 -190 220 -190 {lab=top}
N 220 -190 330 -190 {lab=top}
N 330 -190 440 -190 {lab=top}
N 110 -130 220 -130 {lab=bot4c}
N 220 -130 330 -130 {lab=bot4c}
N 330 -130 440 -130 {lab=bot4c}
N 600 -190 710 -190 {lab=top}
N 600 -130 710 -130 {lab=bot2c}
N 270 -230 270 -190 {lab=top}
N 650 -230 650 -190 {lab=top}
N 1050 -230 1050 -190 {lab=top}
N 880 -230 880 -190 {lab=top}
N 260 -230 1060 -230 {lab=top}
N 170 190 170 220 {lab=~clock}
N 100 160 130 160 {lab=clock}
N 100 160 100 250 {lab=clock}
N 100 250 130 250 {lab=clock}
N 170 160 230 160 {lab=vdd}
N 230 120 230 160 {lab=vdd}
N 170 120 230 120 {lab=vdd}
N 170 250 220 250 {lab=0}
N 220 250 220 290 {lab=0}
N 170 290 220 290 {lab=0}
N 170 280 170 300 {lab=0}
N 550 220 550 240 {lab=bot4c}
N 550 140 550 160 {lab=vdd}
N 360 200 400 200 {lab=0}
N 800 160 950 160 {lab=vin}
N 800 220 950 220 {lab=bot4c}
N 870 220 870 240 {lab=bot4c}
N 800 190 850 190 {lab=0}
N 550 190 600 190 {lab=vdd}
N 930 190 950 190 {lab=vdd}
N 170 110 170 130 {lab=vdd}
N 270 -130 270 -100 {lab=bot4c}
N 70 200 100 200 {lab=clock}
N 740 190 760 190 {lab=clock}
N 170 210 180 210 {lab=~clock}
N 990 190 1000 190 {lab=~clock}
N 550 580 550 600 {lab=bot2c}
N 550 500 550 520 {lab=vdd}
N 360 560 400 560 {lab=0}
N 800 520 950 520 {lab=vin}
N 800 580 950 580 {lab=bot2c}
N 870 580 870 600 {lab=bot2c}
N 800 550 850 550 {lab=0}
N 550 550 600 550 {lab=vdd}
N 930 550 950 550 {lab=vdd}
N 740 550 760 550 {lab=clock}
N 990 550 1000 550 {lab=~clock}
N 650 -130 650 -100 {lab=bot2c}
N 540 930 540 950 {lab=bot1c}
N 540 850 540 870 {lab=vdd}
N 350 910 390 910 {lab=0}
N 790 870 940 870 {lab=vin}
N 790 930 940 930 {lab=bot1c}
N 860 930 860 950 {lab=bot1c}
N 790 900 840 900 {lab=0}
N 540 900 590 900 {lab=vdd}
N 920 900 940 900 {lab=vdd}
N 730 900 750 900 {lab=clock}
N 980 900 990 900 {lab=~clock}
N 350 1260 390 1260 {lab=0}
N 590 1220 740 1220 {lab=vin}
N 590 1280 740 1280 {lab=dum}
N 660 1280 660 1300 {lab=dum}
N 590 1250 640 1250 {lab=0}
N 720 1250 740 1250 {lab=vdd}
N 530 1250 550 1250 {lab=clock}
N 780 1250 790 1250 {lab=~clock}
N 670 -290 670 -230 {lab=top}
N 230 -460 270 -460 {lab=#net1}
N 270 -460 270 -420 {lab=#net1}
N 170 -460 170 -440 {lab=0}
N 270 -390 310 -390 {lab=vdd}
C {sky130_fd_pr/cap_mim_m3_1.sym} 110 -160 0 0 {name=C1 model=cap_mim_m3_1 W=3 L=3 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_1.sym} 220 -160 0 0 {name=C2 model=cap_mim_m3_1 W=3 L=3 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_1.sym} 330 -160 0 0 {name=C3 model=cap_mim_m3_1 W=3 L=3 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_1.sym} 440 -160 0 0 {name=C4 model=cap_mim_m3_1 W=3 L=3 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_1.sym} 600 -160 0 0 {name=C5 model=cap_mim_m3_1 W=3 L=3 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_1.sym} 710 -160 0 0 {name=C6 model=cap_mim_m3_1 W=3 L=3 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_1.sym} 880 -160 0 0 {name=C7 model=cap_mim_m3_1 W=3 L=3 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_1.sym} 1050 -160 0 0 {name=C8 model=cap_mim_m3_1 W=3 L=3 MF=1 spiceprefix=X}
C {sky130_fd_pr/nfet_01v8.sym} 150 250 0 0 {name=n2
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 150 160 0 0 {name=p4
W=2.5
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {gnd.sym} 170 300 0 0 {name=l2 lab=0}
C {lab_pin.sym} 170 130 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 70 200 0 0 {name=p2 sig_type=std_logic lab=clock
}
C {sky130_fd_pr/nfet_01v8.sym} 340 200 0 0 {name=M1
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 530 190 0 0 {name=M2
W=2.5
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {gnd.sym} 400 200 0 0 {name=l4 lab=0}
C {gnd.sym} 360 230 0 0 {name=l6 lab=0}
C {lab_pin.sym} 180 210 2 0 {name=p3 sig_type=std_logic lab=~clock}
C {lab_pin.sym} 320 200 3 0 {name=p6 sig_type=std_logic lab=gndb2}
C {lab_pin.sym} 510 190 1 0 {name=p7 sig_type=std_logic lab=vddb2}
C {sky130_fd_pr/nfet_01v8.sym} 780 190 0 0 {name=M3
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 970 190 2 0 {name=M4
W=2.5
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {lab_pin.sym} 870 160 1 0 {name=p8 sig_type=std_logic lab=vin}
C {lab_pin.sym} 870 240 2 0 {name=p9 sig_type=std_logic lab=bot4c}
C {lab_pin.sym} 550 240 2 0 {name=p10 sig_type=std_logic lab=bot4c}
C {lab_pin.sym} 360 170 1 0 {name=p11 sig_type=std_logic lab=bot4c}
C {gnd.sym} 850 190 0 0 {name=l7 lab=0}
C {vsource.sym} 1100 200 0 0 {name=V3 value=1.8 savecurrent=false}
C {lab_pin.sym} 1100 170 1 0 {name=p12 sig_type=std_logic lab=vdd}
C {gnd.sym} 1100 230 0 0 {name=l5 lab=0}
C {lab_pin.sym} 930 190 0 0 {name=p5 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 270 -100 0 0 {name=p20 sig_type=std_logic lab=bot4c}
C {lab_pin.sym} 550 140 2 0 {name=p21 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 600 190 2 0 {name=p22 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 740 190 0 0 {name=p23 sig_type=std_logic lab=clock
}
C {lab_pin.sym} 1000 190 2 0 {name=p13 sig_type=std_logic lab=~clock}
C {sky130_fd_pr/nfet_01v8.sym} 340 560 0 0 {name=M7
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 530 550 0 0 {name=M8
W=2.5
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {gnd.sym} 400 560 0 0 {name=l1 lab=0}
C {gnd.sym} 360 590 0 0 {name=l3 lab=0}
C {lab_pin.sym} 320 560 3 0 {name=p14 sig_type=std_logic lab=gndb1}
C {lab_pin.sym} 510 550 1 0 {name=p24 sig_type=std_logic lab=vddb1}
C {sky130_fd_pr/nfet_01v8.sym} 780 550 0 0 {name=M9
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 970 550 2 0 {name=M10
W=2.5
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {lab_pin.sym} 870 520 1 0 {name=p25 sig_type=std_logic lab=vin}
C {gnd.sym} 850 550 0 0 {name=l9 lab=0}
C {lab_pin.sym} 930 550 0 0 {name=p30 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 550 500 2 0 {name=p31 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 600 550 2 0 {name=p32 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 740 550 0 0 {name=p33 sig_type=std_logic lab=clock
}
C {lab_pin.sym} 1000 550 2 0 {name=p34 sig_type=std_logic lab=~clock}
C {lab_pin.sym} 550 600 2 0 {name=p35 sig_type=std_logic lab=bot2c}
C {lab_pin.sym} 870 600 2 0 {name=p26 sig_type=std_logic lab=bot2c}
C {lab_pin.sym} 360 530 1 0 {name=p27 sig_type=std_logic lab=bot2c}
C {lab_pin.sym} 650 -100 0 0 {name=p28 sig_type=std_logic lab=bot2c}
C {sky130_fd_pr/nfet_01v8.sym} 330 910 0 0 {name=M11
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 520 900 0 0 {name=M12
W=2.5
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {gnd.sym} 390 910 0 0 {name=l11 lab=0}
C {gnd.sym} 350 940 0 0 {name=l12 lab=0}
C {sky130_fd_pr/nfet_01v8.sym} 770 900 0 0 {name=M13
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 960 900 2 0 {name=M14
W=2.5
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {lab_pin.sym} 860 870 1 0 {name=p38 sig_type=std_logic lab=vin}
C {gnd.sym} 840 900 0 0 {name=l13 lab=0}
C {lab_pin.sym} 920 900 0 0 {name=p40 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 540 850 2 0 {name=p41 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 590 900 2 0 {name=p42 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 730 900 0 0 {name=p43 sig_type=std_logic lab=clock
}
C {lab_pin.sym} 990 900 2 0 {name=p44 sig_type=std_logic lab=~clock}
C {lab_pin.sym} 540 950 2 0 {name=p48 sig_type=std_logic lab=bot1c}
C {lab_pin.sym} 860 950 2 0 {name=p45 sig_type=std_logic lab=bot1c}
C {lab_pin.sym} 500 900 1 0 {name=p46 sig_type=std_logic lab=vddb0}
C {lab_pin.sym} 350 880 1 0 {name=p37 sig_type=std_logic lab=bot1c}
C {lab_pin.sym} 310 910 3 0 {name=p47 sig_type=std_logic lab=gndb0}
C {lab_pin.sym} 880 -130 3 0 {name=p36 sig_type=std_logic lab=bot1c}
C {sky130_fd_pr/nfet_01v8.sym} 330 1260 0 0 {name=M15
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {gnd.sym} 390 1260 0 0 {name=l15 lab=0}
C {gnd.sym} 350 1290 0 0 {name=l16 lab=0}
C {sky130_fd_pr/nfet_01v8.sym} 570 1250 0 0 {name=M17
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 760 1250 2 0 {name=M18
W=2.5
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {lab_pin.sym} 660 1220 1 0 {name=p49 sig_type=std_logic lab=vin}
C {gnd.sym} 640 1250 0 0 {name=l17 lab=0}
C {lab_pin.sym} 720 1250 0 0 {name=p51 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 530 1250 0 0 {name=p54 sig_type=std_logic lab=clock
}
C {lab_pin.sym} 790 1250 2 0 {name=p55 sig_type=std_logic lab=~clock}
C {lab_pin.sym} 310 1260 3 0 {name=p52 sig_type=std_logic lab=~clock}
C {lab_pin.sym} 660 1300 2 0 {name=p53 sig_type=std_logic lab=dum}
C {lab_pin.sym} 350 1230 1 0 {name=p56 sig_type=std_logic lab=dum}
C {lab_pin.sym} 1050 -130 3 0 {name=p57 sig_type=std_logic lab=dum}
C {lab_pin.sym} 670 -290 2 0 {name=p16 sig_type=std_logic lab=top}
C {vsource.sym} 200 -460 1 0 {name=Vcm value=0.9 savecurrent=false}
C {sky130_fd_pr/pfet_01v8.sym} 250 -390 0 0 {name=M16
W=2.5
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {lab_pin.sym} 270 -360 3 0 {name=p50 sig_type=std_logic lab=top}
C {gnd.sym} 170 -440 0 0 {name=l10 lab=0}
C {lab_pin.sym} 230 -390 0 0 {name=p15 sig_type=std_logic lab=~clock
}
C {lab_pin.sym} 310 -390 2 0 {name=p17 sig_type=std_logic lab=vdd}
