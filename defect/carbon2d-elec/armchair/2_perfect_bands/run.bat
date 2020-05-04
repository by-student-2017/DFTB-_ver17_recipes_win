copy ..\1_perfect_density\charges.bin charges.bin
copy ..\1_perfect_density\info.dat info.dat

C:\DFTB17.1Windows\DFTB17.1Windows-CygWin\dftb+.exe

REM find "Fermi level:" <detailed.out> info.dat
REM find "Total energy:" <detailed.out>> info.dat
REM C:\jmol-14.30.2\jmol.jar geo_end.xyz

mkdir plot

find /v "KPT" <band.out> band.dat
gnuplot band.gp
copy band.plot .\plot\band.plot
copy band.png .\plot\band.png
copy band_wide.png .\plot\band_wide.png

copy ..\1_perfect_density\plot\tdos.plot tdos.plot
gnuplot layout.gp

del band.dat
del tdos.plot
del info_gnu.dat