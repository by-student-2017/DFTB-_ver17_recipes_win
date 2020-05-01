# plot
set terminal png
set output "all_dos_up.png"
set xlabel "Energy (eV)"
set ylabel "Density of States (arb.units)"
#set xrange[-15:5]
set yrange[0:*]
plot "tdos_spin.plot" u 1:2 w l t "total dos", "dos_o.s.plot" u 1:2 w l t "O s", "dos_o.p.plot" u 1:2 w l t "O p", "dos_zn.s.plot" u 1:2 w l t "Zn s", "dos_zn.p.plot" u 1:2 w l t "Zn p", "dos_zn.d.plot" u 1:2 w l t "Zn d"


# plot
set terminal png
set output "all_dos_down.png"
set xlabel "Energy (eV)"
set ylabel "Density of States (arb.units)"
#set xrange[-15:5]
set yrange[0:*]
plot "tdos_spin.plot" u 1:3 w l t "total dos", "dos_o.s.plot" u 1:3 w l t "O s", "dos_o.p.plot" u 1:3 w l t "O p", "dos_zn.s.plot" u 1:3 w l t "Zn s", "dos_zn.p.plot" u 1:3 w l t "Zn p", "dos_zn.d.plot" u 1:3 w l t "Zn d"
