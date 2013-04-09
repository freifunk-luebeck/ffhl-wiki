# Andere Netze

Aus unserem Netzwerk kann man Knoten (Rechner) in anderen Netzwerken ebenfalls erreichen. Dies geschieht über so genannte [[Peerings|https://de.wikipedia.org/wiki/Peering]] von denen wir schon einige bisher ermöglicht haben.

## Aktuelle Peerings

* Internet
* DN42
* IC-VPN
* Chaos-VPN
* Freifunk Kiel (IPv6 only)

## Internetzugang

Wir stellen allen Nutzern einen Internetzugang zur Verfügung. Dieser läuft über einen ausländischen Anonymisierungsdienst, der zum Schutz dazwischen geschaltet wird.
Es kann daher vorkommen, dass man auf Webseiten nicht die gewohnte deutsche Seite, sondern eine andere angezeigt bekommt.
Dieser Zugang ist nicht sonderlich schnell, aber ausreichend für kleinere Downloads und dem allgemeinen Surfen im Web.
Nur der Port 25 (SMTP) wird gesperrt. Nutzen Sie zum Versenden von E-Mails bitte SSL.

## Dn42

Das Dn42 ist ein privates Netzwerk ähnlich dem Freifunk, unterscheidet sich aber von diesem dahingehend grundlegend, dass es in erster Linie nur zwischen Servern aufgespannt wird. Es soll allerdings nicht - wie beim Freifunk - ein leichter Zugang für die Allgemeinheit gewährleistet werden, sondern es wird zum Beitreten ein gewisser Kenntnisstand mit Netzwerken erwartet. Zur Nutzung ist dies aber nicht notwendig.

[[Dn42 in der englischen Wikipedia|http://en.wikipedia.org/wiki/Dn42]]

## IC-VPN

Das InterCity-VPN stellt eine Verbindung zwischen vielen regionalen Freifunk-Netzen dar und bildet den Grundstein dafür, dass man aus unserem Netz Knoten in andern Regionen (z.B. Augsburg, Oldenburg oder Dresden) erreichen kann.
Eine gute Karte mit den beteiligten Gruppen findet sich bei den Dresdnern unter [[dieser Adresse|http://www.ddmesh.de/topology/ic-vpn-verbindungen.html]].

## Chaos-VPN

Dieses Netzwerk soll eine Möglichkeit zur unabhängigen Vernetzung für Computerbegeisterte der ganzen Welt darstellen.

## IP-Bereiche

| IP-Bereich                | TLD   | Netz                                               |
|---------------------------|-------|----------------------------------------------------|
| 10.8.0.0/16               | .ffc  | [[Freifunk Chemnitz|http://chemnitz.freifunk.net]] |
| 10.11.0.0/16              | .ffa  | [[Freifunk Augsburg|http://augsburg.freifunk.net]] |
| 10.130.0.0/16             | .ffhl | [[Freifunk Lübeck|http://luebeck.freifunk.net]]    |
| fda1:384a:74de:4242::1/48 | .ffki | [[Freifunk Kiel|http://kiel.freifunk.net]]         |
| 172.22.0.0/15             | .dn42 | [[Dn42|https://dn42.net]]                          |