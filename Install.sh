#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo "Installer must be run as root."
	echo "Try 'sudo bash $0'"
	exit 1
fi

clear
echo "This script downloads and installs"
echo "retrogame, a GPIO-to-keypress utility"
echo "TFT driver juj"
echo "I2C Sound"
echo "Theme 3.5 GBZ"
echo "one of several configuration files."
echo "Run time <5 minutes. Reboot recommended."
echo

echo -n "Mounting Partition BOOT.."

mount -o ,remount rw /boot
echo "Mount OK..."
sleep 5
clear

echo -n "Downloading GameGearZero files..."

	sleep 5
	echo "Adafruit-retrogame.."
	sleep 2
	curl -f -s -o /tmp/retrogame https://github.com/kaiseru/GameGearZero/blob/master/retrogame
	sleep 2
	echo "TFT Driver JUJ..."
	sleep 2
    curl -f -s -o /tmp/TFT https://github.com/kaiseru/GameGearZero/blob/master/TFT
	sleep 2
	echo "theme-gbz35 Rxbrad .."
	curl -f -s -o /tmp/GBZ35 https://github.com/rxbrad/es-theme-gbz35.git
    sleep 2
	echo " Downloading Configuration files.."
	curl -f -s -o /tmp/config.txt https://github.com/kaiseru/GameGearZero/blob/master/config.txt
	curl -f -s -o /tmp/asound.conf https://github.com/kaiseru/GameGearZero/blob/master/asound.conf
	curl -f -s -o /tmp/retrogame.cfg https://github.com/kaiseru/GameGearZero/blob/master/retrogame.cfg
	curl -f -s -o /tmp/GPIO.service https://github.com/kaiseru/GameGearZero/blob/master/GPIO.service
	echo "OK"
	sleep 4
	
	
		
clear


