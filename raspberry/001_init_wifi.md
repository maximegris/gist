# Init Wifi on Raspberry 3

Update your system
-----------
```bash
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade
```

Check modules needed
-----------
```bash
apt-get install apt-utils firmware-brcm80211 pi-bluetooth wpasupplicant
```

Check the interface is reconized
-----------
```bash
bash ifconfig -a
```

Generate a PSK version of your Wifi password
-----------
```bash
wpa_passphrase My_SSID
```
Copy the PSK value
```bash
network={
    ssid="My_SSID"
    #psk="my_password"
    psk=0123.....def
}
```

Edit /etc/network/interfaces
-----------
```bash
auto wlan0
allow-hotplug wlan0
iface wlan0 inet dhcp
wpa-ssid "My_SSID"
wpa-psk 0123.....def
```

Shutdown your Raspberry Pi
-----------

Remove Ethernet cable and Restart your Raspberry Pi
-----------