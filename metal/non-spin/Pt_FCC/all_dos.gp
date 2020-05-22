# plot
set terminal png
set output "all_dos.png"
set xlabel "Energy (eV)"
set ylabel "Density of States (arb.units)"
#set xrange[-15:5]
plot "tdos.plot" u 1:2 w l t "total dos", "dos_pt.s.plot" u 1:2 w l t "Pt s", "dos_pt.p.plot" u 1:2 w l t "Pt p", "dos_pt.d.plot" u 1:2 w l t "Pt d"
