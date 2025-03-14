# Get the name of the wireless interface
interface=$(iwconfig 2>&1 |grep 'IEEE 802.11' |awk '{print$1}')

# Check if the interface was found
if [ -z "$interface" ]; then
    echo "Error: No wireless interface found."
    exit 1
fi

echo "Wireless interface: $interface"
}
