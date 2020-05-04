# plot
set terminal png
set output "all_dos.png"
set xlabel "Energy (eV)"
set ylabel "Density of States (arb.units)"
#set xrange[-15:5]
plot "tdos.plot" u 1:2 w l t "total dos", "dos_c.s.plot" u 1:2 w l t "C s", "dos_c.p.plot" u 1:2 w l t "C p"