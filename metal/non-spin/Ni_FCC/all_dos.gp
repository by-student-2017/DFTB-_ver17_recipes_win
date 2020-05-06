# plot
set terminal png
set output "all_dos.png"
set xlabel "Energy (eV)"
set ylabel "Density of States (arb.units)"
#set xrange[-15:5]
plot "tdos_spin.plot" u 1:2 w l t "total dos", "dos_ni.s.plot" u 1:2 w l t "Ni s", "dos_ni.p.plot" u 1:2 w l t "Ni p", "dos_ni.d.plot" u 1:2 w l t "Ni d"
