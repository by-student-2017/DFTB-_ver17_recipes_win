# get data size
stats "dos.dat" using 1 nooutput
TN = STATS_records   # total number of lines
BN = STATS_blank 
PN = TN/BN

# declare Array
array datax[TN]
array datay[TN]

# save
stats "dos.dat" using (datax[$0+1] = $1, 0) nooutput
stats "dos.dat" using (datay[$0+1] = $2, 0) nooutput

# gauss broadening
gauss(x,c,r,s)=r*1/(s*sqrt(2*pi))*exp(-0.5*((x-c)/s)**2)
stats "dos.dat" using 1:2 nooutput
xmin = STATS_min_x 
xmax = STATS_max_x 
array eV[300]
array dos_up[300]
array dos_down[300]
set print "dos_spin.plot"
do for [i=1:300]{
  eV[i] = (xmax - xmin)/300*i + xmin
  dos_up[i] = 0.0
  dos_down[i] = 0.0
  do for [j=1:BN/2]{
    dos_up[i] = dos_up[i] + gauss(eV[i],datax[j],datay[j],0.03)
    dos_down[i] = dos_down[i] + gauss(eV[i],datax[j+TN/2],datay[j+TN/2],0.03)
  }
  print eV[i],dos_up[i],dos_down[i]
}

# plot
set terminal png
set output "dos_spin.png"
set xlabel "Energy (eV)"
set ylabel "Density of States (arb.units)"
#set xrange[-15:5]
plot "dos_spin.plot" u 1:2 w l t "up", "dos_spin.plot" u 1:3 w l t "down"
