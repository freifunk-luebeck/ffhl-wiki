# Roadmap

### RM01 Kein Passwort im Configmode setzen

*Status: Finished*  
*Target: 0.4*

Das Passwort wird nur für den SSH-Zugriff benötigt. Den jedoch nutzen jedoch wenige. Darum sollte der Configmode auch keines mehr setzen. Stattdessen sollte der Rootzugang gesperrt (passwd -l root) werden, so dass im Normalbetrieb kein Login möglich ist. Es sollte jedoch optional einfach möglich sein ein Passwort zu setzen. Telnet im Configmode?

Umsetzung:
- Passwort sperren (im Image direkt)
- kein Passwort im normalen Configmode (aber im Expertenmodus)

### RM02 Autoupdater

*Status: In Progress*  
*Target: 0.4*

Der Autoupdater sollte implementiert werden und unabhängig vom Mesh funktionieren, so dass sichergestellt ist, dass alle Knoten jederzeit die aktuelle Firmware verwenden.

Features:
- Branches
- einfacher HTTP Download

### RM03 batman-adv auf dem WAN Port

*Status: In Progress*  
*Target: 0.4*

Es wäre wünschenswert auf dem WAN Port batman-adv zu sprechen. Die beste Idee ist bisher: DHCP auf dem WAN Port versuchen. Wenn es fehlschlägt, `batctl if add $WAN`. Danach jedoch weiterhin DHCP versuchen und das Interface wieder herausnehmen sobald es gelingt.

[[Firmware:wan-batman-switch]]

Umsetzung:
- Umschaltbar im Configmode (Expertenmodus)

### RM04 batman-adv auf dem LAN Ports

*Status: In Progress*  
*Target: 0.4*

In einigen Fällen wäre es praktisch auf den LAN Ports alternativ batman-adv zu sprechen. Z.B. dann, wenn ein WDR3600 den VPN Uplink bereitstellt und Bullets an die LAN Ports angeschlossen werden.

Umsetzung:
- Umschaltbar im Configmode (Expertenmodus)

### RM05 Nearest-Node Webinterface

*Status: Finished*  
*Target: 0.4*

Es sollte möglich sein jederzeit den nächstgelegenden Knoten zu erreichen und dort eine Statusseite zu sehen. Von dort sollten auch andere Knoten in der Nachbarschaft erreicht werden können.

Umsetzung:
- MAC VLAN
- ebtables Filter

### RM06 fastd Key automatisch hinterlegen

*Status: Idee*

fastd Keys könnten durch Knoten automatisch eingetragen werden, wenn man den neuen Knoten mit einem bereits eingebundenen Knoten per Kabel verbindet und an diesem den Button drückt. So ist sichergestellt, dass man Kontakt zur Community aufnimmt.

### RM07 Configmode abschaffen

*Status: Idee*

Sobald RM01, RM02 und RM06 umgesetzt sind, sollte der Configmode entfernt werden, so dass neue Knoten direkt als Meshknoten verwendet werden können. Weitere Konfigurationen könnten über das Interface in RM05 vorgenommen werden.

### RM08 Alfred

*Status: Finished*  
*Target: 0.4*

Alfred kann die Meshvisualisierung übernehmen und zusätzlich Informationen über die Knoten (z.B. Hostname, Firmwareversion, GPS Koordinaten) sammeln.

### RM09 GPS Koordinaten im Configmode

*Status: Finished*  
*Target: 0.4*

Wenn der Benutzer die GPS Koordinaten im Knoten direkt einträgt, könnten wir auf die Knotenliste im Wiki vollständig verzichten. 

Dazu könnten wir eine kleine Karte der näheren Umgebung vorhalten oder über das Mesh laden. Dann könnte der Benutzer seinen Knoten entsprechend auf der Karte positionieren.

Benötigt RM08.

### RM10 Expertenmodus im Configmode

*Status: Finished*  
*Target: 0.4*

Configmode in normal und Expertenmodus unterteilen.