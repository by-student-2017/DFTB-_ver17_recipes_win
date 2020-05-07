# get data size
stats "dos.dat" using 1 nooutput
N = STATS_records   # total number of lines

# declare Array
array datax[N]
array datay[N]

# save
stats "dos.dat" using (datax[$0+1] = $1, 0) nooutput
stats "dos.dat" using (datay[$0+1] = $2, 0) nooutput

# gauss broadening
gauss(x,c,r,s)=r*1/(s*sqrt(2*pi))*exp(-0.5*((x-c)/s)**2)
stats "dos.dat" using 1:2 nooutput
xmin = STATS_min_x 
xmax = STATS_max_x 
array eV[300]
array dos[300]
set print "dos.plot"
do for [i=1:300]{
  eV[i] = (xmax - xmin)/300*i + xmin
  dos[i] = 0.0
  do for [j=1:N]{
    dos[i] = dos[i] + gauss(eV[i],datax[j],datay[j],0.03)
  }
  print eV[i],dos[i]
}

# plot
set terminal png
set output "dos.png"
set xlabel "Energy (eV)"
set ylabel "Density of States (arb.units)"
#set xrange[-15:5]
plot "dos.plot" u 1:2 w l t "partial dos"
