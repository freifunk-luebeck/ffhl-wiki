---
title: DNS
---

# DNS
Wir haben folgende domains:
* ffhl.de.
* luebeck.freifunk.net.


Auf [srv02]({{< relref "srv02" >}}) läuft ein [PowerDNS](https://www.powerdns.com/index.html)
authoritive dns-server und auf den Gateways jeweils nur ein recursor.
Bei PowerDNS sind der recursor und der authoritive server verschiedenen Programme.

Wir haben uns dafür entschieden, weil powerdns einfacher zu konfigurieren und simpler zu warten ist.

Auf `srv02` liegen die zonefiles in `/var/lib/powerdns/zones`.
