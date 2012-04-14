# Roadmap

## Ideen für LFF v0.2

### Ziele

 * Jeder sollte ohne Konsole mit möglichst wenig Schritten einen LFF-Router selber flashen und updaten können.
 * Jeder sollte ohne Konsole mit möglichst wenig Schritten einen LFF-Router mit VPN einrichten können.

### Schritte zur Umsetzung

 * Den TP-Link 1043nd noch mehr als VPN Gerät spezialisieren und die Aufsetzung vereinfachen
   * Aftermath public-key + IP + tinc-config vorinstallieren
   * Eine Seite im Wiki einrichten, in der jeder der möchte seinen VPN Zugang hinzufügen kann. Diese VPN-Gateways werden dann alle zum nächsten LFF release hinzugefügt, solange sie a) eine Kontakt-Möglichkeit und b) eine akzeptable Latenz haben (c) eine IP aus dem Lübecker Raum?). Soll die Dezentralisierung des VPN-Meshes fördern
   * tinc public keys über das Web-If managebar machen
 * VPN Software (tinc, openssl) von Geräten mit wenig Flash-Speicher entfernen (Dlink DIR-300, TP-Link 741nd)
 * Da dann genügend Speicher auf allen Geräten verfügbar wäre, ein Webinterface installieren um das Neuflashen auf allen Geräten, sowie das tinc public key holen auf dem 1043nd, zu vereinfachen.
 * Zusätzlich die IP 192.168.20.81/24 auf dem WAN interface jedes Routers zuweisen, um auch das Neuflashen + public-key holen von einem PC ohne funktionierenden IPv6 stack machen zu können.

## LFF v0.2.1

 * Mehr tinc VPN Zugangs-Schlüssel in die default-Firmware hinzufügen (z.B. 8x aftermath) -> Damit die direkten batman-adv Nachbarschaften nicht zu groß werden auf einem VPN Zugangs-Knoten.
 * Evtl. auch bei default z.B. 4x intracity tinc Instanzen auf TP-Link TL-WR1043ND?
 * ddclient LuCI frontend.

## Ideen für LFF v0.3

### Ziele

 * Skalierbarkeit erhöhen.

### Schritte zur Umsetzung

 * [[Dynamisches Bridging|https://kbu.freifunk.net/index.php/Netzwerk-Konfiguration#Dynamisches_Bridging]] Architektur umsetzen?

## Ideen für LFF v0.x

### Ziele

 * Aufsetzen des tinc VPN Zugangs noch einfacher machen (sodass z.B. kein ddclient und Adresse:Port in tinc nötig sind, User solle möglichst kein Technikwissen benötigen)
 * Aufsetzen eines Internet-Gateways (+ Internet-VPN via z.B. Mullvad) vereinfachen.

### Schritte zur Umsetzung

 * Internet-Gateway-Server VM und/oder Live-CDs?
 * In tinc ein Feature hinzufügen, mit dem es nur an Hand des public keys per DHT o.ä. die Adresse + Port herausfinden kann? Oder erst einmal eine einfachere, semi-dezentrale Variante via z.B. look-up http-server(s) oder libirc.

### Außerdem

 * Distributions unabhängige Lübeck Freifunk Pakete? Sodass man auf einem beliebigen Laptop mal eben schnell einen Lübeck Freifunk Knoten aufsetzen könne?