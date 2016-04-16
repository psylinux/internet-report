#!/bin/bash
#
# Vatra Networks - http://www.vatra.com.br
# Marcos Azevedo (marcos@vatra.com.br)
# Cel/WhatsApp +55 64 8433-2988
#

### BEGIN INIT INFO
# Provides: setup.sh
### END INIT INFO

### Setting enviroment variables
SPEED_HOME="/tmp"
SPEED_PATH="$SPEED_HOME/speed_tester"
SPEED_DATA="$SPEED_PATH/data"
SPEED_BIN="$SPEED_PATH/bin"

function uninstall() {
	rm -rf $SPEED_PATH
}

function install() {
	echo ""
	echo -e "--------------------------------------------------------------------"
	echo -e ">>>>>>>>            Installing the Speed Tester             <<<<<<<<"
	echo -e "--------------------------------------------------------------------"
	echo ""
	apt-get update -y
	apt-get install gzip bzip2 python2.7 gnuplot-x11 sendmail -y
	pip install speedtest-cli
	uninstall
	mkdir -p $SPEED_DATA
	mkdir -p $SPEED_BIN
	mv internetspeed.sh plot.sh $SPEED_BIN	
	mv speed_check.sh $SPEED_PATH
	echo ""
	echo -e "----------------------------------------------------------------------------------"
	echo -e ">>>>>>>>    Speed Tester successful installed under $SPEED_PATH     <<<<<<<<"
	echo -e "----------------------------------------------------------------------------------"
	echo ""
	
}

case "$1" in
	clean)
		uninstall
	;;

	install)
		uninstall;
	    install;
		rm -rf ./*.sh		
	;;

    *)
		echo " "
		echo -e "--------------------------------------------------------------------"
		echo -e ">>>>>>>>               Speed Tester Installer               <<<<<<<<"
		echo -e "--------------------------------------------------------------------"
		echo ""
		echo -e "Usage: setup.sh {install|clean}"
		echo " "
esac

exit 0
