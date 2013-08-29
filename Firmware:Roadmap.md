# Roadmap

### RM01 Kein Passwort im Configmode setzen

Das Passwort wird nur für den SSH-Zugriff benötigt. Den jedoch nutzen jedoch wenige. Darum sollte der Configmode auch keines mehr setzen. Stattdessen sollte der Rootzugang gesperrt (passwd -l root) werden, so dass im Normalbetrieb kein Login möglich ist. Es sollte jedoch optional einfach möglich sein ein Passwort zu setzen. Telnet im Configmode?

### RM02 Autoupdater

Der Autoupdater sollte implementiert werden und unabhängig vom Mesh funktionieren, so dass sichergestellt ist, dass alle Knoten jederzeit die aktuelle Firmware verwenden.

### RM03 batman-adv auf dem WAN Port

Es wäre wünschenswert auf dem WAN Port batman-adv zu sprechen. Die beste Idee ist bisher: DHCP auf dem WAN Port versuchen. Wenn es fehlschlägt, `batctl if add $WAN`. Danach jedoch weiterhin DHCP versuchen und das Interface wieder herausnehmen sobald es gelingt.

### RM04 batman-adv auf dem LAN Ports

In einigen Fällen wäre es praktisch auf den LAN Ports alternativ batman-adv zu sprechen. Z.B. dann, wenn ein WDR3600 den VPN Uplink bereitstellt und Bullets an die LAN Ports angeschlossen werden.

### RM05 Nearest-Node Webinterface

Es sollte möglich sein jederzeit den nächstgelegenden Knoten zu erreichen und dort eine Statusseite zu sehen. Von dort sollten auch andere Knoten in der Nachbarschaft erreicht werden können.

### RM06 fastd Key automatisch hinterlegen

fastd Keys könnten durch Knoten automatisch eingetragen werden, wenn man den neuen Knoten mit einem bereits eingebundenen Knoten per Kabel verbindet und an diesem den Button drückt. So ist sichergestellt, dass man Kontakt zur Community aufnimmt.

### RM07 Configmode abschaffen

Sobald RM01, RM02 und RM06 umgesetzt sind, sollte der Configmode entfernt werden, so dass neue Knoten direkt als Meshknoten verwendet werden können. Weitere Konfigurationen könnten über das Interface in RM05 vorgenommen werden.

# Alte Roadmap

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