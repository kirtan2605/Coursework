#!/bin/bash

gcc G_plot.c -lm
for i in {0..100..20}; #Variance varies from 0 to 40 with steps of 10
do
    ./a.out 0 $i > Gaussian.txt

gnuplot -persist <<-EOFMarker
set title 'Gaussian Distribution'
set xlabel 'x'
set ylabel 'y'
plot 'Gaussian.txt' with lines title 'Gaussian Distribution' lt 3 lc 2
EOFMarker

done