#!/usr/bin/env bash

sizes=(1 5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95 100 105 110 115 120 125 130 135 140 145 150 155 160 165 170 175 180 185 190 195 200 205 210 215 220 225 230 235 240 245 250 255 260 265 270 275 280 285 290 295 300)


for T in "${sizes[@]}"
do
	make T=$T 1>/dev/null
    echo -n "$T "
    res="$(ocperf.py stat -r 5 -e cycles:u '-x ' ./main-$T 2>&1 > /dev/null)"
    echo $res | cut '-d ' -f1

done
