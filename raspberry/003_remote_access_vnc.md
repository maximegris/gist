# Remote Access with a VNC Server

Update your system
-----------
```bash
sudo apt-get update && sudo apt-get upgrade
```

Install tightvncserver
-----------
```bash
sudo apt-get install tightvncserver
```

Start tightvncserver
-----------
```bash
tightvncserver
```
The first password is used for remote access. Its limit size is 8 characters. 
The second password is used if you want to authorize read-only access.

Restart tightvncserver
-----------
```bash
tightvncserver :1 -geometry 1280×800 -depth 24
```
The password is not asked anymore.

Options:
vncserver :1 => Launch service on port 1
-geometry 1280x800 => Output resolution on remote access
-depth 24 => Color ratio (16/24/32 bits)

Ports:
590X TCP/UDP (X = port defined, here 1)

Stop tightvncserver 
-----------
```bash
tightvncserver -kill :1
```

Start tightvncserver automaticly on startup.
-----------
```bash
cd /home/pi/.config/autostart
sudo nano tightvnc.desktop
```
Add lines 
```bash
[Desktop Entry]
Type=Application
Name=tightVNC
Exec=vncserver :1 -geometry 1280×800 -depth 24
StartupNotify=false
```

Enable copy/paste
-----------
First install autocutsel 
```bash
sudo apt-get install autocutsel
```
Then open your /home/pi/.vnc/xstartup (nano /home/pi/.vnc/xstartup) and put autocutsel -fork on it like this:
```bash
#!/bin/sh

xrdb $HOME/.Xresources
xsetroot -solid grey
autocutsel -fork
#x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
#x-window-manager &
# Fix to make GNOME work
export XKL_XMODMAP_DISABLE=1
/etc/X11/Xsession
```