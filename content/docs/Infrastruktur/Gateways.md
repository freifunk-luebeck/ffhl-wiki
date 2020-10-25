# Gateways

## Übersicht

## Setup
Die Gateways werden mit einem [ansible-playbook](https://git.luebeck.freifunk.net/FreifunkLuebeck/gateway-config) aufgesetzt.

Connectivity testen:
```
ansible -m ping --inventory=hosts.yml all 
```

ansible facts anzeigen:
```
ansible -m setup --inventory=hosts.yml all
```

### Bird
Wenn die bird confg geändert wird kann sie auf alle gateways synchronisiert werden:
```
ansible-playbook playbook.yml -v --diff --tags bird
```
Damit werden die bird Instanzen auch neu gestartet.



### MAC Adress Schema
MAC Adressen auf Gateways sollten nach einem festen Schema aufgebaut werden.
Ziel ist es, schnell und einfach anhand der MAC Adresse erkennen zu koennen,
um welchen Gateway/Server es sich handelt.
Schema:

`de:ad:ca:fe:<gateway>:<iface-type>`

`<Gateway>` kann frei gewahlt werden, sollte aber auf dem ganzen Gateway konsistent verwendet werden. Es bietet sich an, Werte wie `aa`, `cc`, etc. zu verwenden.
`<iface-type>` ist der Identifier fuer ein entsprechendes Interface. Das tatsaechlich im Netzwerk sichtbare Interface (meistens eine Bridge) soll dabei `aa` als Wert haben.

### Dienste
