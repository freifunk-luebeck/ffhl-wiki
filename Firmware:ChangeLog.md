# ChangeLog

## v0.3.1 (Release 2012-09-27)

* Update auf den aktuellen OpenWRT Attitude Adjustment Trunk
* Feste MAC-Adresse der Knoten im Mesh
* Erhöhtes batman-adv-OGM-Intervall von 5s zur Verringerung der Grundlast
* VPN-Peer muehlentor hinzugefügt
* Webserver (uhttpd), telnet und dnsmasq per Default deaktiviert
* Umbenennung des Client-WLANs von http://luebeck.freifunk.net/ auf luebeck.freifunk.net
* Support für neue Router-Modelle
* Unterstützung von 5GHz-WLAN auf TL-WDR3600 (ESSID 'luebeck.freifunk.net (5GHz)'
* Unterstützte Geräte:
 * [[TP-Link TL-WR741ND|Firmware:741nd]]
 * [[TP-Link TL-WR841ND|Firmware:841nd]]
 * [[TP-Link TL-WR842ND|Firmware:842nd]]
 * [[TP-Link TL-WR1043ND|Firmware:1043nd]]
 * [[TP-Link TL-WDR3600|Firmware:3600]]

Download: [[http://metameute.de/~freifunk/firmware/0.3.1/]]

## v0.3 (Release 2012-08-22)

* Aktueller OpenWRT Attitude Adjustment Trunk als Grundlage der Firmware
* Vollständige Überarbeitung der Netz-Topologie, neues Mesh-VPN
* Die Bandbreite, die für VPN-Verbindungen genutzt wird, kann beschränkt werden
* Config Mode zur initialen Konfiguration des Nodes
* Unterstützte Geräte:
 * [[TP-Link TL-WR741ND|Firmware:741nd]]
 * [[TP-Link TL-WR841ND|Firmware:841nd]]
 * [[TP-Link TL-WR1043ND|Firmware:1043nd]]

Download: [[http://metameute.de/~freifunk/firmware/0.3/]]

## v0.2.1

 * Einige neue VPN (intracity) Zugänge. Sollte die Internetzugänge zum Lübeck Freifunk Netz entlasten.
 * SNMP Server konfiguriert. Bald gibt es dadurch automatisch aktualisierte Statistiken auf http://www.metameute.de/cacti-export.
 * Einige nicht benutzte Applikationen wurden entfernt um weniger Flash-Speicher zu verbrauchen (dadurch baut unter anderem das Image für den TP-Link TL-WR741ND wieder).
 * Einloggen auf dem eigenen Router über das Mesh möglich, wenn ein Passwort gesetzt wurde.
 * mDNS: Jeder Router hat einen Mesh-weit erreichbaren Hostnamen (Beispiel: ''Freifunk-D85D4CF2AEC2.local'')
 * DNSSD: Der Router gibt einige seiner Dienste (http, https, ssh, snmp) automatisch im Mesh-Netz bekannt, die andere Anwendungen ohne Konfigurationsaufwand des Users benutzen können. Tipp: Sich auf seinem Freifunk-Router mit zwei Klicks mit dem Firefox Plugin [["DNSSD for Firefox"|https://addons.mozilla.org/en-US/firefox/addon/dnssd/]] einloggen.
 * WLAN-Treiber aktualisiert (bzw. [[OpenWrt|https://openwrt.org/]] Backfire auf 10.03.1 geupdated). Sollte diverse, kleine Bugs noch beheben und die WLAN Verbindung stabiler machen.
 * Bug beim Verbinden zweier Freifunk-Router per WAN-Anschluss behoben (danke tcatm!).

## v0.2

 * VPN (Virtuelles Privates Netzwerk über das Internet) Software ist für den TP-Link WR1043ND vorinstalliert, und konfiguriert. Wer keinen anderen Lübeck Freifunk Router in der Nähe hat, kann sich mit dem WR1043ND über das Internet zum Rest des Lübecker Meshes verbinden.
 * Ein Konfigurations-Webinterface (LuCI) auf dem WAN-Port. Dieses ist im Browser via `https://Freifunk-[MAC]` am WAN-Anschluss erreichbar, wenn der WAN-Anschluss des Lübeck Freifunk Routers mit dem Heimnetz-Router verbunden ist. Wobei [MAC] die unter dem Router aufgedruckte MAC-Adresse ist (Beispiel: `https://Freifunk-D85D4CF2AEC2`).
 * Verschlüsseltes, privates WLAN Netz, welches die eigene Internetverbindung benutzt. Der Freifunk Router muss hierzu wie oben beschrieben mit dem Heimnetz-Router verbunden sein. Ein zufälliges Passwort ist vorkonfiguriert und kann im Webinterface abgefragt oder geändert werden.
 * Das Updaten wird in Zukunft einfacher gehen, ab v0.2 kann dies einfach über das oben genannte Webinterface gemacht werden mit gesetzem Haken bei "Keep all configuration changes".

Alle Änderungen im Detail finden sich unter http://git.metameute.de/LuebeckFreifunkFirmware und den entsprechenden Unter-Repositories unter dem Tag [[lff-v0.2|http://git.metameute.de/LuebeckFreifunkFirmware/tag/?id=lff-v0.2]].
