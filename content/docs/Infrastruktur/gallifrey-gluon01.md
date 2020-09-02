# gallifrey-gluon01

`gallifrey-gluon01` ist eine gluon VM auf dem dem Server `gallifrey`. Er macht den uplink ins
Freifunk für [srv02]({{< relref "srv02" >}}).


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
