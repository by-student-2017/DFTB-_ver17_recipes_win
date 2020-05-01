# get data size
stats "tdos.dat" using 1 nooutput
N = STATS_records   # total number of lines

# declare Array
array data[N]

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
array tdos[300]
set print "tdos.plot"
do for [i=1:300]{
  eV[i] = (xmax - xmin)/300*i + xmin
  tdos[i] = 0.0
  do for [j=1:N]{
    tdos[i] = tdos[i] + gauss(eV[i],data[j],1,0.03)
  }
  print eV[i],tdos[i]
}

# plot
set terminal png
set output "tdos.png"
set xlabel "Energy (eV)"
set ylabel "Density of States (arb.units)"
#set xrange[-15:5]
plot "tdos.plot" u 1:2 w l t "total dos"

# plot
set terminal png
set output "tdos_BE.png"
set xlabel "Binding Energy (eV)"
set ylabel "Density of States (arb.units)"
set xrange [*:*] reverse
set yzeroaxis
plot "tdos.plot" u (ef-$1):2 w l t "total dos"
