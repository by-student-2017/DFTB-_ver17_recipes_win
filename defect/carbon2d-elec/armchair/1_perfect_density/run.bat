C:\DFTB17.1Windows\DFTB17.1Windows-CygWin\dftb+.exe

find "Fermi level:" <detailed.out> info.dat
find "Total energy:" <detailed.out>> info.dat
REM C:\jmol-14.30.2\jmol.jar geo_end.xyz

mkdir plot

find /v "KPT" <band.out> tdos.dat
gnuplot tdos.gp
move tdos.plot .\plot\tdos.plot
move tdos.png .\plot\tdos.png

del tdos.dat
del dos.dat
del info_gnu.dat