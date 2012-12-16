# FAQ - Knoten-Benutzung

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
Bei Anschluss an das vorhandene Heimnetz bezieht der Knoten seine IP im normalen Betrieb automatisch via DHCP. Dies setzt natürlich voraus, dass ein DHCP-Server im lokalen Netz existiert. Meistens erfüllt diese Aufgabe der DSL-Router über den man ins Internet gelangt.

Statt Telnet wird im normalen Betrieb SSH benutzt, um auf die Kommandozeile des Routers zuzugreifen. Für den SSH-Login gilt das gleiche Passwort wie für das Webinterface. Um sich per SSH auf dem Router einzuloggen genügt folgendes Kommando auf der Kommandozeile unter Linux: *ssh &lt;per DHCP zugewiesene IP&gt;*


## In den ConfigMode gelangen

### Der Unterschied zwischen Configmode und Failsafemode
Der _Configmode_ ist der Zustand, den ein neuer Knoten nach dem ersten Flashen hat.
In diesem ist er auf den LAN-Ports per modifiziertem Web-Interface einstellbar.

Im _Failsafemode_ ist er nur per Telnet erreichbar.
Das Web-Interface ist in diesem Falle deaktiviert.

### Allgemein
* QSS-Taste im normalen Betrieb für mindestens 3 Sekunden gedrückt halten.
* Bei erfolgtem Neustart den QSS-Button ''sofort'' los lassen, denn sonst bootet der Knoten in den Failsave-Modus.
* Nun an einen der LAN-Ports hängen und die 192.168.1.1 im Browser aufrufen.

### Ausnahmen
* Da der [[841ND|Firmware:841nd]] nur einen gemeinsamen WPS/RESET-Taster hat, ist dieser zu benutzen.

## Verwaltung
Router können in die [[Knotenliste für Lübeck|Knoten]] bzw. in die [[Knotenliste für Mölln|Moelln:Knoten]] eintragen werden, wenn sie im Knotengraph mit ihrem Namen angezeigt werden sollen.
