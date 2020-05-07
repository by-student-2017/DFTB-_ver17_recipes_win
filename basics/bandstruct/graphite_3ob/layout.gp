#------------------------------------------
# get fermi energy data
stats "info_gnu.dat"
NI = STATS_records
array EF[NI]
stats "info_gnu.dat" using (EF[$0+1] = $2, 0) nooutput
ef = EF[1]

# plot
set terminal png
set output "band_tdos_BE.png"

set multiplot

set lmargin screen 0.15
set rmargin screen 0.7
set tmargin screen 0.9
set bmargin screen 0.1
set xr[:] noreverse
set yr[30:-30]
set ytics
set noxtics
set ylabel "Binding Energy (eV)"
set xzeroaxis
plot "band.plot" u 1:(ef-$2) w p pt 7 ps 0.6 t ""

set lmargin screen 0.7
set rmargin screen 0.9
set tmargin screen 0.9
set bmargin screen 0.1
set yr[30:-30]
#set xtics rotate by 90
#set ytics rotate by 90
unset ylabel
set noxtics
set noytics
set xzeroaxis
plot "tdos.plot" u 2:(ef-$1) w l t ""

unset multiplot
#------------------------------------------
# plot
set terminal png
set output "band_tdos.png"

set multiplot

set lmargin screen 0.15
set rmargin screen 0.7
set tmargin screen 0.9
set bmargin screen 0.1
set xr[:] noreverse
set yr[-30:30]
set ytics
set noxtics
set ylabel "Energy (eV)"
unset xzeroaxis
plot "band.plot" u 1:2 w p pt 7 ps 0.6 t ""

set lmargin screen 0.7
set rmargin screen 0.9
set tmargin screen 0.9
set bmargin screen 0.1
set yr[-30:30]
#set xtics rotate by 90
#set ytics rotate by 90
set noxtics
set noytics
unset ylabel
unset xzeroaxis
plot "tdos.plot" u 2:1 w l t ""

unset multiplot
