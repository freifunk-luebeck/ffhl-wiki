# FAQ - Technische Realisierung

## Warum benutzt ihr fastd und nicht tinc, OpenVPN, quicktun, l2tp+ipsec, etc.?

_Die Vorteile für uns sind:_

* Sehr klein, benötigt (im Gegensatz zu tinc oder OpenVPN) kein OpenSSL
* batman-adv Overhead auf dem VPN Interface linear zur Anzahl an Knoten mit VPN-Verbindung
 (im Gegensatz zu tinc, welches durch eigenes Mesh-Routing batman-adv Broadcast Pakete stark, unnötig redundant verteilt => quadratischer Overhead zur Anzahl Knoten mit VPN-Verbindung)
* batman-adv Overhead auf dem VPN Interface linear zur Anzahl an VPN-Gateways (seit Firmware 0.3.2 wählt fastd immer nur zwei der verfügbaren Gateways aus)

## Warum benutzt ihr batman-adv und nicht Babel, OLSR, etc.?

_Die Vorteile für uns sind:_

* (Sehr schnelles!) Client-Roaming möglich: Smartphones, Laptops, etc. können sich schnell durch das Mesh bewegen, ohne dass ihre Verbindung abbricht
* Geringer Konfigurationsaufwand: Dank Layer 2 Routing (Switch-Routing) müssen keine IP-Subnetze auf jedem Router eingestellt und abgesprochen werden
* Multi-Interface Optimierungen: Kann wahlweise mehrere WLAN-Karten bündeln oder den Kanal alternieren um Interferenzen zu vermindern (verringerte Paketverluste, Latenzen und erhöhte Bandbreite auf Strecken über mehrere Router)
* Multicast-Dienste mit kleiner Bandbreite möglich: [mDNS](https://en.wikipedia.org/wiki/Multicast_DNS) (Host Discovery, Service Discovery), Bonjour-Chat, [SAP](http://wiki.videolan.org/SAP), [Lokale Bittorrent Peer Discovery](https://en.wikipedia.org/wiki/Local_Peer_Discovery), ...
* Unterstützt IPv4, IPv6 und prinzipiell jedes andere Layer 3 Protokoll
* Kann sehr viele Client-Geräte handhaben (reaktiver Algorithmus für Client-Geräte)

## Könnten die Freifunk-Router nicht auch die Gateway Aufgaben übernehmen?

Prinzipiell wäre dies natürlich wünschenswert, weil es mehr dem Freifunkgedanken entspräche. Denn danach sollten möglichst kaum/keine Hierarchien vorhanden sein, damit nicht einige wenige Menschen die Möglichkeit haben mehr Kontrolle auf das Netz als andere auszuüben.

Auch wenn die Gateway-Ebene selber flach ist, es also keinen hierarchischen Super-Gateways gibt und jeder, der *kann*, die Möglichkeit zum Hinzufügen eines Gateway dem Freifunk hat (die Gateways selber also in sich dezentral sind), gibt es zumindest eine Hierarchie durch Wissen und Erfahrungen mit Servern, OSPF, BGP usw.. Theoretisch kann jeder einen Gateway aufstellen, praktisch aber vielleicht doch nicht, weil nicht so trivial wie einen Freifunkknoten zu installieren.

### Hürden

* Bandbreite eines DSL Anschlusses / Skalierbarkeit batman-adv zur Nachbarschaftsgröße: Momentan hat in Lübeck ein Knotenbetreiber ungefähr 10kbit/s up/down Grundrauschen durch batman-adv-Management-Pakete und Broadcasts. Wenn jeder Knoten mit jedem anderen per VPN verbunden wäre und dadrüber dann batman-adv gesprochen würde, skaliert das garnicht. batman-adv verhält sich ungefähr quadratisch zur direkten Nachbarschaftsgröße. (Wir hatten so etwas früher mit tinc statt fastd probiert, da war generell dank tinc auch jeder Freifunkknoten dann mit jedem anderen direkt, ohne Gateway dazwischen verbunden. Da war dann aber bei ungefähr 15 Knoten mit 1s batman-adv OGM intervall Schluss, da es ca. 1MBit/s Upload.)

* Zuverlässigkeit: Freifunkknoten geht relativ oft mal offline. Wenn ein Gateway offline geht, dann würden für alle seine Clients die Verbindungen abbrechen, weil sie im Internet über einen neuen Gateway mit einer anderen IP-Adresse wären (Mobile IP könnte hiergegen irgendwann einmal interessant werden). Gateways auf Freifunkknoten könnte also unter Umständen das Surfen für den Endbenutzer sehr instabil machen.

* Konfiguration des VPN-Anonymisierungs-Dienstes: Wenn ein Freifunkknoten als Gateway auch einen Internetzugang anbieten wollen würde, müsste es vermutlich eine einfache Oberfläche zur Wahl und Konfigartion eines Anonymisierungsdienstes geben - ohne auf einige wenige solcher Anbieter zu zentralisieren.

* Konfiguration von Subnetzen: Es müsste im Knoten ein DHCP-Range konfiguriert und reserviert werden. Es gibt aber momentan keine sinnvolle Möglichkeit, diese automatisch, zuverlässig und mesh-tauglich zuzuweisen. Wenn jeder Knoten einen DHCP-Server bereit stellen würde, wäre es sicherlich auch wieder kontraproduktiv (bei IPv4 - bei IPv6 könnte es schon anders aussehen).

* Flash-Speicher-Größe 4MB: Einige VPN-Anonymisierungs-Dienste brauchen OpenVPN (und somit OpenSSL). Außerdem käme bird und einige andere Pakete hinzu. Würde sehr eng auf z.B. einem TP-Link 741nd werden.

_Fazit:_ Wäre schön, müsste aber noch viel entwickelt werden, auch konzeptuell. Bei der in Lübeck und Kiel aktuellen Lösung  mit den Gateways im Rechenzentrum sollte man darauf achten, dass jeder, der möchte und sich an Datenschutz, Netzneuträlität und [Pico-Peering-Agreement](http://www.picopeer.net/PPA-en.html) hält, auch einen Gateway betreiben könne und das es zumindest semi-dezentral dadurch wäre, dass keine Person root-Zugriff auf allen Servern hat.

Außerdem gab es hier auch mal einige Überlegungen mit FF-KBU (insb. Jan) und FFHL: http://kbu.freifunk.net/index.php?title=FSM-Dynamisches-Bridging

