# Internet Speed Report
**Internet Speed Report** is a simple command line script that automates internet speed testing by generating graphics report in **.png** format out of reports directory.

## ATTENTION
Internet Speed Report will be installed by default in **/opt/internet_report/**
To change this behavior you can edit **settings.conf** and change **SPEED_HOME** to directory you wish. For example:
**SPEED_HOME="/opt"** will install Internet Speed Report into /opt directory.

## How to Install
```bash
* git clone https://github.com/psylinux/internet_report.git ir_installer
* cd ir_installer/
* chmod +x setup.sh
* sudo ./setup.sh
```

## How to Use it
```bash
* cd /opt/internet_report/bin
* ./speed_check.sh
```

## Where are the reports?
* The graphic report can be viewed inside **reports directory**.
* The text report can be viewed inside **data directory**. Just use an text editor to open **.txt** files.
* The **ping.txt** and **speed.txt** just show the latest speed test performed.

## Final Settings
We are going to cron sript internetspeed.sh

To check ping and speed every 20 minutes:
```bash
$ sudo nano /etc/crontab
```
add:
```bash
*/20 * * * * pi bash /opt/internet_report/bin/speed_check.sh
````

**Do not check massively your speed. Allow SpeedClient servers free for other users, please.**
Many testings are not good for your internet speed too. I turn on each time that internet connection seems go too much slow.

You can receive by email your daily internet speed report whenever you want with following command:
```bash
$ bash /opt/internet_report/bin/speed_check.sh
```

My favourite setting is to receive email report at the end of day, so I cron the script speed_check.sh as follow:
```bash
$ sudo nano /etc/crontab
```

add:
```bash
00 23 * * * pi bash /opt/internet_report/bin/speed_check.sh
```
