# Interface Selection

-> Look guys, this fundamental bashs perform selecting the name of wireless interface(might be wlan0 in kali) in different ways selecting the one in your choice.

# 1. ip
 -> The ip command is a modern and reliable tool for network configuration. You can use it to list network interfaces and filter for wireless interfaces.
 # Explanation of the code:
  * ip link show: Lists all network interfaces.

  * awk -F': ' '/^[0-9]+: wl/{print $2}':

  * -F': ': Sets the field separator to : .

  * /^[0-9]+: wl/: Matches lines that start with a number (interface index) followed by : wl (wireless interfaces typically start with wl).

  * {print $2}: Prints the second field, which is the interface name.

# 2. iwconfig
 -> The iwconfig command is specifically designed for wireless interfaces.
 # Explanation of the code:
  * iwconfig: Lists wireless interfaces.

  * 2>/dev/null: Suppresses error messages (e.g., if no wireless interfaces are found).

  * awk '/^[^ ]+/ {print $1}':
   * /^[^ ]+/: Matches lines that start with a non-space character (interface names).
   * {print $1}: Prints the first field, which is the interface name.
# 3. nmcli
 -> The nmcli command is part of NetworkManager and provides detailed information about network devices.
 # Explanation of the code:
  * nmcli device status: Lists all network devices and their status.

  * awk '$2 == "wifi" {print $1}':
   * $2 == "wifi": Matches lines where the second field is wifi (indicating a wireless interface).
   * {print $1}: Prints the first field, which is the interface name.