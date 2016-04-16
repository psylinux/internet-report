#!/bin/bash
#
# Vatra Networks - http://www.vatra.com.br
# Marcos Azevedo (marcos@vatra.com.br)
# Cel/WhatsApp +55 64 8433-2988
#

### BEGIN INIT INFO
# Provides: check.sh
### END INIT INFO

### Setting enviroment variables
SPEED_HOME="/tmp"
SPEED_PATH="$SPEED_HOME/speed_tester"
SPEED_DATA="$SPEED_PATH/data"
SPEED_BIN="$SPEED_PATH/bin"

echo ""
echo -e "--------------------------------------------------------------------"
echo -e ">>>>>>>>                 Generating Graphics                <<<<<<<<"
echo -e ">>>>>>>>                   Wait a moment...                 <<<<<<<<"
echo -e "--------------------------------------------------------------------"
echo ""

chmod +x $SPEED_BIN/*.sh
$SPEED_BIN/internetspeed.sh && $SPEED_BIN/plot.sh