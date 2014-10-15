# Freifunk Lübeck Subnetz

## IPv6

Für IPv6 wird der Prefix `2001:bf7:110::/44` verwendet.

| Prefix                                          | Verwendung       |
|-------------------------------------------------|------------------|
| 2001:bf7:110::/64 (fdef:ffc0:3dd7::/64)         | mesh             |
| 2001:bf7:110:10::/64 (fdef:ffc0:3dd7:10::/64)   | Client-VPN       |
| 2001:bf7:11f:f000::/52                          | Tests (Nils)     |

Geräte mit statischer Adresse 10.130.a.b sollten die IPv6-Adresse
``2001:bf7:110::0.0.a.b/64`` zugeteilt bekommen.

### ULA

Wir möchten das ULA `fdef:ffc0:3dd7::/48` mittelfristig nicht mehr verwenden
und auf das öffentliche Prefix umstellen.

### Ideen zur Unterteilung des Präfixes

* Wir könnten aus dem ersten /48 je /64 für alle Subnetze, die sich aus Gatewaysicht hinter dem Mesh befinden, verwenden. Solche Subnetze wären z.B. die Meute, der nbsp, Heimnetze und das Mesh selber. Dabei wären 65536 Subnetze möglich.
* Wir könnten weitere /48 für außerhalb des Meshes geroutete Netze verwenden (erstmal wohl unwahrscheinlich).

## IPv4

Für den Lübecker Raum ist das folgende Subnetz reserviert:

    10.130.0.0/16

Dabei wird für das eigentliche Mesh bisher `10.130.0.0/20` genutzt.

## Internet-Gateways

Jeder der selber einen Internet-Gateway zur Verfügung stellen möchte, und diesen per DHCP bekannt macht, sollte zum einen in seinem batman-adv den [[Gateway-Server aktivieren|http://www.open-mesh.org/wiki/batman-adv/Gateways]]. Und sich zum anderen ein unbenutzes /24 Subnetz aus 10.130.0.0/20 aussuchen (jedoch trotzdem /20 Subnetzmasken an die DHCP Clients schicken).

| Name       | Gateway IP    | Gateway MAC | batman-adv originator MAC | DHCP(Range)         | batman-adv Version | Status  |
|------------|---------------|-------------|---------------------|------|----------------------|---------------------------|--------------------|---------|
| kaisertor  | 10.130.6.1  |                   |                   | 10.130.6.0/23  |           | Planung   |
| huextertor | 10.130.8.1  | 6e:e4:d2:8a:3b:63 | d2:d0:93:63:f7:da | 10.130.8.0/23  | 2013.2.0+ | im Aufbau |
| muehlentor | 10.130.10.1 | de:ad:ca:fe:46:1d | de:ad:be:ef:46:1d | 10.130.10.0/23 | 2013.2.0+ | aktiv     |
| holstentor | 10.130.12.1 | 52:54:00:0c:bb:eb | 8e:3d:c2:10:10:28 | 10.130.12.0.23 | 2013.2.0+ | aktiv     |
| burgtor    | 10.130.14.1 | 52:54:00:ee:5c:d5 | 52:54:00:f3:62:d9 | 10.130.14.0/23 | 2013.1.0  | aktiv     |

## Reservierte Subnetze des Mesh-Netzes

| Subnetz       | IP Bereich  | Notizen                                                                |
|---------------|-------------|------------------------------------------------------------------------|
| 10.130.0.0/24 |     1...255 | zur statischen Konfiguration frei zur Verfügung (siehe unten)          |
| 10.130.3.0/24 |     0...255 | temporäre IPs. Einfach verwenden und bei Kollision eine andere nehmen. |

Es ist zu empfehlen, erstmal ein /27 am Anfang eines /24 zu reservieren, solange uns nicht die /24 ausgehen. Ist das /27 voll, kann man dann problemlos auf ein /26 oder /25 aufstocken, sodass keine übermäßige Fragmentierung der Adress-Bereiche entsteht.

## Reservierte, statische Mesh-IP-Adressen

Einzelne Adressen kann jeder selbst für sich reservieren. Es ist zu empfehlen, einmal per Ping zu testen, ob eine Adresse wirklich frei ist.

Mögliche Adressen: 10.130.0.1 bis 10.130.0.255
Netmask: 255.255.240.0 (/20)

| IP-Adresse    | Notizen                       | Hostname       | Owner |
|---------------|-------------------------------|----------------|-------|
|   10.130.0.0  | reserviert                    | reserviert     |
|   10.130.0.1  | Magische next-node-Adresse    | node.ffhl      |
|   10.130.0.2  | reserviert                    | reserviert     |
|   10.130.0.3  | reserviert                    | reserviert     |
|   10.130.0.4  | reserviert                    | reserviert     |
|   10.130.0.5  | reserviert                    | reserviert     |
|   10.130.0.6  | reserviert                    | reserviert     |
|   10.130.0.7  | reserviert                    | reserviert     |
|   10.130.0.8  | Avahi: krtek.local            | krtek.ffhl     |
|   10.130.0.9  | srv01                         | srv01.ffhl     |
|  10.130.0.11  | DerDerwish                    |                |
|  10.130.0.12  | stmarien (vm auf krtek)       | stmarien.ffhl  |
|  10.130.0.13  | 7jM                           | serverbox      |
|  10.130.0.15  | staegidien (vm auf krtek)     | staegidien.ffhl|
|  10.130.0.16  | Avahi: bluedog.local          |                |
|  10.130.0.17  | greendog                      | greendog.ffhl  |
|  10.130.0.18  | meuteblog                     | meuteblog.ffhl |
|  10.130.0.19  | server                        |                |
|  10.130.0.20  | Jamalaka                      | silvan         |
|  10.130.0.21  | NeoRaider (WG)                | confusion      |
|  10.130.0.22  | Jamalaka                      | techem         |
|  10.130.0.23  | Laeila & jix                  | kyubey         |
|  10.130.0.26  | duckie & xidd                 | Rapture        |
|  10.130.0.27  | 7jM                           | StrahlenKiste  |
|  10.130.0.28  | SIP Proxy                     | proxy.sip.ffhl |
|  10.130.0.29  | namshub  [node] {magu}        | namshub.ffhl   |
|  10.130.0.30  | enki [node] {magu}            | enki.ffhl      |
|  10.130.0.31  | innana [node] {magu}          | innana.ffhl    |
|  10.130.0.32  | opz [x21] {magu}              | opz.ffhl       |
|  10.130.0.33  | me {magu}                     | me.ffhl        |
|  10.130.0.34  | alfred                        |                |
|  10.130.0.35  | Silber1                       |                |
|  10.130.0.36  | nutch                         | nutch.ffhl     |
|  10.130.0.37  | bo                            |                |
|  10.130.0.38  | Paul-Nook2012                 |                |
|  10.130.0.39  | fritz (nbsp)                  |                |
|  10.130.0.40  | nbsp beamer                   |                |
|  10.130.0.41  | nbsp schloss                  |                |
|  10.130.0.42  | NasBox                        | nasbox.ffhl    |
|  10.130.0.43  | nbsp drucker                  |                |
|  10.130.0.64  | magu Server                   | cic.ffhl       |
|  10.130.0.65  | johnyb                        |                |
|  10.130.0.66  | muehlentor-monitor            |                |
|  10.130.0.67  | holstentor-monitor            |                |
|  10.130.0.68  | Fluse100Cam                   |                |
|  10.130.0.69  | burgtor-monitor               |                |
|  10.130.0.72  | Fluse-IP-Stromleiste          |                |
|  10.130.0.100 | zafer                         |                |
|  10.130.0.101 | zafer-g1                      | zafer-g1.ffhl  |
|  10.130.0.102 | zafer-g2                      |                |
|  10.130.0.103 | zafer-g3                      |                |
|  10.130.0.104 | zafer-g4                      |                |
|  10.130.0.105 | zafer-rpi                     |                |
|  10.130.0.106 | zafer-rpc1                    |                |
|  10.130.0.107 | zafer-rpc2                    |                |
|  10.130.0.116 | Dennis                        |                |
|  10.130.0.117 | mkms node                     |                |
|  10.130.0.118 | zenforyens node               |                |
|  10.130.0.120 | passe0815                     |                |
|  10.130.0.123 | zenforyens raspberry          |                |
|  10.130.0.132 | FreeWayLan (StatServer)       | freeway.ffhl   |

## Andere reservierte Subnetze

Vergabe von 10.130.127.0 abwärts, alles ab 10.130.128.0 muss frei bleiben!

Die Reservierung eines solchen Netzes sollte mit anderen Freifunkern abgesprochen werden.

| Subnetz         | IP Bereich | Beschreibung            |
|-----------------|------------|-------------------------|
| 10.130.16.0/24  | 1..254     |Client-VPN auf Burgtor   |
| 10.130.17.0/24  | 1..254     |L2TP-Client-VPN auf Chip |
| 10.130.116.0/27 | 1..30      |Dennis' Netz             |
| 10.130.117.0/27 | 1..30      |mkms Netz                |
| 10.130.118.0/27 | 1..30      |zenforyens Netz          |
| 10.130.119.0/27 | 1..30      |MHintz                   |
| 10.130.120.0/27 | 1..30      |Netz von Passe0815       |
| 10.130.121.0/27 | 1..30      |bo                       |
| 10.130.122.0/27 | 1..30      |Magu Network             |
| 10.130.123.0/24 | 1..254     |Meutekeller              |
| 10.130.124.0/27 | 1..30      |Netz von duckie & xidd   |
| 10.130.125.0/27 | 1..30      |Netz von 7jM             |
| 10.130.126.0/27 | 1..30      |Netz von Laeila & jix    |
| 10.130.127.0/27 | 1..30      |Jamalakas Netz           |



## 10.130.16.0/24

Diese Adressen werden im Client-VPN genutzt und von NeoRaider verwaltet.

| IP-Adresse   | Notizen                        | Hostname        |
|--------------|--------------------------------|-----------------|
| 10.130.16.1  |                                | Burgtor         |
| 10.130.16.2  | Pascals Server                 | chip.ffhl       |
| 10.130.16.3  | DerDerwishs Server             | derderwish.ffhl |
| 10.130.16.4  | DerDerwishs Server (sekundär)  |                 |
| 10.130.16.6  | Jamalaka X200                  |                 |
| 10.130.16.7  | Jamalaka Calvin                |                 |
| 10.130.16.10 | magu                           |                 |
| 10.130.16.11 | zenforyen                      |                 |
| 10.130.16.17 | Eichi                          |                 |
| 10.130.16.18 | berik /ampache testuser pw 1234| hinkelstein.ffhl|
| 10.130.16.19 | mkm                            |                 |
| 10.130.16.20 | tux                            |                 |
| 10.130.16.21 | zafer                          |                 |
| 10.130.16.22 | san                            |                 |