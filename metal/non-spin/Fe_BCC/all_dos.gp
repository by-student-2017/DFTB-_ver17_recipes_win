# plot
set terminal png
set output "all_dos.png"
set xlabel "Energy (eV)"
set ylabel "Density of States (arb.units)"
#set xrange[-15:5]
plot "tdos_spin.plot" u 1:2 w l t "total dos", "dos_fe.s.plot" u 1:2 w l t "Fe s", "dos_fe.p.plot" u 1:2 w l t "Fe p", "dos_fe.d.plot" u 1:2 w l t "Fe d"
