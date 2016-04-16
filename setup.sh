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
source settings.conf

function uninstall() {
	rm -rf $SPEED_PATH
}

function install() {
	echo ""
	echo -e "--------------------------------------------------------------------"
	echo -e ">>>>>>>>       Installing the Internet Speed Report         <<<<<<<<"
	echo -e "--------------------------------------------------------------------"
	echo ""
	### Updating and installing dependecies
	apt-get update -y
	apt-get install gzip bzip2 python2.7 gnuplot-x11 sendmail -y
	pip install speedtest-cli

	### Uninstalling old versions of Internet Speed Report
	uninstall

	### Creating directories
	mkdir -p $SPEED_DATA
	mkdir -p $SPEED_BIN
	mkdir -p $SPEED_ETC
	mkdir -p $SPEED_REPORTS

	### Moving files to destination directory
	cp -f *.sh $SPEED_BIN
	cp -f *.conf $SPEED_ETC
	cp -f README.md $SPEED_PATH

	### Setting right permissions
	chmod +x $SPEED_BIN/*
	rm -rf $SPEED_BIN/setup.sh

	echo ""
	echo -e "---------------------------------------------------------------------------------------"
	echo -e ">>>>>>>> Internet Speed Report successful installed under $SPEED_PATH <<<<<<<<"
	echo -e "---------------------------------------------------------------------------------------"
	echo ""

}

case "$1" in
	clean)
		uninstall
	;;

	install)
		uninstall;
	    install;		
	;;

    *)
		echo " "
		echo -e "--------------------------------------------------------------------"
		echo -e ">>>>>>>>        Internet Speed Report Installer             <<<<<<<<"
		echo -e ">>>>>>>>           Marcos Azevedo (psylinux)                <<<<<<<<"
		echo -e "--------------------------------------------------------------------"
		echo ""
		echo -e "Usage: setup.sh {install|clean}"
		echo " "
esac

exit 0
