#!/bin/bash
#
# Vatra Networks - http://www.vatra.com.br
# Marcos Azevedo (marcos@vatra.com.br)
# Cel/WhatsApp +55 64 8433-2988
#

### BEGIN INIT INFO
# Provides: speed_check.sh
### END INIT INFO

### Setting enviroment variables
source ../etc/settings.conf

echo ""
echo -e "--------------------------------------------------------------------"
echo -e ">>>>>>>>                 Generating Graphics                <<<<<<<<"
echo -e ">>>>>>>>                   Wait a moment...                 <<<<<<<<"
echo -e "--------------------------------------------------------------------"
echo ""

### Running
./report_gen.sh && ./report_plot.sh

echo ""
echo -e "--------------------------------------------------------------------"
echo -e ">>>>>>>>         Report Graphics are available in           <<<<<<<<"
echo -e ">>>>>>>>           $SPEED_REPORTS          <<<<<<<<"
echo -e "--------------------------------------------------------------------"
echo ""
