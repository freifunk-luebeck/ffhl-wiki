# BGP

**Diese Seite ist WORK IN PROGRESS!**

## Config ohne Transit

* Vorteil: Sehr viel einfacher als mit Transit (kein iBGP nötig, problemlos mit einer einzelnen Routing-Tabelle möglich)
* Nachteil: Kein Transit

Routen-Quellen:
* eBGP (dn42)
* eBGP (IC-VPN)
* RIP/andere IGP?

Routen-Ziele:
* Alle Routen-Quellen
* Kernel


Regeln (geordnet nach Priorität):
* eBGP -> Kernel
* eBGP -> RIP
* RIP -> Kernel


Besonderheiten: Aktuell wird jede IC-VPN-Route auch wieder in IC-VPN announced.
Dies hat den Vorteil, dass auch ohne Update der Config auf jedem einzelnen IC-VPN-Node
das Routing zwischen allen Teilnehmen möglich ist; wäre aber bei automatischer Generierung der BGP-Config nicht mehr notwendig.


## Config mit Transit

* Komplex...

Routen-Quellen:
* eBGP (dn42)
* eBGP (IC-VPN)
* iBGP
* RIP/andere IGP?

Routen-Ziele:
* Alle Routen-Quellen
* Kernel


Regeln (geordnet nach Priorität):
* eBGP -> Kernel
* eBGP -> RIP
* eBGP -> iBGP
* RIP -> Kernel
* iBGP -> eBGP mit Auflösung der Routen durch RIP! (wird bisher auf keinem unserer Gateways so gemacht?); Pfad verlängern?
* Frage: Gibt es Situationen, in denen eine iBGP-Route gegenüber einer längeren eBGP-Route bevorzugt werden sollte?
Wie würden in diesem Fall Schleifen verhindert werden?

Routen aus RIP dürfen auf keinen Fall wieder im BGP landen (Pfad geht verloren -> Schleifen)!

Aktuelle Config hat zu viele opaque Pipes; führt leicht zu Schleifen, wenn nicht sehr gut aufgepasst wird (zuletzt
auf burgtor geschehen...)

Frage: Reicht eine Bird-Tabelle (pro Kernel-Tabelle)? Wahrscheinlich muss RIP in gesonderte Tabelle, damit es zur Auflösung der
iBGP-Routen verwendet werden kann. Muss ICVPN in eine eigene Tabelle wie bisher?