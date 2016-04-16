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
source settings.conf

echo ""
echo -e "--------------------------------------------------------------------"
echo -e ">>>>>>>>                 Generating Graphics                <<<<<<<<"
echo -e ">>>>>>>>                   Wait a moment...                 <<<<<<<<"
echo -e "--------------------------------------------------------------------"
echo ""

chmod +x $SPEED_BIN/*.sh
$SPEED_BIN/report_gen.sh && $SPEED_BIN/report_plot.sh