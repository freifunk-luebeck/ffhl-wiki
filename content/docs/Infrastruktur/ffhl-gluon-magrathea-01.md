---
title: gluon-magrathea-01
---

# ffhl-gluon-magrathea-01

[ffhl-gluon-magrathea-01](https://map.luebeck.freifunk.net/#!v:m;n:525400b44b09) ist eine gluon VM auf dem Server [magrathea](https://wiki.chaotikum.org/infrastruktur:server:magrathea) vom [Chaotikum e.V.](https://chaotikum.org/). Die VM macht den uplink ins Freifunk für [srv02]({{< relref "srv02" >}}).


## respondd ebtables rule

Damit srv02 respondd requests rausschicken kann, die nicht von gluon geblockt werden, ist diese rule
nötig.


{{< hint warning >}}
**Achtung!**

Die rule ist nicht reboot persistent und muss nach einem neustart wieder hinzugefügt werden.
Siehe [hier](https://github.com/freifunk-gluon/gluon/pull/2103)
{{< /hint >}}


`/lib/gluon/ebtables/110-mcast-allow-respondd`:

```
rule 'MULTICAST_OUT -p IPv6 --ip6-protocol udp --ip6-destination-port 1001 --ip6-dst ff02::2:1001 -j RETURN'
rule 'MULTICAST_OUT -p IPv6 --ip6-protocol udp --ip6-destination-port 1001 --ip6-dst ff05::2:1001 -j RETURN'
```
