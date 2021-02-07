# Gateways

## Übersicht

Eine kurze Ubersicht, welche Ordner/Dateien was machen

* `group vars/all.yml`: Hier sind Variable definiert, die für all Hosts gültig sind
* `host_vars/<gateway>.yml`: spezifische Variablen für einen Host. Z.B. DHCP-Bereich. Außerdem sind hier Variablen,
die für eine *Role* benutzt werden, defniniert.
* `hosts.yml`: eine Liste von Hosts. Hosts sind außerdem in einer Gruppe. Die Gruppe heißt i.d.R. ‘gateways`.
Theoretisch können hier auch direkt Variablen für einen Host definiert werden. Das machen wir aber nicht. Wir
definieren hier Variable für Gruppen.
* `roles/*`: Hier liegen die Konfigurationen für die Roles. Die Role ‘base’ setzt für uns ein Gateway auf.
* `playbook. yml`: die eigentliche Konfigurationsdatei. Hier steht, welche Hosts/Gruppen welche Rollen bekommen.

Ein paar nützliche Befehle:

* `ansible-playbook playbook.yml --list-hosts`
* `ansible-playbook playbook.yml --list-tags`
* `ansible-playbook playbook.yml --list-tasks`
* `ansible-playbook playbook.yml --list-tasks --tag powerdns`: zeigt alle tasks, die mit dem Tag powerdns versehen sind
* `ansible-playbook --step playbook.yml`: wie im debugger durch die tasks steppen

## Setup
Die Gateways werden mit einem [ansible-playbook](https://git.luebeck.freifunk.net/FreifunkLuebeck/gateway-config) aufgesetzt.

Connectivity testen:
```
ansible -m ping all
```

ansible facts anzeigen:
```
ansible -m setup all
```


### Ansible Checklist
0. Host ins invantar adden `hosts.yml`
1. Fastd-keys generieren
2. `host-vars/<gateway>` von einem anderen kopieren und Variablen anpassen (secret-keys mit `ansible-vault encrypt-string` verschlüsseln)
3. gw-vpn peer-file erstellen. `roles/base/files/mesh-gwvpn/gateways/<gateway>`
4. SSH-Key für `root` auf gateway erstellen und ins [fastd-key](https://git.luebeck.freifunk.net/FreifunkLuebeck/fastd-keys)-repo als "deploy-key" hinzufügen
5. ansible scripts **NUR FÜR DEN NEUEN GATEWAY** laufen lassen. (am besten ein kleines eigenes playbook)
	- vorher einmal `ansible -m ping all` und
	- `ansible-playbook my-playbook.yml --check` (da kann was failen weil configs und pakete einfach noch nicht da. grob schauen ob das der Fall ist)
6. reboot! (and check if everything is okay)

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
