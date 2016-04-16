# Internet Speed Report
**Internet Speed Report** is a simple command line script that automates internet speed testing by generating graphics report in **.png** format out of reports directory.

## ATTENTION
Internet Speed Report will be installed by default in **/tmp/internet_report/**
To change this behavior you can edit **settings.conf** and change **SPEED_HOME** to directory you wish. For example:
**SPEED_HOME="/opt"** will install Internet Speed Report into /opt directory.

## How to Install
```bash
* git clone https://github.com/psylinux/internet_report.git internet_report
* cd internet_report/
* chmod +x setup.sh
* ./setup.sh
```

## How to Use it
```bash
* cd /tmp/internet_report/bin
* ./speed_check.sh
```

## Final Settings
We are going to cron sript internetspeed.sh

To check ping and speed every 20 minutes:
```bash
$ sudo nano /etc/crontab
```
add:
*/20 * * * * pi bash /tmp/internet_report/bin/speed_check.sh

Do not check massively your speed. Allow SpeedClient servers free for other users, please.
Many testings are not goods for your internet speed too. I turn on each time that internet connection seems go too much slow.

You can receive by email your daily internet speed report whenever you want with following command:
```bash
$ bash /tmp/internet_report/bin/speed_check.sh
```
My favourite setting is to receive email report at the end of day, so I cron the script speed_check.sh as follow:
```bash
$ sudo nano /etc/crontab
```
add:
00 23 * * * pi bash /tmp/internet_report/bin/speed_check.sh