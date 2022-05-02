---
title: DNS
---

# DNS

## Domains
Wir haben folgende domains:
- `ffhl.de.`
- `luebeck.freifunk.net.`


## Domain Einträge hinzufügen

Alle Subdomains werden über ansible geupdatet. Die Subdomains für `ffhl.de` und `luebeck.freifunk.net` sind immer automatisch dieselben. In der Datei [`group_vars/dns-auth.yml`](https://git.chaotikum.org/freifunk-luebeck/gateway-config/-/blob/master/group_vars/dns-auth.yml) sind alle subdomains definiert. Um ein Update zu deployen muss das `dns.yml` Playbook ausgeführt werden:

```
ansible-playbook dns.yml
```


## Nameserver

Es gibt 2 authoritive Nameserver:
- `ns1.ffhl.de` / `ns1.luebeck.freifunk.net`: [srv02]({{< relref "srv02" >}})
- `ns2.ffhl.de` / `ns2.luebeck.freifunk.net`: [huextertor]({{< relref "Gateways" >}})


## Software

Auf [srv02]({{< relref "srv02" >}}) und [huextertor]({{< relref "Gateways" >}}) läuft jeweils ein dnsdist, [pdns-recursor](https://www.powerdns.com/recursor.html) und bind9. DNSdist ist dabei für das "routing" der Anfragen zuständig. Die Config sieht wie folgt aus:

1. `DNSdist`: Anfrage annehmen
1. `DNSdist`: Anfrage auf eine unserer Domains?
    1. {{< yes >}} Ja:
        1. An bind weiterleiten
        1. Fertig.
    1. {{< no >}} Nein:
        1. Aus unserem Subnetz?
            1. {{< yes >}} Ja:
                1. An pdns-recursor weitergeben und auflösen
                1. Fertig
            1. {{< no >}} Nein:
                1. Anfrage verwerfen
                1. Fertig
