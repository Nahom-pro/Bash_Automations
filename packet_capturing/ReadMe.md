# Packet capturing using airodump-ng
    * Setup:
        => Defines a wireless interface (wlx68762728c9b1 in this case, which should match your system's wireless interface).
        Uses airodump-ng to scan for APs on both 2.4 GHz and 5 GHz bands (--band abg) and saves the output in CSV format (output-01.csv).
    * Scanning:
        => Runs the scan in the background for 5 seconds, then terminates it with pkill.
        The output is written to a file named output-01.csv.
    * Parsing the CSV:
        => Reads the CSV file, filtering out station data (client devices) and focusing only on AP information.
        Extracts key fields like BSSID, ESSID (network name), and channel, while skipping headers and empty lines.
        Stores the parsed data in an array (AP_LIST) with a custom delimiter (|).
    * User Interaction:
        => Displays a numbered list of detected APs with their ESSID, BSSID, and channel.
        Prompts the user to select an AP by number, with input validation.
    * Output:
        => Assigns the selected AP's details to variables (TARGET_BSSID and TARGET_CHANNEL) for potential use in subsequent scripts or commands.
# Changes Made:
    * Handling Hidden Networks:
        => Added a check after trimming whitespace from ESSID: [ -z "$ESSID" ] && ESSID="Hidden".
        This ensures that if the ESSID is empty (common for hidden networks), it’s replaced with "Hidden" instead of being left blank.
    * Deleting the CSV File:
        => Added rm output-01.csv right after the while loop finishes parsing the file. This ensures the temporary file is removed once its data is extracted.
