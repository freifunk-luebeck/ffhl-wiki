# BGP

**Diese Seite ist WORK IN PROGRESS!**

## Config ohne Transit

* Vorteil: Sehr viel einfacher als mit Transit (kein iBGP nötig)
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
* 