# Get the name of the wireless interface
interface=$(nmcli device status | awk '$2 == "wifi" {print $1}')

# Check if the interface was found
if [ -z "$interface" ]; then
    echo "Error: No wireless interface found."
    exit 1
fi

echo "Wireless interface: $interface"