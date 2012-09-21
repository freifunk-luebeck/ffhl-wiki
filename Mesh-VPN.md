# Mesh-VPN

## Grundidee

Das Mesh-VPN verbindet einzelne Freifunkrouter, die sich nicht direkt sehen können, über das Internet miteinander.

## Funktionsweise

Wird ein Knoten über den WAN-Port mit dem Internet verbunden, baut dieser eine verschlüsselte Verbindung zu unseren VPN-Gateways auf.
Das sind von freiwilligen betriebene Server, die u.a. auch die getunnelten Routen ins Internet bereitstellen. In erster Linie ersetzen sie jedoch die ansonsten nötigen Richtfunkstrecken um Freifunk-"Inseln" zu verbinden.

# Technisches

Das VPN basiert zur Zeit auf [[fastd|https://projects.universe-factory.net/projects/fastd]]. fastd ist ein sehr einfacher und kleiner Tunneldaemon, der sichere Handshakes und Verschlüsselung bietet.

## Vorraussetzungen

Um einen Freifunkknoten am Internet zu betreiben, sind folgenden Vorraussetzungen nötig:

1. Der Knoten versucht eine IP mittels DHCP zu beziehen. (Das Konfigurieren einer statischen IP ist möglich)
1. Offene Ports:
  1. UDP 53 (DNS) wird benötigt um die DNS Adressen der Gateways aufzulösen
  1. UDP 10000 (fastd) wird für die eigentliche VPN Verbindung verwendet.

Weiterhin versuchen die Knoten mittels NTP ihre Uhrzeit abzugleichen und über den WAN Port weitere Knoten zu finden. Das finden
weiterer Knoten geschieht mittels Ethernet Paketen des Typs 0x4305.

Alle anderen Ports dürfen (oder sollten sogar!) gesperrt werden, um einen Zugriff aufs eigene Netzwerk völlig auszuschließen.
Die Firmware der Knoten trennt die Netzwerke selber schon voneinander. Dazu werden mehrere virtuelle Netzwerkbrücken innerhalb des Knotens angelegt. Eine enthält alle Interfaces, auf denen Freifunk-Nutzdaten, (das Client WLAN mit der ESSID `luebeck.freifunk.net`, das VPN und die gelben LAN Ports das Knotens). Ein Routing zwischen dieser Brücke und dem WAN Port wird durch mehrere Mechanismen ausgeschlossen.

## Verschlüsselung

Als Cipher werden wahlweise xsalsa20-poly1305 oder aes128-gcm eingesetzt. xsalsa20-poly1305 eignet sich besonders für Prozessoren ohne spezielle Kryptobeschleunigung, also für die normalen Freifunkknoten.
