# Benötigte Pakete

Für ein privates Netz werden noch drei zusätzliche Pakete benötigt: radvd, bird6 und bird4

   # opkg update
   Downloading http://downloads.openwrt.org/attitude_adjustment/12.09-rc1/ar71xx/generic/packages/Packages.gz.
   Inflating http://downloads.openwrt.org/attitude_adjustment/12.09-rc1/ar71xx/generic/packages/Packages.gz.
   Updated list of available packages in /var/opkg-lists/attitude_adjustment.
   # opkg install radvd bird6 bird4


# IP Subnetz festlegen

Zunächst sollte ein Subnetz auf [[Netzwerk:IP Subnetze]] unter "Andere reservierte Subnetze" reserviert werden. Ein /27 reicht dazu in den meisten Fällen. Aus dem Subnetz wird auch das IPv6 Subnetz berechnet:

    Subnetz:     10.130.117.0/27
                          ▲ nach Hex umwandeln
                          ▼ und hier einfügen
    IPv6: fdef:ffc0:3dd7:75::/64

    IPv4 des Knotens: 10.130.117.1
    IPv6 des Knotens: fdef:ffc0:3dd7:75::1

# config/network und config/wireless

# radvd

# bird6

# bird4

# dhcpd/dnsmasq