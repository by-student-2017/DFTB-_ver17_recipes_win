# plot
set terminal png
set output "all_dos.png"
set xlabel "Energy (eV)"
set ylabel "Density of States (arb.units)"
#set xrange[-15:5]
plot "tdos.plot" u 1:2 w l t "total dos", "dos_mg.s.plot" u 1:2 w l t "Mg s", "dos_mg.p.plot" u 1:2 w l t "Mg p", "dos_h.s.plot" u 1:2 w l t "H s"
