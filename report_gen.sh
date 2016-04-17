#!/bin/bash
#
# Vatra Networks - http://www.vatra.com.br
# Marcos Azevedo (marcos@vatra.com.br)
# Cel/WhatsApp +55 64 8433-2988
#

### BEGIN INIT INFO
# Provides: report_gen.sh
### END INIT INFO

### Setting enviroment variables
source /opt/internet-report/etc/settings.conf

d=`date +%d%m%Y`
ping=$d"ping.txt"
up=$d"upload.txt"
dow=$d"download.txt"

#### Creating SPEED_TESTER Directories
mkdir -p $SPEED_DATA
cd $SPEED_PATH

#### Testing internet speed
speedtest-cli > $SPEED_DATA/speed.txt ;
ping -c 1 google.com > $SPEED_DATA/ping.txt ;

if [ -f $SPEED_DATA/$ping ]; then
	date +%Y-%m-%d" "%H:%M";" | tr -d '\012\015' >> $SPEED_DATA/$ping
else
	touch $SPEED_DATA/$ping | date +%Y-%m-%d" "%H:%M";" | tr -d '\012\015' >> $SPEED_DATA/$ping
fi

if [ -f $SPEED_DATA/$up ]; then
	date +%Y-%m-%d" "%H:%M";" | tr -d '\012\015' >> $SPEED_DATA/$up
else
	touch $SPEED_DATA/$up | date +%Y-%m-%d" "%H:%M";" | tr -d '\012\015' >> $SPEED_DATA/$up
fi

if [ -f $SPEED_DATA/$dow ]; then
	date +%Y-%m-%d" "%H:%M";" | tr -d '\012\015' >> $SPEED_DATA/$dow
else
	touch $SPEED_DATA/$dow | date +%Y-%m-%d" "%H:%M";" | tr -d '\012\015' >> $SPEED_DATA/$dow
fi

atr=`sed -n 2p $SPEED_DATA/ping.txt`
att=`expr match "$atr" '.*\([time=]...*\)' | sed -e 's/=//g' | sed -e 's/ms//g'`

if [ "$att" == "" ]; then
	echo "0.00" >> $SPEED_DATA/$ping
else
	echo "$att" >> $SPEED_DATA/$ping
fi

utr=`sed -n 9p $SPEED_DATA/speed.txt`
utt=`expr match "$utr" '.*\([:]...*\)' | sed -e 's/^..//g' | sed -e 's/Mbit\/s//g'`

if [ "$utt" == "" ]; then
	echo "0.00" >> $SPEED_DATA/$up
else
	echo "$utt" >> $SPEED_DATA/$up
fi

str=`sed -n 7p $SPEED_DATA/speed.txt`
stt=`expr match "$str" '.*\([:]...*\)' | sed -e 's/^..//g' | sed -e 's/Mbit\/s//g'`

if [ "$stt" == "" ]; then
	echo "0.00" >> $SPEED_DATA/$dow
else
	echo "$stt" >> $SPEED_DATA/$dow
fi
