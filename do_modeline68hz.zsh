#!/bin/zsh
#/usr/bin/xrandr --newmode "1280x1024_65.00" 118.50 1280 1368 1496 1712 1024 1027 1034 1066 -hsync +vsync
/usr/bin/xrandr --newmode "1280x1024_68.00" 125.14 1280 1368 1504 1728 1024 1025 1028 1065 -HSync +Vsync
/usr/bin/xrandr --addmode DVI-I-1 "1280x1024_68.00"
#/usr/bin/xrandr --mode "1280x1024_65.00"
/usr/bin/xrandr --output DVI-I-1  --mode "1280x1024_68.00"


# 1280x1024 @ 68.00 Hz (GTF) hsync: 72.42 kHz; pclk: 125.14 MHz
#Modeline "1280x1024_68.00" 125.14 1280 1368 1504 1728 1024 1025 1028 1065 -HSync +Vsync


