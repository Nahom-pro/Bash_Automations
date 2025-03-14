# Get the name of the wireless interface
interface=$(ip link show | awk -F': ' '/^[0-9]+: wl/{print $2}')

# Check if the interfaces was found
if [ -z "$interface" ]; then
    echo "Error: No wireless interface found."
    exit 1
fi

echo "Wireless interface: $interface"