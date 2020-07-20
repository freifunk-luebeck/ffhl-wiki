---
title: "Infrastruktur"
bookCollapseSection: true
weight: 40
---

# Infrastruktur

## Netzwerk

Das Freifunk Lübeck Mesh Netzwerk lässt sich auf mehreren Schichten abstrahieren.
Einerseits bauen Nodes mittels 802.11s direkt per WLAN ein Mesh Netzwerk zu nahegelegenen 
Nodes oder auch per Richtfunkstrecke zu weiter entfernten auf.

Als Routingprotokoll wird B.A.T.M.A.N. advanced verwendet. Dieses routet auf OSI-Layer 2  und lässt damit
alle Nodes als Teil eines Switch erscheinen.

Da es zu diesem Zeitpunkt noch undenkbar ist, alle Nodes direkt per WLAN anzubinden, baut ein Node
über den Uplink (der reguläre Internetanschluss) mit Fastd eine VPN Verbindung zu einem der Gateways auf.
Damit wird es Teil des Mesh-VPN und kann alle anderen Nodes des Freifunknetzes erreichen.

Traffic der aus dem Freifunknetz herausgeht, wird im normalfall über die Gateways ausgeleitet um Probleme mit 
der Störerhaftung zu umgehen, kann aber durch entsprechende Konfiguration auch direkt über den Uplink des
Nodes ausgehen.

### Layer2 Routing mit B.A.T.M.A.N. 

B.A.T.M.A.N. (Better Approach To Mobile Adhoc Networking)

[Wikipedia](https://de.wikipedia.org/wiki/B.A.T.M.A.N.)

### Mesh-VPN mit fastd 

Das Mesh-VPN verbindet einzelne Freifunkrouter, die sich nicht direkt sehen können, über das Internet miteinander.
Wird ein Knoten über den WAN-Port mit dem Internet verbunden, baut dieser eine verschlüsselte Verbindung zu unseren VPN-Gateways auf. Das sind von freiwilligen betriebene Server, die u.a. auch die getunnelten Routen ins Internet bereitstellen. In erster Linie ersetzen sie jedoch die ansonsten nötigen Richtfunkstrecken um Freifunk-"Inseln" zu verbinden.
Das VPN basiert zur Zeit auf [fastd](https://github.com/NeoRaider/fastd). fastd ist ein sehr einfacher und kleiner Tunneldaemon, der sichere Handshakes und Verschlüsselung bietet.

Um einen Freifunkknoten am Internet zu betreiben, sind folgenden Vorraussetzungen nötig:

1. Der Knoten versucht eine IP mittels DHCP zu beziehen. (Das Konfigurieren einer statischen IP ist möglich)
2. Offene Ports:
  - UDP 53 (DNS) wird benötigt um die DNS Adressen der Gateways aufzulösen
  - UDP 10000 (fastd) wird für die eigentliche VPN Verbindung verwendet.

Weiterhin versuchen die Knoten mittels NTP ihre Uhrzeit abzugleichen und über den WAN Port weitere Knoten zu finden. Das finden weiterer Knoten geschieht mittels Ethernet Paketen des Typs 0x4305.

Alle anderen Ports dürfen (oder sollten sogar!) gesperrt werden, um einen Zugriff aufs eigene Netzwerk völlig auszuschließen. Die Firmware der Knoten trennt die Netzwerke selber schon voneinander. Dazu werden mehrere virtuelle Netzwerkbrücken innerhalb des Knotens angelegt. Eine enthält alle Interfaces, auf denen Freifunk-Nutzdaten, (das Client WLAN mit der ESSID luebeck.freifunk.net, das VPN und die gelben LAN Ports das Knotens). Ein Routing zwischen dieser Brücke und dem WAN Port wird durch mehrere Mechanismen ausgeschlossen.


