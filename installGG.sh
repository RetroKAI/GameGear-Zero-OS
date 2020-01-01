#!/bin/bash


if [ "$(whoami)" != "root" ]; then
        whiptail --msgbox "Not ROOT ! You must type: sudo bash $0" 15 60 8
        exit
fi


clear

echo "██████╗ ███████╗████████╗██████╗  ██████╗ ██╗  ██╗ █████╗ ██╗";
echo "██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██║ ██╔╝██╔══██╗██║";
echo "██████╔╝█████╗     ██║   ██████╔╝██║   ██║█████╔╝ ███████║██║";
echo "██╔══██╗██╔══╝     ██║   ██╔══██╗██║   ██║██╔═██╗ ██╔══██║██║";
echo "██║  ██║███████╗   ██║   ██║  ██║╚██████╔╝██║  ██╗██║  ██║██║";
echo "╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝";
echo " "
sleep 1.5
mount -o ,remount rw /boot
echo "Mount BOOT ok..."

sleep 1.5

echo -ne '██████                    \r'
sleep 0.2
echo -ne '████████████              \r'
sleep 0.2
echo -ne '███████████████████████   \r'
sleep 0.7
echo -ne '\n'




### TFT INSTALL ###

TFTINSTALL(){
ProgressBar='TFT DRIVER INSTALL...'
sleep 1
curl -f -s -o /tmp/TFT https://raw.githubusercontent.com/kaiseru/GameGearZero/master/TFT
curl -f -s -o /tmp/config.txt https://raw.githubusercontent.com/kaiseru/GameGearZero/master/config.txt
mv /tmp/config.txt /boot/config.txt
mv /tmp/TFT /boot/TFT
}
### TFT SERVICE #####
TFTSERVICE(){
ProgressBar='TFT SERVICE ENABLE...'
sleep 1
curl -f -s -o /tmp/TFT.service https://raw.githubusercontent.com/kaiseru/GameGearZero/master/TFT.service
mv /tmp/TFT.service /etc/systemd/system/TFT.service
systemctl enable TFT
systemctl restart TFT

}

### TFT STAT ####

TFTSTAT(){
ProgressBar='TFT STAT DRIVER INSTALL...'
sleep 1
curl -f -s -o /tmp/TFT https://raw.githubusercontent.com/kaiseru/GameGearZero/master/TFTSTAT/TFT
curl -f -s -o /tmp/config.txt https://raw.githubusercontent.com/kaiseru/GameGearZero/master/config.txt
mv /tmp/config.txt /boot/config.txt
mv /tmp/TFT /boot/TFT
}

TFTSTATGRAPH(){
ProgressBar='TFT STAT GRAPH DRIVER INSTALL...'
sleep 1
curl -f -s -o /tmp/TFT https://raw.githubusercontent.com/kaiseru/GameGearZero/master/TFTSTAT/TFTGRAPH/TFT
curl -f -s -o /tmp/config.txt https://raw.githubusercontent.com/kaiseru/GameGearZero/master/config.txt
mv /tmp/config.txt /boot/config.txt
mv /tmp/TFT /boot/TFT
}


####  SOUND INSTALL####
SNDINSTALL(){
ProgressBar='SOUND INSTALL...'
curl -f -s -o /tmp/asound.conf https://raw.githubusercontent.com/kaiseru/GameGearZero/master/asound.conf
curl -f -s -o /tmp/config.txt https://raw.githubusercontent.com/kaiseru/GameGearZero/master/config.txt
mv /tmp/config.txt /boot/config.txt
mv /tmp/asound.conf /etc/asound.conf
sleep 1
}

SNDCOMPLETE(){
ProgressBar='SET VOLUME...'
amixer set PCM -- 180
}


#### GAME PAD #####
GAMEPADINSTALL(){
ProgressBar='GAME PAD INSTALL...'
curl -f -s -o /tmp/retrogame https://raw.githubusercontent.com/kaiseru/GameGearZero/master/retrogame
curl -f -s -o /tmp/retrogame.cfg https://raw.githubusercontent.com/kaiseru/GameGearZero/master/retrogame.cfg
curl -f -s -o /tmp/retroarch.cfg https://raw.githubusercontent.com/kaiseru/GameGearZero/master/retroarch.cfg
curl -f -s -o /tmp/es_input.cfg https://raw.githubusercontent.com/kaiseru/GameGearZero/master/es_input.cfg
mv /tmp/retrogame /boot/retrogame
mv /tmp/retrogame.cfg /boot/retrogame.cfg
sleep 1
chmod 755 /boot/retrogame
echo "SUBSYSTEM==\"input\", ATTRS{name}==\"retrogame\", ENV{ID_INPUT_KEYBOARD}=\"1\"" > /etc/udev/rules.d/10-retrogame.rules
mv /tmp/retroarch.cfg /opt/retropie/configs/all/retroarch.cfg
mv /tmp/es_input.cfg /opt/retropie/configs/all/emulationstation/es_input.cfg
chown pi:pi /opt/retropie/configs/all/retroarch.cfg
chown pi:pi /opt/retropie/configs/all/emulationstation/es_input.cfg
}

#### GAME PAD SERVICE ######
PADSERVICE(){
ProgressBar='GAME PAD SERVICE ENABLE...'
sleep 1
curl -f -s -o /tmp/GAMEPAD.service https://raw.githubusercontent.com/kaiseru/GameGearZero/master/GAMEPAD.service
mv /tmp/GAMEPAD.service /etc/systemd/system/GAMEPAD.service
systemctl enable GAMEPAD
systemctl restart GAMEPAD
}


#### THEME TFT ######
THEMETFT(){
ProgressBar='THEME TFT INSTALL...'
curl -f -s -o /tmp/es_settings.cfg https://raw.githubusercontent.com/kaiseru/GameGearZero/master/es_settings.cfg
curl -L -s -f -o /tmp/ThemeTFT.zip https://github.com/kaiseru/GameGearZero/raw/master/ThemeTFT.zip
unzip -o /tmp/ThemeTFT.zip -d /etc/emulationstation/themes/
sleep 1
rm /tmp/ThemeTFT.zip
mv /tmp/es_settings.cfg /opt/retropie/configs/all/emulationstation/es_settings.cfg
chown pi:pi /opt/retropie/configs/all/emulationstation/es_settings.cfg
}

#### LOADING EMULATOR ####
LOADEMULATOR(){
ProgressBar='EMULATOR ICON LOADING INSTALL...'
curl -f -s -o /tmp/runcommand.cfg https://raw.githubusercontent.com/kaiseru/GameGearZero/master/runcommand.cfg
curl -L -s -f -o /tmp/command-splash.zip https://github.com/kaiseru/GameGearZero/raw/master/command-splash.zip
sleep 0.2
mv /tmp/runcommand.cfg /opt/retropie/configs/all/runcommand.cfg
unzip -o /tmp/command-splash.zip -d /opt/retropie/
sleep 0.4
chown pi:pi /opt/retropie/configs/all/runcommand.cfg
}


CheckStat() {
## check TFT
STATUSTFT=`systemctl is-active TFT`
if [ -e /boot/TFT ] && [ ${STATUSTFT} == 'active' ]
then
STAT1='**INSTALLED**'
else
STAT1='**NOT INSTALLED**'
fi


## check sound
if [ -e /etc/asound.conf ]
then
STAT2='**INSTALLED**'
else
STAT2='**NOT INSTALLED**'
fi

## check GamePAD
STATUSPAD=`systemctl is-active GAMEPAD`
if [ -e /boot/retrogame ] && [ ${STATUSPAD} == 'active' ]
then
STAT3='**INSTALLED**'
else
STAT3='**NOT INSTALLED**'
fi

## THEME TFT
if [ -d /etc/emulationstation/themes/tft ]
then
STAT4='**INSTALLED**'
else
STAT4='**NOT INSTALLED**'
fi
### LOGO CONSOLE LOADING
if [ -e /opt/retropie/configs/gamegear/launching.png ]
then
STAT5='**INSTALLED**'
else
STAT5='**NOT INSTALLED**'
fi
### SPLASH RETROKAI
if [ -e /lol/dd ]
then
STAT6='**INSTALLED**'
else
STAT6='**NOT INSTALLED**'
fi
}

function AdvMenu() {
CheckStat

MENUSLCT=$(whiptail --title "RETROKAI GAME GEAR ZERO" --menu "Choose install" 15 60 8 \
"1" "ALL in One" \
"2" "TFT DRIVER JUJ    $STAT1 " \
"3" "DRIVER SOUND      $STAT2 " \
"4" "GAME PAD          $STAT3 " \
"5" "THEME TFT         $STAT4 " \
"6" "LOGO CONSOLE      $STAT5 " \
"7" "SPLASH RETROKAI   $STAT6 " \
"8" "REBOOT"  3>&1 1>&2 2>&3)

case $MENUSLCT in


###### ALLL IN ONE MENU #########


1)

for bar in $(seq 1 100); do
    sleep 0.1

if [ $bar -eq 3 ]; then
echo -e "XXX\n$bar\n Progress. \nXXX"
elif [ $bar -eq 6 ]; then
echo -e "XXX\n$bar\n Progress..  \nXXX"
elif [ $bar -eq 9 ]; then
echo -e "XXX\n$bar\n Progress...  \nXXX"
elif [ $bar -eq 10 ]; then
TFTINSTALL
echo -e "XXX\n$bar\n $ProgressBar \nXXX"
elif [ $bar -eq 20 ]; then
SNDINSTALL
echo -e "XXX\n$bar\n $ProgressBar \nXXX"
elif [ $bar -eq 30 ]; then
GAMEPADINSTALL
echo -e "XXX\n$bar\n $ProgressBar \nXXX"
elif [ $bar -eq 40 ]; then
THEMETFT
echo -e "XXX\n$bar\n $ProgressBar \nXXX"
elif [ $bar -eq 60 ]; then
LOADEMULATOR
echo -e "XXX\n$bar\n $ProgressBar \nXXX"

elif [ $bar -eq 90 ]; then
PADSERVICE
echo -e "XXX\n$bar\n $ProgressBar \nXXX"
elif [ $bar -eq 95 ]; then
TFTSERVICE
sleep 1
echo -e "XXX\n$bar\n $ProgressBar \nXXX"
elif [ $bar -eq 100 ]; then
echo -e "XXX\n$bar\n installation complete !!! \nXXX"
sleep 1
    else
    echo $bar
    fi
done | whiptail --title 'INSTALL ALL IN ONE' --gauge "Progress" 6 60 0

if (whiptail --title "GAME GEAR ZERO REBOOT" --yesno " Restarted to complete the installation ?" 8 78); then
   reboot
else
AdvMenu
fi

       ;;


####### TFT INSTALL MENU ##########

2)




for bar in $(seq 1 100); do
    sleep 0.1

if [ $bar -eq 10 ]; then
echo -e "XXX\n$bar\n Progress. \nXXX"
elif [ $bar -eq 20 ]; then
echo -e "XXX\n$bar\n Progress..  \nXXX"
elif [ $bar -eq 30 ]; then
echo -e "XXX\n$bar\n Progress...  \nXXX"
elif [ $bar -eq 60 ]; then
TFTSTAT
echo -e "XXX\n$bar\n $ProgressBar \nXXX"
elif [ $bar -eq 70 ]; then
TFTSERVICE
echo -e "XXX\n$bar\n $ProgressBar \nXXX"
elif [ $bar -eq 100 ]; then
echo -e "XXX\n$bar\n installation complete !!! \nXXX"
sleep 1
else
    echo $bar
fi
done | whiptail --title 'INSTALL DRIVER TFT' --gauge "Progress" 6 60 0
AdvMenu

      ;;

####### SOUND INSTALL MENU #######

3)

for bar in $(seq 1 100); do
    sleep 0.1

if [ $bar -eq 10 ]; then
echo -e "XXX\n$bar\n Progress. \nXXX"
elif [ $bar -eq 20 ]; then
echo -e "XXX\n$bar\n Progress..  \nXXX"
elif [ $bar -eq 30 ]; then
echo -e "XXX\n$bar\n Progress...  \nXXX"
elif [ $bar -eq 60 ]; then
SNDINSTALL
echo -e "XXX\n$bar\n $ProgressBar \nXXX"
elif [ $bar -eq 70 ]; then
SNDCOMPLETE
echo -e "XXX\n$bar\n $ProgressBar \nXXX"
elif [ $bar -eq 100 ]; then
echo -e "XXX\n$bar\n installation complete !!! \nXXX"
sleep 1
else
    echo $bar
fi
done | whiptail --title 'INSTALL DRIVER SOUND' --gauge "Progress" 6 60 0
AdvMenu

     ;;

###### GAME INSTALL MENU ########
4)

for bar in $(seq 1 100); do
    sleep 0.1

if [ $bar -eq 10 ]; then
echo -e "XXX\n$bar\n Progress. \nXXX"
elif [ $bar -eq 20 ]; then
echo -e "XXX\n$bar\n Progress..  \nXXX"
elif [ $bar -eq 30 ]; then
echo -e "XXX\n$bar\n Progress...  \nXXX"
elif [ $bar -eq 60 ]; then
GAMEPADINSTALL
echo -e "XXX\n$bar\n $ProgressBar \nXXX"
elif [ $bar -eq 70 ]; then
PADSERVICE
echo -e "XXX\n$bar\n $ProgressBar \nXXX"
elif [ $bar -eq 100 ]; then
echo -e "XXX\n$bar\n installation complete !!! \nXXX"
sleep 1
else
    echo $bar
fi
done | whiptail --title 'INSTALL GAME PAD' --gauge "Progress" 6 60 0
AdvMenu

      ;;

###### THEMETFT INSTALL MENU ########
5)

for bar in $(seq 1 100); do
    sleep 0.1

if [ $bar -eq 10 ]; then
echo -e "XXX\n$bar\n Progress. \nXXX"
elif [ $bar -eq 15 ]; then
echo -e "XXX\n$bar\n Progress..  \nXXX"
elif [ $bar -eq 25 ]; then
echo -e "XXX\n$bar\n Progress...  \nXXX"
elif [ $bar -eq 30 ]; then
echo -e "XXX\n$bar\n Copy Files..  \nXXX"
elif [ $bar -eq 60 ]; then
THEMETFT
echo -e "XXX\n$bar\n $ProgressBar \nXXX"
elif [ $bar -eq 100 ]; then
echo -e "XXX\n$bar\n installation complete !!! \nXXX"
sleep 1
else
    echo $bar
fi
done | whiptail --title 'INSTALL THEMETFT' --gauge "Progress" 6 60 0
AdvMenu

      ;;


###### INCON LOADING INSTALL MENU ########
6)

for bar in $(seq 1 100); do
    sleep 0.1

if [ $bar -eq 10 ]; then
echo -e "XXX\n$bar\n Progress. \nXXX"
elif [ $bar -eq 15 ]; then
echo -e "XXX\n$bar\n Progress..  \nXXX"
elif [ $bar -eq 25 ]; then
echo -e "XXX\n$bar\n Progress...  \nXXX"
elif [ $bar -eq 30 ]; then
echo -e "XXX\n$bar\n Copy Files..  \nXXX"
elif [ $bar -eq 60 ]; then
LOADEMULATOR
echo -e "XXX\n$bar\n $ProgressBar \nXXX"
elif [ $bar -eq 100 ]; then
echo -e "XXX\n$bar\n installation complete !!! \nXXX"
sleep 1
else
    echo $bar
fi
done | whiptail --title 'INSTALL RUNCOMMAND' --gauge "Progress" 6 60 0
AdvMenu

      ;;

###### SPLASH LOGO LOADING ########




####### REBOOT ###########
8)
if (whiptail --title "REBOOT" --yesno "GAME GEAR ZERO REBOOT" 8 78); then
   reboot
else
AdvMenu
fi

       ;;
esac
}
AdvMenu

