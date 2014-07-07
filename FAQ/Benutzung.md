# FAQ - Knoten-Benutzung

## Inhaltsübersicht
[[_TOC_]]

## VPN Verbindung bricht von alleine ab. Neustart hilft.

Für das VPN wird das verbindungslos arbeitende UDP verwendet.
Einige Heimrouter (das Gerät zwischen Freifunkknoten und Internet) haben damit Probleme, z.B. wenn sich die IP bei einer 24h-Trennung ändert.
Abhilfe wurde seit der Firmwareversion (0.3.2) geschaffen.

Sollte Dein Freifunkknoten noch auf einer älteren Version laufen, helfen wir Dir gerne und zeigen Dir wie Du in aktualisierst.

## Grundlagenwissen für die Administrierung von Lübecker Freifunkknoten
### TP-Link Firmware Defaults
Gelbe Buchse: LAN
```
IP: 192.168.0.1
Netmask: 255.255.255.0
```
```
user: admin
pass: admin
```

### Buchsenbelegungen bei Freifunkknoten
```
Gelbe LAN-Buchsen: Client-Netz
Blaue WAN-Buchse: Heimnetzanschluss für den Uplink ins interne VPN
```

Im normalen Betrieb ist der Knoten mit seinem WAN-Port am Heimnetz angeschlossen und wird darüber eine Verbindung zum Rest des Netzes aufbauen.

### Configmode
Der Configmode dient der grundlegenden Einstellung eines Knotens und ist der empfohlene Weg zum Ändern der Bandbreitenbegrenzung, des Passworts und des Firmware Upgrades.

Dafür muss der Knoten zuerst komplett gebootet sein und laufen.
Im laufenden Betrieb wird nun die QSS-Taste (oder Reset-Taste, je nach Modell) ca. 5 Sekunden gedrückt gehalten, bis der Knoten merklich neustartet.
Dann muss der Button ''sofort'' losgelassen werden, damit er in den Configmode geht.

Danach hängt man seinen Rechner an einen der gelben LAN-Ports und lässt sich eine IP geben.
Im Browser wird nun die [[http://192.168.1.1]] aufgerufen und die notwendigen Einstellungen werden vorgenommen.
Im letzten Schritt des Configmodes ist der Knoten per Klick neuzustarten, da man sich erst jetzt sicher sein kann, dass er die Einstellungen übernimmt und danach in den Normalzustand als Freifunkknoten neustartet.

Um einen Knoten mit alter Firmware (vor 0.4) zu aktualisieren wählt man auf der Ersten Seite im Configmode den zweiten Link um die neue Firmware einzuspielen. (Beim TL-WR842ND kann man nicht in den Configmode gelangen, man kann aber auch Über den _Failsafemode_ im Webinterface die Firmware aktulaisieren unter "Backup/Flash Firmware")

Bei einem Knoten mit einer Firmware ab 0.4 wird ein manuelles Update über den „Expertmode“ eingespielt. Alternativ kann der Auto-Updater mit regelmäßiger Aktualisierung beauftragt werden, wobei hierbei der Branch darüber entscheidet, ob man nur stabile Releases (stable), Vorabversionen (beta) oder auch ganz experimentelle Firmwares (experimental) bekommen möchte.
Experimentelle Firmwares eignen sich nur für Betreiber, die auch auf der Entwicklerliste mitlesen und ohne große Probleme an den Knoten kommen, da diese öfter einen Nutzerhandgriff benötigen.

### Failsafemode
Der Failsafemode dient nur zur Rettung eines zerschossenen Freifunkrouters.

In den Failsafemode kommt man per Hardwarezugriff, wenn man beim Neustart des Knotens den Reset-Knopf im richtigen Moment drückt. Dabei sollte die Sys-Lampe gerade eingeschaltet wurden sein. Ob man im richtigen Modus ist, erkennt man am schnellen Blinken der Sys-Lampe. (siehe http://wiki.openwrt.org/de/doc/howto/generic.failsafe )
Danach muss der eigene Computer mit einem Netzwerkkabel am blauen WAN-Port (beim WR842ND v1 in einen gelben LAN Port) angeschlossen werden.

Bei manchen Routern kommt man nur in den Failsafemode durch extrem schnelles intervall-drücken der QSS-Taste direkt nach dem Einschalten.

Da im Failsafemode kein DHCP zur Verfügung steht, muss man seine Netzwerkkarte manuell Konfigurieren:
```
IP-Bereich: 192.168.1.0/24
```

Im Failsafemode wird Telnet benutzt, um Zugang zur Kommandozeile des Knotens zu erhalten.
Hierfür genügt folgendes Kommando auf der Kommandozeile unter Linux:
```
telnet 192.168.1.1
```

Um dauerhafte Änderungen am System durchführen zu können, muss zunächst ein Overlay-Dateisystem gemountet werden.
```
mount_root
``` 

Passwort und SSH-Key für den entfernten Zugang zum Knoten kann im ConfigMode oder mit dem Kommando geändert werden:
```
passwd
```
Es ist hierfür kein weiteres Passwort nötig. Dadurch kann somit der Zugang zu einem Knoten wiedererlangt werden, wenn dessen Passwort nicht länger bekannt ist und physischer Zugang besteht.

Das Webinterface ist seit Firmware v0.3.1 standardmäßig deaktiviert.
Es sollte aus Sicherheitsgründen nicht aktiviert werden.

### Normaler Betrieb
Bei Anschluss an das vorhandene Heimnetz bezieht der Knoten seine IP im normalen Betrieb automatisch via DHCP.

Statt Telnet wird im normalen Betrieb SSH benutzt, um auf die Kommandozeile des Routers zuzugreifen.

### Public fastd-Schlüssel vom Freifunk-Knoten für den VPN-Zugang anzeigen
```
/etc/init.d/fastd show_key mesh_vpn
```

### Version der Firmware anzeigen
Die [[automatisch generierte Liste der Knoten|http://freifunk.metameute.de/map/list.html]] sollte die Version zeigen. <br />
Alternativ geht folgender Befehl, wenn man SSH auf dem Knoten ist:
```
cat /lib/gluon/release
```

## In den ConfigMode gelangen

### Der Unterschied zwischen Configmode und Failsafemode
Der _Configmode_ ist der Zustand, den ein neuer Knoten nach dem ersten Flashen hat.
In diesem ist er auf den LAN-Ports per modifiziertem Web-Interface einstellbar.
Im ConfigMode blinkt die System-LED langsam.

Das Web-Interface ist in diesem Falle deaktiviert.
Im _Configmode_ blinkt die Sys-LED langsam.
Im _Failsafemode_ blinkt die System-LED schnell.

### Allgemein
* QSS-Taste im normalen Betrieb für mindestens 3 Sekunden gedrückt halten. Loslassen, wenn die Lampen merklich darauf reagieren, in jedem falle **vor** dem blinken der sys-lampe
* Bei erfolgtem Neustart den QSS-Button ''sofort'' los lassen, die sys-lampe sollte dann langsam blinken. Wenn man zu lange gedrückt hält bootet der Knoten in den Failsave-Modus (schnelles blinken)
* Nun an einen der LAN-Ports hängen und die 192.168.1.1 im Browser aufrufen.

### Besonderheiten
* Da der [[841ND|Firmware:841nd]] und der [[842|Firmware:842nd]] nur einen gemeinsamen WPS/RESET-Taster haben, ist dieser zu benutzen.
