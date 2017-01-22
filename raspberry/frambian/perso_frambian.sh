!/bin/bash

# Paquets relatifs a l'interface graphique
pkgs="
xserver*
xserver-xorg-video-fbdev
xserver-xorg xinit
x11-utils x11-common x11-xkb-utils x11-xserver-utils
gstreamer1.0-x gstreamer1.0-omx gstreamer1.0-plugins-base
gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-alsa
gstreamer1.0-libav
epiphany-browser
lxde lxtask menu-xdg gksu
xserver-xorg-video-fbturbo
xpdf gtk2-engines alsa-utils
netsurf-gtk zenity
desktop-base lxpolkit
weston
omxplayer
raspberrypi-artwork
lightdm gnome-themes-standard-data gnome-icon-theme
qt50-snapshot qt50-quick-particle-examples
obconf openbox
xf*
lxde*
"

# Paquets educatifs - programmation
pkgs="$pkgs
idle python3-pygame python-pygame python-tk
idle3 python3-tk
python3-rpi.gpio
python-serial python3-serial
python-picamera python3-picamera
debian-reference-en dillo x2x
scratch nuscratch
raspberrypi-ui-mods
timidity
smartsim penguinspuzzle
pistore
sonic-pi
python3-numpy
python3-pifacecommon python3-pifacedigitalio python3-pifacedigital-scratch-hand$
oracle-java8-jdk
minecraft-pi python-minecraftpi
wolfram-engine
"

# Suppression des paquets
for i in $pkgs; do
        sudo apt-get -y remove --purge $i
        sudo apt-get -y autoremove
done

# Suppresions des paquets de dev
sudo apt-get remove `sudo dpkg --get-selections | grep "\-dev" | sed s/install//`

# Suppression des dependances installees de facon automatique
echo "Application de autoremove"
sudo apt-get -y autoremove

# Supprimer le cache de apt-get
echo "Nettoyage avec clean"
sudo apt-get clean

# Supprimer fichiers inutiles
echo "Fichiers inutiles"
sudo rm /opt/vc/src/hello_pi/hello_video/test.h264
sudo rm /usr/lib/gcc/arm-linux-gnueabihf/4.6/cc1plus

# Fin de la procédure
echo "Fin de la procédure"
df -h