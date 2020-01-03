
# RetroKAI's Game Gear Zero operating system


## What is this ?

The script installs the following:

- Juj's TFT SPI driver 60FPS
- i2s sound driver
- Retrogame's Adafruit driver
- anthonycacces's theme designed optimized for 320x240 resolution
- Setup input EmulationStation / RetroArch


## How to install ?

Connect to you Game Gear Zero via SSH or plug a keyboard and a screen to your Raspberry Pi Zero.

```
Default username: pie
Default password: raspberry
```

Download & execute the script :

```shell
curl -f -o /home/pi/installGG.sh https://raw.githubusercontent.com/RetroKAI/GameGearZero/master/installGG.sh && sudo bash installGG.sh
```

## Acknowledgments
- JUJ
- Adafruit
- RetroPie
- Anthonycaccese
