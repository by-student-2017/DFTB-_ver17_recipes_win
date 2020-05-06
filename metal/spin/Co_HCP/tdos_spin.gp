# get data size
stats "tdos.dat" using 1 nooutput
TN = STATS_records   # total number of lines
BN = STATS_blank 
PN = TN/BN

# declare Array
array data[TN]

# save
stats "tdos.dat" using (data[$0+1] = $1, 0) nooutput

# get fermi energy data
set table "info_gnu.dat"
plot "info.dat" u 3:5 w p
stats "info_gnu.dat"
NI = STATS_records
array EF[NI]
stats "info_gnu.dat" using (EF[$0+1] = $2, 0) nooutput
ef = EF[1]
unset table

# gauss broadening
gauss(x,c,r,s)=r*1/(s*sqrt(2*pi))*exp(-0.5*((x-c)/s)**2)
stats "tdos.dat" using 1:2 nooutput
xmin = STATS_min_x 
xmax = STATS_max_x 
array eV[300]
array tdos_up[300]
array tdos_down[300]
set print "tdos_spin.plot"
do for [i=1:300]{
  eV[i] = (xmax - xmin)/300*i + xmin
  tdos_up[i] = 0.0
  tdos_down[i] = 0.0
  do for [j=1:BN/2]{
    tdos_up[i] = tdos_up[i] + gauss(eV[i],data[j],1,0.03)
    tdos_down[i] = tdos_down[i] + gauss(eV[i],data[j+TN/2],1,0.03)
  }
  print eV[i],tdos_up[i],tdos_down[i]
}

# plot
set terminal png
set output "tdos_spin.png"
set xlabel "Energy (eV)"
set ylabel "Density of States (arb.units)"
#set xrange[-15:5]
plot "tdos_spin.plot" u 1:2 w l t "up", "tdos_spin.plot" u 1:3 w l t "down"

# plot
set terminal png
set output "tdos_spin_BE.png"
set xlabel "Binding Energy (eV)"
set ylabel "Density of States (arb.units)"
set xrange [*:*] reverse
set yzeroaxis
plot "tdos_spin.plot" u (ef-$1):2 w l t "up", "tdos_spin.plot" u (ef-$1):3 w l t "down"
