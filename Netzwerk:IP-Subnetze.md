# Freifunk Lübeck Subnetz

## Autonomes System

AS201173 (früher AS65052)

## IPv6

Für IPv6 verwenden wir das Prefix `2001:67c:2d50::/48` und das ULA `fdef:ffc0:3dd7::/48`.

Das Prefix `2001:bf7:110::/44` ist uns noch zugeteilt, wird zur Zeit jedoch nicht verwendet.

### Subnetze

Bitte nur das erste `/52` verwenden! 

| Infix (aaaa:bbbb:cccc:0XXY::/60) | Beschreibung          |
|----------------------------------|-----------------------|
| :0000:                           | mesh                  |
| :0001:                           | Services              |
| :001Y:                           | ClientVPN (inaktiv)   |
| :002Y:                           | tux-Net               |
| :003Y:                           | draic-Net             |
| :004Y:                           | Babel-Test            |
| :005Y:                           | (frei)                |

Das 'Y' ist dabei variabel.

### Services Prefix 2001:67c:2d50:0001::/64

| Prefix                         | Verwendung                |
|--------------------------------|---------------------------|
| 2001:67c:2d50:1::/96           | 464XLAT (Testbetrieb)     |
| 2001:67c:2d50:1::a82:7f00/123  | Management Prefix         |

### Ideen zur Unterteilung des Präfixes

* Wir könnten aus dem ersten /48 je /60 für alle Subnetze, die sich aus Gatewaysicht hinter dem Mesh befinden, aufsteigend verwenden.
* Solche Subnetze wären z.B. die Meute, der nbsp, Heimnetze und das Mesh selber. Dabei wären 65536 Subnetze möglich.
* Wir könnten weitere /48 für außerhalb des Meshes geroutete Netze verwenden (erstmal wohl unwahrscheinlich).

## IPv4

Für den Lübecker Raum ist das folgende Subnetz reserviert:

    10.130.0.0/16

Dabei wird für das eigentliche Mesh bisher `10.130.0.0/20` genutzt.

### IPv4 Exit über FF Rheinland

Wir verwenden `185.66.193.32/29`.

| IP            | Host       | Status  |
|---------------|------------|---------|
| 185.66.193.32 | burgtor    | aktiv   |
| 185.66.193.33 | holstentor | aktiv   |
| 185.66.193.34 | muehlentor | -       |
| 185.66.193.35 | huextertor | -       |

## Gateways

| Name       | Gateway IP   | Gateway MAC       | batman-adv MAC    | DHCP Start   | DHCP Ende     | Status    |
|------------|--------------|-------------------|-------------------|--------------|---------------|-----------|
| huextertor | 10.130.0.252 | 6e:e4:d2:8a:3b:63 | d2:d0:93:63:f7:da |   10.130.1.0 |  10.130.4.188 | aktiv     |
| holstentor | 10.130.0.253 | 52:54:00:0c:bb:eb | d6:89:49:08:f6:9d | 10.130.4.191 |  10.130.8.126 | aktiv     |
| muehlentor | 10.130.0.254 | 2e:7a:10:ba:d1:c4 | 26:9c:57:9b:5c:b2 | 10.130.8.127 |  10.130.12.62 | aktiv     |
| burgtor    | 10.130.0.255 | 52:54:00:ee:5c:d7 | 52:54:00:f3:62:d9 | 10.130.12.63 | 10.130.15.255 | aktiv     |

## Reservierte Subnetze des Mesh-Netzes

| Subnetz       | IP Bereich  | Notizen                                                                |
|---------------|-------------|------------------------------------------------------------------------|
| 10.130.0.0/24 |     1...255 | zur statischen Konfiguration frei zur Verfügung (siehe unten)          |

## Reservierte, statische Mesh-IP-Adressen

Einzelne Adressen kann jeder selbst für sich reservieren. Es ist zu empfehlen, einmal per Ping zu testen, ob eine Adresse wirklich frei ist.

Mögliche Adressen: 10.130.0.1 bis 10.130.0.239
Netmask: 255.255.240.0 (/20)

| IP-Adresse      | Notizen                       | Hostname       |
|-----------------|-------------------------------|----------------|
|     10.130.0.0  | reserviert                    | reserviert     |
|     10.130.0.1  | Magische next-node-Adresse    | node.ffhl      |
|     10.130.0.2  | reserviert                    | reserviert     |
|     10.130.0.3  | reserviert                    | reserviert     |
|     10.130.0.4  | reserviert                    | reserviert     |
|     10.130.0.5  | reserviert                    | reserviert     |
|     10.130.0.6  | reserviert                    | reserviert     |
|     10.130.0.7  | reserviert                    | reserviert     |
|     10.130.0.8  | krtek                         | krtek.ffhl     |
|     10.130.0.9  | srv01                         | srv01.ffhl     |
|    10.130.0.11  | DerDerwish                    |                |
|    10.130.0.12  | stmarien (vm auf krtek)       | stmarien.ffhl  |
|    10.130.0.13  | 7jM                           | serverbox      |
|    10.130.0.15  | staegidien (vm auf krtek)     | staegidien.ffhl|
|    10.130.0.16  | Avahi: bluedog.local          |                |
|    10.130.0.17  | greendog                      | greendog.ffhl  |
|    10.130.0.18  | meuteblog                     | meuteblog.ffhl |
|    10.130.0.19  | server                        |                |
|    10.130.0.20  | GW Monitoring -Test- Stefan   | prtg.ffhl      |
|    10.130.0.21  | NeoRaider (WG)                | confusion      |
|    10.130.0.26  | duckie & xidd                 | Rapture        |
|    10.130.0.27  | 7jM                           | StrahlenKiste  |
|    10.130.0.28  | SIP Proxy                     | proxy.sip.ffhl |
|    10.130.0.29  | namshub  [node] {magu}        | namshub.ffhl   |
|    10.130.0.30  | enki [node] {magu}            | enki.ffhl      |
|    10.130.0.31  | innana [node] {magu}          | innana.ffhl    |
|    10.130.0.32  | opz [x21] {magu}              | opz.ffhl       |
|    10.130.0.33  | me {magu}                     | me.ffhl        |
|    10.130.0.34  | alfred                        |                |
|    10.130.0.35  | Silber1                       |                |
|    10.130.0.36  | nutch                         | nutch.ffhl     |
|    10.130.0.37  | bo                            |                |
|    10.130.0.39  | nm-alix                       | nm-alix.ffhl   |
|    10.130.0.42  | NasBox                        | nasbox.ffhl    |
|    10.130.0.43  | nbsp routing VM               |                |
|    10.130.0.64  | magu Server                   | cic.ffhl       |
|    10.130.0.65  | johnyb                        |                |
|    10.130.0.68  | Fluse100Cam                   |                |
|    10.130.0.72  | Fluse-IP-Stromleiste          |                |
|    10.130.0.100 | zafer                         |                |
|    10.130.0.116 | Dennis                        |                |
|    10.130.0.117 | mkms node                     |                |
|    10.130.0.118 | zenforyens node               |                |
|    10.130.0.120 | passe0815                     |                |
|    10.130.0.123 | zenforyens raspberry          |                |
|    10.130.0.132 | FreeWayLan (StatServer)       | freeway.ffhl   |
| ab 10.130.0.240 | reserviert für Gateways     |                |

## Heimnetze: 10.130.64.0/18

Vergabe von 10.130.127.0 abwärts bis 10.130.64.0.
Alles ab 10.130.128.0 muss frei bleiben

Es ist zu empfehlen, erstmal ein /27 am Anfang eines /24 zu reservieren, solange uns nicht die /24 ausgehen. Ist das /27 voll, kann man dann problemlos auf ein /26 oder /25 aufstocken, sodass keine übermäßige Fragmentierung der Adress-Bereiche entsteht.

| Subnetz           | IP Bereich | Beschreibung            |
|-------------------|------------|-------------------------|
| 10.130.114.0/26   | 1..63      | draic-Net               |
| 10.130.115.0/27   | 1..30      | tux-Net                 |
| 10.130.116.0/27   | 1..30      | Dennis' Netz            |
| 10.130.117.0/27   | 1..30      | mkms Netz               |
| 10.130.118.0/27   | 1..30      | zenforyens Netz         |
| 10.130.119.0/27   | 1..30      | MHintz                  |
| 10.130.120.0/27   | 1..30      | Netz von Passe0815      |
| 10.130.121.0/27   | 1..30      | bo                      |
| 10.130.122.0/27   | 1..30      | Magu Network            |
| 10.130.123.0/24   | 1..254     | Meutekeller             |
| 10.130.124.0/27   | 1..30      | Netz von duckie & xidd  |
| 10.130.125.0/27   | 1..30      | Netz von 7jM            |
| 10.130.127.224/27 | 224..255   | Management              |

## Management 10.130.127.224/27 / 2001:67c:2d50:1::a82:7f00/123

| IP4               | IP6                           | Verwendung      |
|-------------------|-------------------------------|-----------------|
| 10.130.127.224/32 | 2001:67c:2d50:1::a82:7fe0/128 | [[Anycast DNS]] |
| 10.130.127.225/32 | 2001:67c:2d50:1::a82:7fe1/128 | Tayga / NAT64   |
