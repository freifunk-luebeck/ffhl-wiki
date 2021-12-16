---
title: DNS
---

# DNS
Wir haben folgende domains:
* ffhl.de.
* luebeck.freifunk.net.
* *.ffhl (nur freifunkintern)

Auf [srv02]({{< relref "srv02" >}}) und den Gateways({{< relref "Gateways" >}}) läuft ein [PowerDNS](https://www.powerdns.com/index.html) authoritive Server.
Zusätzlich läuft auf den Gateways nur für unsere Subnetze erreichbar ein PowerDNS-Recursor. Da beides eigenständige Programme sind, bindet ein `dnsdist` auf port 53 und entscheidet was wo aufgelöst wird (sh. `/etc/dnsdist/dnsdist.conf`).

Die Zonefiles liegen im [ffhl-dns repo](https://git.chaotikum.org/freifunk-luebeck/ffhl-dns) und werden mit dem `dns-update.timer` regelmäßig gepullt.

Auf `srv02` liegen die zonefiles in `/var/lib/powerdns/zones`.
Auf den Gateways liegen die zonefiles in `/var/local/ffhl-dns/`.
