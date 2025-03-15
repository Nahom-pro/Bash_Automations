# Bring the interface down
sudo ifconfig wlan0 down

# Set the interface to monitor mode
sudo sudo iwconfig wlan0 mode monitor
#change wlan0 to your interface name

# Bring the interface up
sudo ifconfig wlan0 up