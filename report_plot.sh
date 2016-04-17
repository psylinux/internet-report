#!/bin/bash
#
# Vatra Networks - http://www.vatra.com.br
# Marcos Azevedo (marcos@vatra.com.br)
# Cel/WhatsApp +55 64 8433-2988
#

### BEGIN INIT INFO
# Provides: report_plot.sh
### END INIT INFO


### Setting enviroment variables
source /opt/internet-report/etc/settings.conf

d=`date +%d%m%Y`
ping=$d"ping.txt"
up=$d"upload.txt"
dow=$d"download.txt"
now=$(date +"%d_%m_%Y")
FILE=$SPEED_DATA/$dow
FILEA=$SPEED_DATA/$up
FILEB=$SPEED_DATA/$ping


`cat > plot.dat << EOF
	set datafile separator ";"
	set grid
	set xdata time
	set timefmt '%Y-%m-%d %H:%M'
	set xtics format '%H:%M'
	set xlabel "Time"
	set ylabel "Mbit/s"
	set terminal png medium
	set output "$SPEED_REPORTS/speedupdown.png"
	set title "upload/download speed $now"
	plot "$FILEA" using 1:(column(2)) t "Upload" with lines lt 1 lw 3 linecolor 2, "$FILE" using 1:(column(2)) t "Download" with lines lt 1 lw 3 linecolor 1
	quit
	PLOT
EOF`

#### Plotting
gnuplot plot.dat

`cat > plot.dat << EOF
	set datafile separator ";"
	set grid
	set xdata time
	set timefmt '%Y-%m-%d %H:%M'
	set xtics format '%H:%M'
	set xlabel "Time Ping 0ms = offline"
	set ylabel "milliseconds"
	set terminal png medium
	set output "$SPEED_REPORTS/ping.png"
	set title "ping google.com $now"
	plot "$FILEB" using 1:(column(2)) t "Latency" with lines lt 1 lw 3 linecolor 3
	quit
	PLOT
EOF`

#### Plotting
gnuplot plot.dat 

#### Removing .dat file
rm -rf *.dat

#### Sending graphics through email
#sendEmail -f YOUREMAIL@gmail.com -t YOUREMAIL@gmail.com -u "Internet Speed Reports" -m "Upload/Download/Ping" -xu YOUREMAIL@gmail.com -xp YOURPASSWORD -o tls=yes -s smtp.gmail.com:587 -a $DIR/speedupdown.png $DIR/ping.png
