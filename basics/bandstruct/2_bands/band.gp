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
set print "band.plot"
do for [i=1:BN]{
  do for [j=PN*(i-1)+1:PN*i]{
    print i,data[j]
  }
}

# plot
set terminal png
set output "band.png"
unset xtics
set yrange [-7:5]
set ylabel "Energy (eV)"
plot "band.plot" u 1:2 w p pt 7 ps 0.6 t ""

# plot
set terminal png
set output "band_wide.png"
unset xtics
unset yrange
set ylabel "Energy (eV)"
plot "band.plot" u 1:2 w p pt 7 ps 0.6 t ""
