copy ..\1_density\charges.bin charges.bin
C:\DFTB17.1Windows\DFTB17.1Windows-CygWin\dftb+.exe
mkdir plot

find /v "KPT" <band.out> band.dat
gnuplot band.gp
copy band.plot .\plot\band.plot
copy band.png .\plot\band.png
copy band_wide.png .\plot\band_wide.png

del band.dat