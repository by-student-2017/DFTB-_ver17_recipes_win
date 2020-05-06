# plot
set terminal png
set output "all_dos.png"
set xlabel "Energy (eV)"
set ylabel "Density of States (arb.units)"
#set xrange[-15:5]
plot "tdos_spin.plot" u 1:2 w l t "total dos", "dos_co.s.plot" u 1:2 w l t "Co s", "dos_co.p.plot" u 1:2 w l t "Co p", "dos_co.d.plot" u 1:2 w l t "Co d"
