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
	echo
	echo "Adafruit-retrogame.."
	sleep 2
	curl -f -s -o /tmp/retrogame https://raw.githubusercontent.com/kaiseru/GameGearZero/master/retrogame
	sleep 2
	echo "TFT Driver JUJ..."
	sleep 2
    curl -f -s -o /tmp/TFT https://raw.githubusercontent.com/kaiseru/GameGearZero/master/TFT
	sleep 2
	echo "theme-gbz35 Rxbrad .."
	## curl -f -s -o /tmp/GBZ35 https://github.com/rxbrad/es-theme-gbz35.git
    sleep 2
	echo "Downloading Configuration files.."
	curl -f -s -o /tmp/config.txt https://raw.githubusercontent.com/kaiseru/GameGearZero/master/config.txt
	curl -f -s -o /tmp/asound.conf https://raw.githubusercontent.com/kaiseru/GameGearZero/master/asound.conf
	curl -f -s -o /tmp/retrogame.cfg https://raw.githubusercontent.com/kaiseru/GameGearZero/master/retrogame.cfg
	curl -f -s -o /tmp/GAMEPAD.service https://raw.githubusercontent.com/kaiseru/GameGearZero/master/GAMEPAD.service
	curl -f -s -o /tmp/TFT.service https://raw.githubusercontent.com/kaiseru/GameGearZero/master/TFT.service
	echo "OK"
	sleep 4
	
	echo "Copy Files Config boot"
	
	if [ $? -eq 0 ]; then
		mv /tmp/config.txt /boot/config.txt
		mv /tmp/retrogame.cfg /boot/retrogame.cfg
	
	echo "OK"
	else
		echo "ERROR"
	fi
	
	sleep 4
	clear
	
	
	echo "Setup Services TFT/GamePAD"
	if [ $? -eq 0 ]; then
		mv /tmp/retrogame /boot/retrogame
		mv /tmp/GAMEPAD.service /etc/systemd/system/GAMEPAD.service
		chmod 755 /boot/retrogame
		echo "SUBSYSTEM==\"input\", ATTRS{name}==\"retrogame\", ENV{ID_INPUT_KEYBOARD}=\"1\"" > /etc/udev/rules.d/10-retrogame.rules
		systemctl enable GAMEPAD
		systemctl restart GAMEPAD
		systemctl status GAMEPAD
		
		
		echo "OK"
	else
		echo "ERROR"
	fi
	
	if [ $? -eq 0 ]; then
		mv /tmp/TFT /boot/TFT
		mv /tmp/TFT.service /etc/systemd/system/TFT.service
		systemctl enable TFT
		systemctl restart TFT
		systemctl status TFT
		echo "OK"
	else
		echo "ERROR"
	fi
	
	echo "configuration Sound i2c.."
	echo "copy files.."
	mv /tmp/asound.conf /etc/asound.conf
	
	
		echo -n "REBOOT NOW? [y/N]"
	read
	if [[ "$REPLY" =~ ^(yes|y|Y)$ ]]; then
		echo "Reboot started..."
		reboot
	#else
		echo
		echo "Done"
	fi
	
	
		



