copy dftb_in_scf.hsd dftb_in.hsd 
C:\DFTB17.1Windows\DFTB17.1Windows-CygWin\dftb+.exe

find "Total energy:" <detailed.out> total_energy.dat
find "Fermi level:" <detailed.out> fermi_energy.dat
C:\jmol-14.30.2\jmol.jar geo_end.xyz

REM copy dftb_in_dos.hsd dftb_in.hsd 
REM C:\DFTB17.1Windows\DFTB17.1Windows-CygWin\dftb+.exe

REM copy dftb_in_band.hsd dftb_in.hsd 
REM C:\DFTB17.1Windows\DFTB17.1Windows-CygWin\dftb+.exe

REM del dftb_in.hsd 

REM mkdir plot

REM find /v "KPT" <band.out> band.dat
REM gnuplot band_spin.gp
REM copy band.plot .\plot\band.plot
REM copy band.png .\plot\band.png
REM copy band_wide.png .\plot\band_wide.png

REM del band.dat