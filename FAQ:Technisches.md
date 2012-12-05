# FAQ - Technische Realisierung

## Warum benutzt ihr fastd und nicht tinc/OpenVPN/quicktun/l2tp+ipsec/...?

_Die Vorteile für uns sind:_

* Sehr klein, benötigt (im Gegensatz zu tinc oder OpenVPN) kein OpenSSL
* batman-adv Overhead auf dem VPN Interface linear zur Anzahl an Knoten mit VPN-Verbindung
 (im Gegensatz zu tinc, welches durch eigenes Mesh-Routing batman-adv Broadcast Pakete stark, unnötig redundant verteilt => quadratischer Overhead zur Anzahl Knoten mit VPN-Verbindung)
* batman-adv Overhead auf dem VPN Interface linear zur Anzahl an VPN-Gateways (seit fastd v6 wählt es immer nur zwei der verfügbaren Gateways aus)

## Warum benutzt ihr batman-adv und nicht Babel/OLSR/...?

_Die Vorteile für uns sind:_

* (Sehr schnelles!) Client-Roaming möglich: Smartphones, Laptops, etc. können sich schnell durch das Mesh bewegen, ohne dass ihre Verbindung abbricht
* Geringer Konfigurationsaufwand: Dank Layer 2 Routing (Switch-Routing) müssen keine IP-Subnetze auf jedem Router eingestellt und abgesprochen werden
* Multi-Interface Optimierungen: Kann wahlweise mehrere WLAN-Karten bündeln oder den Kanal alternieren um Interferenzen zu vermindern (verringerte Paketverluste, Latenzen und erhöhte Bandbreite auf Strecken über mehrere Router)
* Multicast-Dienste mit kleiner Bandbreite möglich: [[mDNS|https://en.wikipedia.org/wiki/Multicast_DNS]] (Host Discovery, Service Discovery), Bonjour-Chat, [[SAP|http://wiki.videolan.org/SAP]], [[Lokale Bittorrent Peer Discovery|https://en.wikipedia.org/wiki/Local_Peer_Discovery]], ...
* Unterstützt IPv4, IPv6 und prinzipiell jedes andere Layer 3 Protokoll
* Kann sehr viele Client-Geräte handhaben (reaktiver Algorithmus für Client-Geräte)

## Könnten die Freifunk-Router nicht auch die Gateway Aufgaben übernehmen?

Prinzipiell wäre dies natürlich wünschenswert, weil es mehr Freifunk-mäßig wäre. Denn nach der Freifunk-Philosohpie sollten möglichst kaum/keine Hierarchien vorhanden sein damit nicht einige wenige Menschen die Möglichkeit haben mehr Kontrolle auf das Netz als andere auszuüben.

Auch wenn die Gateway-Ebene selber flach ist, es also keinen hierarchischen super-Gateway und jeder der *kann* einen Gateway dem FF hinzufügen kann (die Gateways selber also in sich dezentral sind), gibt es zumindest eine Hierarchie durch Wissen/Erfahrungen mit Servern/OSPF/BGP/... . Theoretisch kann jeder Gateway machen, praktisch aber vielleicht doch nicht, weil nicht so trivial wie einen FF-Router zu installieren.

### Hürden

* Bandbreite eines DSL Anschlusses / Skalierbarkeit batman-adv zur Nachbarschaftsgröße: Momentan hat in Lübeck ein Node-Betreiber ungefähr 10kbit/s up/down Grundrauschen durch batman-adv management Pakete und broadcasts: Wenn jeder mit jedem Knoten per VPN verbunden wäre und dadrüber dann batman-adv gesprochen würde, skaliert das garnicht: batman-adv verhält sich ungefähr quadratisch zur direkten Nachbarschaftsgröße. (wir hatten so etwas mal früher mit tinc statt fastd probiert, da war generell dank tinc auch jeder FF-Knoten dann mit jedem anderen FF-Knoten direkt, ohne Gateway dazwischen ver-VPN-ed, da war dann aber bei ungefähr 15 Knoten mit 1s batman-adv OGM intervall Schluss, dann ist man bei 1MBit/s upload.)

* Zuverlässigkeit: FF-Knoten geht relativ oft mal offline. Wenn ein Gateway offline geht, dann würden für alle seine Clients die Verbindungen abbrechen, weil sie im Internet über einen neuen Gateway mit einer anderen IP Adresse wären (mobile IP könnte hiergegen irgendwann einmal interessant werden). Gateways auf FF-Knoten könnte also unter Umständen das Surfen füden Endbenutzer instabil machen.

* Konfiguration des VPN-Anonymisierungs-Dienstes: Wenn ein FF-Router Gateway auch einen Internetzugang anbieten wollen würde, müsste es vermutlich eine einfache Oberfläche im FF-Router zur Wahl und Konfigartion eines VPN-Anonymisierungs-Dienst geben - ohne auf einige wenige solcher Anbieter zu zentralisieren.

* Konfiguration Subnetze: Es müsste im Router ein DHCP-Range konfiguriert und reserviert werden. Es gibt momentan keine sinnvolle Möglichkeit, diese automatisch, zuverlässig, mesh-tauglich zuzuweisen. Wenn jeder FF-Knoten einen DHCP-Server machen würde, wäre es vielleicht auch weider kontraproduktiv (bei IPv4 - bei IPv6 könnte es schon anders aussehen).

* Flash-Speicher-Größe 4MB: Einige VPN-Anonymisierungs-Dienste brauchen OpenVPN (und somit OpenSSL). Außerdem käme bird und einige andere Pakete hinzu. Würde sehr eng auf z.B. einem TP-Link 741nd werden.

_Fazit:_ Wäre schön, müsste aber noch viel entwickelt werden, auch konzeptuell. Bei der in Lübeck und Kiel aktuellen Gateway-im-Rechenzentrum Lösung evtl. darauf achten, dass jeder, der möchte und sich an Datenschutz, Netzneuträlität und Pico-Peering-Agreement (http://www.picopeer.net/PPA-en.html ) hält, auch einen Gateway betreiben könne und das es zumindest semi-dezentral dadurch wäre, dass keine Person root-Zugriff auf allen Servern habe.

Außerdem gab es hier auch mal einige Überlegungen mit FF-KBU (insb. Jan) und FFHL: http://kbu.freifunk.net/index.php?title=FSM-Dynamisches-Bridging
