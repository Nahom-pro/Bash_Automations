# Changing the interface mode
 -> This is the most important methods to enable us run airodump-ng and other tools which sniff or capture nearby external packets.

 -> To revert to managed mode:

   * The same step only changes:
      * For iwconfig
         -> sudo iwconfig wlan0 mode managed
      * For iw
         -> sudo iw dev wlan0 set type managed
      * For airmon-ng
         -> sudo airmon-ng stop wlan0mon 
         -> sudo systemctl restart NetworkManager (After reverting to managed mode, you may need to restart network services to reconnect to Wi-Fi networks).
    
    * To check the changes use
       -> iwconfig wlan0

# Remember,
  * wlan0 is the common wireless interface name. If your interface name is different from this, change wlan0 to your wireless interface name. Specially parrot user!!! 
