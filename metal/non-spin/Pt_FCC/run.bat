copy dftb_in_scf.hsd dftb_in.hsd 
C:\DFTB17.1Windows\DFTB17.1Windows-CygWin\dftb+.exe


copy dftb_in_dos.hsd dftb_in.hsd 
C:\DFTB17.1Windows\DFTB17.1Windows-CygWin\dftb+.exe

find "Total energy:" <detailed.out> total_energy.dat
find "Fermi level:" <detailed.out> fermi_energy.dat

find "Fermi level:" <detailed.out> info.dat
find "Total energy:" <detailed.out>> info.dat
REM C:\jmol-14.30.2\jmol.jar geo_end.xyz

mkdir plot

find /v "KPT" <band.out> tdos.dat
gnuplot tdos.gp
move tdos.plot .\plot\tdos.plot
move tdos.png .\plot\tdos.png
copy info_gnu.dat .\plot\info_gnu.dat

find /v "KPT" <dos_pt.1.out> dos.dat
gnuplot pdos.gp
move dos.png .\plot\dos_pt.s.png
move dos.plot .\plot\dos_pt.s.plot

find /v "KPT" <dos_pt.2.out> dos.dat
gnuplot pdos.gp
move dos.png .\plot\dos_pt.p.png
move dos.plot .\plot\dos_pt.p.plot

find /v "KPT" <dos_pt.3.out> dos.dat
gnuplot pdos.gp
move dos.png .\plot\dos_pt.d.png
move dos.plot .\plot\dos_pt.d.plot

cd plot
gnuplot ..\all_dos.gp
copy all_dos.png ..\all_dos.png
cd ..


copy dftb_in_band.hsd dftb_in.hsd 
C:\DFTB17.1Windows\DFTB17.1Windows-CygWin\dftb+.exe

del dftb_in.hsd 

find /v "KPT" <band.out> band.dat
gnuplot band.gp
copy band.plot .\plot\band.plot
copy band.png .\plot\band.png
copy band_wide.png .\plot\band_wide.png

cd plot
gnuplot ..\layout.gp
copy band_tdos.png ..\band_tdos.png
copy band_tdos_BE.png ..\band_tdos_BE.png
cd ..

del band.dat
del tdos.dat
del info_gnu.dat