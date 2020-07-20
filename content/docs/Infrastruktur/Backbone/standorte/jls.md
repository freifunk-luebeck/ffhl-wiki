## Himmelsrichtungen

Die Kardinalpunkte (n, s, o, w) meshen derzeit nicht und bieten nur Clients den Zugriff an (Kanal 11, txpower 8 dBm).
Die übrigen vier Knoten meshen auf Kanal 1 und lassen keine Clients herein.

| Name        | MAC               | IPv6                 | Hardware       | Kabelfarbe |
|-------------|-------------------|----------------------|----------------|------------|
| jls-nsm2-n  | 24:a4:3c:9a:57:d7 | :26a4:3cff:fe9a:57d7 | Nanostation M2 | schwarz    |
| jls-nsm2-no | 24:a4:3c:9a:57:a8 | :26a4:3cff:fe9a:57a8 | Nanostation M2 | blau       |
| jls-nsm2-o  | 24:a4:3c:9a:57:6a | :26a4:3cff:fe9a:576a | Nanostation M2 | rot        |
| jls-nsm2-so | 24:a4:3c:9a:57:02 | :26a4:3cff:fe9a:5702 | Nanostation M2 | grün       |
| jls-nsm2-s  | 24:a4:3c:9a:56:f6 | :26a4:3cff:fe9a:56f6 | Nanostation M2 | gelb       |
| jls-nsm2-sw | 24:a4:3c:9a:58:25 | :26a4:3cff:fe9a:5825 | Nanostation M2 | weiß       |
| jls-nsm2-w  | 24:a4:3c:9a:57:d5 | :26a4:3cff:fe9a:57d5 | Nanostation M2 | pink       |
| jls-nsm2-nw | 24:a4:3c:9a:57:d6 | :26a4:3cff:fe9a:57d6 | Nanostation M2 | lila       |

### PoE Switch

Außerdem meshen die acht NanoStations über ihren WAN-Port (br-wan) über einen PoE Switch miteinander:Ubiquiti ToughSwitch POE Pro 8-Port

Der PoE-Switch ist wie folgt von einer NanoStation aus erreichbar:

 * IP: 192.168.1.20
 * User: ubnt
 * Authentifizierung: SSH-Schlüssel

Einzelne Ports können wie folgt vom Switch aus gepowercycled werden:

 * $ poe 1 0; sleep 5; poe 1 24

Bilder: https://files.metameute.de/d/ef6d41e142/

### Firmware-Update 

Damit bei einem Firmware-Update die Konfiguration erhalten bleibt wurde folgendes Konfiguriert:

#### AP-Knoten (N, O, S, W)

`/etc/sysupgrade.conf`

```
/etc/sysupgrade.conf
/lib/gluon/upgrade/997-ap_config
```

`/lib/gluon/upgrade/997-ap_config`

```
#!/bin/sh

uci set wireless.mesh_radio0.disabled='1'
uci set wireless.radio0.channel='5'
uci set wireless.radio0.txpower='8'
```

#### Mesh-Knoten (NW, NO, SO, SW)

`/etc/sysupgrade.conf`

```
/etc/sysupgrade.conf
/lib/gluon/upgrade/997-mesh_config
```

`/lib/gluon/upgrade/997-mesh_config`

```
#!/bin/sh
uci set wireless.client_radio0.disabled='1'
```

mit `sysupgrade --list-backup` kann überprüft werden, ob die richtigen Dateien persistent sind.
