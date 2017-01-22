# Useful raspberry commands

Remove apps
-----------
`sudo apt-get purge minecraft-pi`

Users
-----------

Add new user with home dir: `sudo useradd -m sven -G sudo` (see `/etc/passwd`)

Set password for user: `sudo passwd sven` (see `/etc/shadow`)

System
----------

Get system info (e.g. IP): `ifconfig`

Get network info: `iwconfig`

Get hostname: `hostname`

Get hostname IP: `hostname -I`

Check for all connected USB devices: `lsusb`

Switch to config: `sudo raspi-config`

Switch to GUI: `startx`

Reboot system: `reboot` / `sudo reboot`

Shutdown: `sudo shutdown -h now`

Start SSH while booting: `sudo update-rc.d ssh defaults`

Audio
-----------

Play: `omxplayer audio.mp3`

Volume: `+` & `-`