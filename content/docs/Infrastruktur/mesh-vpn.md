---
title: Mesh-VPN
---

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

# Key Management
Die Keys werden in einem git-repo auf srv-01 oder srv-02 verwaltet. Beim hinzufügen der Keys muss folgendes berücksichtigt werden:

- Das File-encoding __muss__ `us-ascii` oder `utf-8` sein.  (Mit `file -i <datei>` checken).
- Der Dateinname darf keine Leerzeichen oder Sonderzeichen enthalten

Ausserdem werden Keys, die über das Mesh bekannt gegeben werden (siehe [respondd](https://gluon.readthedocs.io/en/latest/features/monitoring.html#gluon-respondd) und [v2018.1 release notes](https://gluon.readthedocs.io/en/latest/releases/v2018.1.html#public-key-in-respondd-data-optional)) und noch nicht eingetragen sind, automatisch an keys@luebeck.freifunk.net geschickt.

Der Plan ist eigentlich, dass die auch direkt automatisch hinzugefügt werden, aber das ist mir gerade noch zu heikel.

