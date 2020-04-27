# plot
set terminal png
set output "all_dos.png"
set xlabel "Energy (eV)"
set ylabel "Density of States (arb.units)"
#set xrange[-15:5]
plot "tdos.plot" u 1:2 w l t "total dos", "dos_o.s.plot" u 1:2 w l t "O s", "dos_o.p.plot" u 1:2 w l t "O p", "dos_ti.s.plot" u 1:2 w l t "Ti s", "dos_ti.p.plot" u 1:2 w l t "Ti p", "dos_ti.d.plot" u 1:2 w l t "Ti d"
