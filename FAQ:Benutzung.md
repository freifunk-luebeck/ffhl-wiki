# FAQ - Router-Benutzung

## VPN Verbindung bricht von alleine ab. Neustart hilft.

Für das VPN wird das verbindungslos arbeitende UDP verwendet. Einige Heimrouter (= Gerät zwischen Freifunkknoten und Internet) haben damit Probleme, z.B. wenn sich die IP bei einer 24h-Trennung ändert. Abhilfe wurde seit der Firmwareversion (0.3.2) geschaffen. 

Sollte Dein Freifunkknoten noch auf einer älteren Version laufen, helfen wir Dir gerne und zeigen Dir wie Du in updatest.


## Grundlagenwissen für die Administrierung von Lübecker Freifunkroutern
### TP-Link Firmware Defaults
Gelbe Buchse: LAN

IP: 192.168.0.1<br />
Netmask: 255.255.255.0

user: admin<br />
pass: admin


### Buchsenbelegungen bei Freifunkroutern
Gelbe Buchse: Freifunk<br />
Blaue Buchse: LAN

Ausnahmen zu dieser Regel werden auf der Wikiseite des jeweiligen Routers festgehalten.

### ConfigMode
Der ConfigMode dient der grundlegenden Konfiguration eines Freifunkrouters.

IP: 192.168.1.1<br />
Netmask: 255.255.255.0

Im ConfigMode wird Telnet benutzt, um Zugang zur Kommandozeile des Routers zu erhalten.
Hierfür genügt folgendes Kommando auf der Kommandozeile unter Linux: *telnet 192.168.1.1*

Um Änderungen am System durchführen zu können, muss mit dem Kommando *mount_root* zunächst ein Overlay-Dateisystem über das Wurzelverzeichnis '/' gemountet werden.

Das Passwort für das Webinterface und den SSH-Zugang des Routers kann im ConfigMode (und auch später) mit dem Kommando *passwd* geändert werden, falls es vergessen wurde. Es ist hierfür kein weiteres Passwort nötig. Hiermit kann somit der Zugang zu einem Knoten wiedererlangt werden, wenn dessen Passwort nicht länger bekannt ist und physischer Zugang besteht.

Das Webinterface ist seit Firmware v0.3.1 standardmäßig deaktiviert. Es kann jedoch per Kommandozeile wieder aktiviert werden.<br />
Webinterface aktivieren: */etc/init.d/uhttpd start*<br />
Webinterface nach Neustart automatisch aktivieren: */etc/init.d/uhttpd enable*

### Normaler Betrieb
Der Router bezieht seine IP im normalen Betrieb automatisch via DHCP. Dies setzt natürlich voraus, dass ein DHCP-Server im lokalen Netz existiert. Meistens erfüllt diese Aufgabe der DSL-Router über den man ins Internet gelangt.

Statt Telnet wird im normalen Betrieb SSH benutzt, um auf die Kommandozeile des Routers zuzugreifen. Für den SSH-Login gilt das gleiche Passwort wie für das Webinterface. Um sich per SSH auf dem Router einzuloggen genügt folgendes Kommando auf der Kommandozeile unter Linux: *ssh &lt;per DHCP zugewiesene IP&gt;*


## In den ConfigMode gelangen
*Allgemein gilt:* RESET-Taste im normalen Betrieb für mindestens 10 Sekunden gedrückt halten.

### Ausnahmen
841ND mit WPS/RESET-Taster<br />
(1) Gerät einschalten <br />
(2) Sobald die System-LED langsam blinkt -> RESET-Taste drücken (System-LED blinkt nun schnell)


## Verwaltung
Router können in die [Knotenliste für Lübeck](https://freifunk.metameute.de/wiki/Knoten) bzw. in die [Knotenliste für Mölln](https://freifunk.metameute.de/wiki/Moelln%3AKnoten) eintragen werden, wenn sie in der [Knotenkarte](https://wiki.ffhl/Knoten) mit ihrem Namen angezeigt werden sollen.