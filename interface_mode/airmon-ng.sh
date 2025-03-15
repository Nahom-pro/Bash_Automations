# This will stop processes like NetworkManager, wpa_supplicant, and others that might interfere with monitor mode.
sudo airmon-ng check kill

# To enable monitor mode on an interface (e.g., wlan0)
sudo airmon-ng start wlan0

#This will create a new virtual interface, typically named wlan0mon