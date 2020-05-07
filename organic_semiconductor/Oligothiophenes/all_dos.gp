# plot
set terminal png
set output "all_dos.png"
set xlabel "Energy (eV)"
set ylabel "Density of States (arb.units)"
#set xrange[-15:5]
plot "tdos.plot" u 1:2 w l t "total dos", "dos_s.s.plot" u 1:2 w l t "S s", "dos_s.p.plot" u 1:2 w l t "S p", "dos_s.d.plot" u 1:2 w l t "S d", "dos_c.s.plot" u 1:2 w l t "C s", "dos_c.p.plot" u 1:2 w l t "C p", "dos_h.s.plot" u 1:2 w l t "H s"
