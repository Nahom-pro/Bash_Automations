#!/bin/bash

# Define the wireless interface (change if needed)
INTERFACE="wlx68762728c9b1"

# Start capturing AP info
echo "Scanning for access points..."
airodump-ng --band abg --output-format csv --write output $INTERFACE &> /dev/null &

# Wait for a few seconds to capture data
sleep 5

# Stop airodump-ng
pkill airodump-ng

# Extract AP details (filtering out stations)
AP_LIST=()
# Match the exact column pattern
while IFS=, read -r BSSID FIRST LAST CHANNEL SPEED PRIVACY CIPHER AUTH POWER BEACONS IV LAN_IP ID_LENGTH ESSID REST; do
    # Skip header, empty lines, or lines without CHANNEL
    [[ "$BSSID" == "BSSID" || -z "$CHANNEL" || "$ESSID" =~ ^\s*$ ]] && continue
    
    # Trim leading/trailing whitespace from ESSID and set to "Hidden" if empty
    ESSID=$(echo "$ESSID" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    [ -z "$ESSID" ] && ESSID="Hidden"
    
    # Debugging: Show what’s being parsed
    echo "Parsed: ESSID='$ESSID', BSSID='$BSSID', CHANNEL='$CHANNEL'"
    
    # Store in array with a custom delimiter (|)
    AP_LIST+=("$ESSID|$BSSID|$CHANNEL")
done < <(awk '/BSSID,/{flag=1; next} /Station MAC,/{flag=0} flag' output-01.csv | tr -d '\r')

# Delete the CSV file after parsing
rm output-01.csv

# Check if any APs were found
if [ ${#AP_LIST[@]} -eq 0 ]; then
    echo "No access points found. Try running again."
    exit 1
fi

# Display APs with numbering
echo -e "\nAvailable Access Points:"
for i in "${!AP_LIST[@]}"; do
    IFS='|' read -r ESSID BSSID CHANNEL <<< "${AP_LIST[$i]}"
    printf "%d. %s | %s | %s\n" "$((i+1))" "$ESSID" "$BSSID" "$CHANNEL"
done

# Read user selection
while true; do
    read -p "Select an AP by number: " SELECTION
    if [[ "$SELECTION" =~ ^[0-9]+$ ]] && (( SELECTION > 0 && SELECTION <= ${#AP_LIST[@]} )); then
        SELECTION=$((SELECTION-1))
        break
    else
        echo "Invalid selection. Please enter a valid number."
    fi
done

# Assign selected AP info to variables
IFS='|' read -r SELECTED_ESSID SELECTED_BSSID SELECTED_CHANNEL <<< "${AP_LIST[$SELECTION]}"

# Show selected AP info
echo -e "\nYou selected:"
echo "ESSID: $SELECTED_ESSID"
echo "BSSID: $SELECTED_BSSID"
echo "Channel: $SELECTED_CHANNEL"

# Store BSSID and Channel in variables
TARGET_BSSID="$SELECTED_BSSID"
TARGET_CHANNEL="$SELECTED_CHANNEL"

echo -e "\nAssigned Variables:"
echo "TARGET_BSSID=$TARGET_BSSID"
echo "TARGET_CHANNEL=$TARGET_CHANNEL" 