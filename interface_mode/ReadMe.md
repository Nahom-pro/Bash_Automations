# Changing the interface mode
 -> This is the most important methods to sniff or capture nearby external packets.
 -> To revert to managed mode
 
   * The same step to those which able us to change to monitor mode only changes:
      * For iwconfig
         -> sudo iwconfig wlan0 mode managed
      * For iw
         -> sudo iw dev wlan0 set type managed (
      * For airmon-ng
         -> sudo airmon-ng stop wlan0 (for airmon-ng)
         -> sudo systemctl restart NetworkManager ()