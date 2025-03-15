# Bring the interface down
sudo ip link set wlan0 down

# Set the interface to monitor mode
sudo iw dev wlan0 set type monitor

# Bring the interface up
sudo ip link set wlan0 up