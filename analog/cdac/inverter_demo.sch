v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -1170 -2000 -1170 -1970 {lab=out}
N -1240 -1940 -1210 -1940 {lab=in}
N -1240 -2030 -1210 -2030 {lab=in}
N -1170 -1910 -1170 -1870 {lab=0}
N -1170 -2090 -1170 -2060 {lab=vdd}
N -1170 -2030 -1140 -2030 {lab=vdd}
N -1140 -2080 -1140 -2030 {lab=vdd}
N -1170 -2080 -1140 -2080 {lab=vdd}
N -1170 -1940 -1140 -1940 {lab=0}
N -1140 -1940 -1140 -1890 {lab=0}
N -1170 -1890 -1140 -1890 {lab=0}
N -1240 -2030 -1240 -1940 {lab=in}
N -1260 -1980 -1240 -1980 {lab=in}
N -1290 -1980 -1260 -1980 {lab=in}
N -1290 -1980 -1290 -1960 {lab=in}
N -1290 -1900 -1290 -1890 {lab=0}
N -1290 -1890 -1170 -1890 {lab=0}
N -1030 -2110 -1030 -2040 {lab=vdd}
N -1170 -2110 -1030 -2110 {lab=vdd}
N -1170 -2110 -1170 -2090 {lab=vdd}
N -1030 -1980 -1030 -1890 {lab=0}
N -1160 -1890 -1030 -1890 {lab=0}
C {sky130_fd_pr/nfet_01v8.sym} -1190 -1940 0 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8.sym} -1190 -2030 0 0 {name=M2
W=2
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
C {lab_pin.sym} -1240 -2000 0 0 {name=p1 sig_type=std_logic lab=in}
C {lab_pin.sym} -1170 -1990 0 0 {name=p2 sig_type=std_logic lab=out
}
C {lab_pin.sym} -1140 -2080 0 0 {name=p3 sig_type=std_logic lab=vdd}
C {vsource.sym} -1030 -2010 0 0 {name=Vdd value=1.8 savecurrent=false}
C {vsource.sym} -1290 -1930 0 0 {name=Vin value="pulse(0 1.8 1n 100p 100p 5n 10n)" savecurrent=false}
C {gnd.sym} -1170 -1870 0 0 {name=l1 lab=0}
C {code_shown.sym} -1490 -2190 0 0 {name=s1 only_toplevel=false value="
.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.control
save all
tran 10p 30n
run
plot in out
.endc"}
