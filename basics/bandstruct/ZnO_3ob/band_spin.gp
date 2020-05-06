# get data size
stats "band.dat" using 1 nooutput
TN = STATS_records   # total number of lines
BN = STATS_blank 
PN = TN/BN

# declare Array
array data[TN]

# save
stats "band.dat" using (data[$0+1] = $1, 0) nooutput

# arrange data
set print "band_spin.plot"
do for [i=1:BN/2]{
  do for [j=PN*(i-1)+1:PN*i]{
    print i,data[j],data[j+TN/2]
  }
}

# plot
set terminal png
set output "band_spin.png"
unset xtics
set yrange [-7:5]
set ylabel "Energy (eV)"
plot "band_spin.plot" u 1:2 w p pt 7 ps 0.6 t "up", "band_spin.plot" u 1:3 w p pt 7 ps 0.6 t "down"

# plot
set terminal png
set output "band_wide_spin.png"
unset xtics
unset yrange
set ylabel "Energy (eV)"
plot "band_spin.plot" u 1:2 w p pt 7 ps 0.6 t "up", "band_spin.plot" u 1:3 w p pt 7 ps 0.6 t "down"
