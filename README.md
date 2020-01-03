
# RetroKAI's Game Gear Zero operating system


## What is this ?

This script installs a modified version of RetroPie. The added elements are the following:

- Juj's TFT SPI driver to optimize the screen refresh rate around 60 FPS.
- i2s sound driver to map the sound on the GPIO and transfert it to the Game Gear Zero sound card.
- Retrogame's Adafruit driver to map the original Game Gear buttons on the GPIO.
- anthonycacces's theme designed optimized for 320x240 resolution.
- Configures input mapping in EmulationStation / RetroArch.


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
