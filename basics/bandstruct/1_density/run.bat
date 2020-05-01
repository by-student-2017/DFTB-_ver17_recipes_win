C:\DFTB17.1Windows\DFTB17.1Windows-CygWin\dftb+.exe

find "Fermi level:" <detailed.out> info.dat
find "Total energy:" <detailed.out>> info.dat
REM C:\jmol-14.30.2\jmol.jar geo_end.xyz

mkdir plot

find /v "KPT" <band.out> tdos.dat
gnuplot tdos.gp
move tdos.plot .\plot\tdos.plot
move tdos.png .\plot\tdos.png

find /v "KPT" <dos_o.1.out> dos.dat
gnuplot pdos.gp
move dos.png .\plot\dos_o.s.png
move dos.plot .\plot\dos_o.s.plot

find /v "KPT" <dos_o.2.out> dos.dat
gnuplot pdos.gp
move dos.png .\plot\dos_o.p.png
move dos.plot .\plot\dos_o.p.plot

find /v "KPT" <dos_ti.1.out> dos.dat
gnuplot pdos.gp
move dos.png .\plot\dos_ti.s.png
move dos.plot .\plot\dos_ti.s.plot

find /v "KPT" <dos_ti.2.out> dos.dat
gnuplot pdos.gp
move dos.png .\plot\dos_ti.p.png
move dos.plot .\plot\dos_ti.p.plot

find /v "KPT" <dos_ti.3.out> dos.dat
gnuplot pdos.gp
move dos.png .\plot\dos_ti.d.png
move dos.plot .\plot\dos_ti.d.plot

cd plot
gnuplot ..\all_dos.gp
copy all_dos.png ..\all_dos.png
cd ..

del tdos.dat
del dos.dat
del info_gnu.dat