# Richtlinien

Solange du dich an folgende Richtlinien hälst, sollte deine gebaute Firmware kompatibel zu allen anderen Lübeck Freifunk Routern sein.

## Notwendig
### WLAN

 * Modus: Adhoc
 * ESSID: `mesh.freifunk.net`
 * CellID: 02:22:B0:44:94:5D
 * Modulation: (mindestens) 802.11g
 * Kanal: (mindestens) 1 (= 2.412GHz)

### Routing

 * Protokoll: B.A.T.M.A.N.-Advanced, compat-Version 12 (z.B. batman-adv 2011.2.0, 2011.1.0 oder 2011.0.0)
 * Protokoll Konfiguration: i.d.R. gw_mode 'client' (außer man bietet einen Internetzugang mit DHCP an, dann 'server')

### IP-Subnetz

 * [[Netzwerk:IP-Subnetze]]

### Grundsätzliche Vereinbarungen

 * [[http://wiki.freifunk.net/Pico_Peering_Agreement|Pico Peering Agreement v1.0]]

## Empfohlen
### WLAN

Zusätzlich:

 * Modus: Master/AP
 * ESSID: `luebeck.freifunk.net`
 * gebridget mit bat0

Sowie:
 * Modus: Master/AP
 * ESSID: `luebeck.freifunk.net - Info`
 * Leitet jeden Webseitenzugriff auf einen Info-Seite um.