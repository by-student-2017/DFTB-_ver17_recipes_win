# plot
set terminal png
set output "all_dos.png"
set xlabel "Energy (eV)"
set ylabel "Density of States (arb.units)"
#set xrange[-15:5]
plot "tdos_spin.plot" u 1:2 w l t "total dos", "dos_cu.s.plot" u 1:2 w l t "Cu s", "dos_cu.p.plot" u 1:2 w l t "Cu p", "dos_cu.d.plot" u 1:2 w l t "Cu d"
