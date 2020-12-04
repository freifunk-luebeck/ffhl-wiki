Freifunk Lübeck Subnetz
=======================

Autonomes System
----------------

AS201173 (früher AS65052)

IPv6
----

Für IPv6 verwenden wir das Prefix `2001:67c:2d50::/48` und das ULA
`fdef:ffc0:3dd7::/48`.

Das Prefix `2001:bf7:110::/44` ist uns noch zugeteilt, wird zur Zeit
jedoch nicht verwendet.

### Subnetze

Bitte nur das erste `/52` verwenden!

| Infix (aaaa:bbbb:cccc:0XXY::/60) | Beschreibung        |
|----------------------------------|---------------------|
| :0000:                           | mesh                |
| :0001:                           | Services            |
| :001Y:                           | ClientVPN (inaktiv) |
| :002Y:                           | tux-Net             |
| :003Y:                           | draic-Net           |
| :004Y:                           | Babel-Test          |
| :005Y:                           | (frei)              |

Das 'Y' ist dabei variabel.

### Services Prefix 2001:67c:2d50:0001::/64

| Prefix                        | Verwendung            |
|-------------------------------|-----------------------|
| 2001:67c:2d50:1::/96          | 464XLAT (Testbetrieb) |
| 2001:67c:2d50:1::a82:7f00/123 | Management Prefix     |

### Ideen zur Unterteilung des Präfixes

-   Wir könnten aus dem ersten /48 je /60 für alle Subnetze, die sich
    aus Gatewaysicht hinter dem Mesh befinden, aufsteigend verwenden.
-   Solche Subnetze wären z.B. die Meute, der nbsp, Heimnetze und das
    Mesh selber. Dabei wären 65536 Subnetze möglich.
-   Wir könnten weitere /48 für außerhalb des Meshes geroutete Netze
    verwenden (erstmal wohl unwahrscheinlich).

IPv4
----

Für den Lübecker Raum ist das folgende Subnetz reserviert:

`10.130.0.0/16`

Dabei wird für das eigentliche Mesh bisher `10.130.0.0/20` genutzt.
Dies wird sich mit dem Umstieg von Batadv14 auf Batadv15 aendern. (siehe [Gateways]({{< relref "#gateways" >}}) )

### IPv4 Exit über FF Rheinland

Wir verwenden `185.66.193.32/29`.


| IP            | Host       | Status |
|---------------|------------|--------|
| 185.66.193.32 | burgtor    | -      |
| 185.66.193.33 | holstentor | aktiv  |
| 185.66.193.34 | muehlentor | -      |
| 185.66.193.35 | huextertor | -      |


Gateways
--------

| Name             | Gateway IP   | Gateway           | batman-adv MAC    | DHCP Start   | DHCP Ende     | Status  |
|------------------|--------------|-------------------|-------------------|--------------|---------------|---------|
| huextertor (alt) | 10.130.0.252 | 6e:e4:d2:8a:3b:63 | d2:d0:93:63:f7:da | 10.130.1.0   | 10.130.4.188  |         |
| holstentor       | 10.130.0.253 | 52:54:00:0c:bb:eb | d6:89:49:08:f6:9d | 10.130.4.191 | 10.130.8.126  | aktiv   |
| muehlentor       | 10.130.0.254 | 2e:7a:10:ba:d1:c4 | 26:9c:57:9b:5c:b2 | 10.130.8.127 | 10.130.12.62  | aktiv   |
| kaisertor        | 10.130.0.255 | de:ad:ca:fe:aa:aa | de:ad:ca:fe:aa:bb | 10.130.16.1  | 10.130.23.254 | geplant |
| huextertor       | 10.130.0.252 | de:ad:ca:fe:bb:aa | de:ad:ca:fe:bb:bb | 10.130.24.1  | 10.130.31.254 | geplant |


DHCP-Ranges
----------

| Name       | CIDR           | DHCP Start  | DHCP Ende     | Status  |
|------------|----------------|-------------|---------------|---------|
| holstentor | 10.130.0.0/21  | 10.130.1.1  | 10.130.7.255  | geplant |
| muehlentor | 10.130.8.0/21  | 10.130.8.1  | 10.130.15.255 | geplant |
| kaisertor  | 10.130.16.0/21 | 10.130.16.1 | 10.130.23.255 | aktiv   |
| huextertor | 10.130.24.0/21 | 10.130.24.1 | 10.130.31.255 | aktiv   |




Reservierte Subnetze des Mesh-Netzes
------------------------------------

| Subnetz       | IP Range | Notizen                                         |
|---------------|----------|-------------------------------------------------|
| 10.130.0.0/24 | 1...255  | zur statischen Konfiguration frei zur Verfügung |


Reservierte, statische Mesh-IP-Adressen
---------------------------------------

Einzelne Adressen kann jeder selbst für sich reservieren. Es ist zu
empfehlen, einmal per Ping zu testen, ob eine Adresse wirklich frei ist.

Mögliche Adressen:
 * 10.130.0.1 - 10.130.0.239, Netmask: 255.255.240.0 (/20)




{{< hint warning >}}
TODO: alte, nicht mehr verwendete Adressen entfernen (anpingen, kontaktieren, entfernen)
{{< /hint >}}


| IP-Adresse                  | Notizen                    | Hostname        |
|-----------------------------|----------------------------|-----------------|
| 10.130.0.0 reserviert       | reserviert                 |                 |
| 10.130.0.1                  | Magische next-node-Adresse | node.ffhl       |
| 10.130.0.2                  | reserviert                 | reserviert      |
| 10.130.0.3                  | reserviert                 | reserviert      |
| 10.130.0.4                  | reserviert                 | reserviert      |
| 10.130.0.5                  | reserviert                 | reserviert      |
| 10.130.0.6                  | reserviert                 | reserviert      |
| 10.130.0.7                  | reserviert                 | reserviert      |
| 10.130.0.8                  | reserviert                 | reserviert      |
| 10.130.0.9                  | srv01                      | srv01.ffhl      |
| 10.130.0.10                 | srv02                      | srv02.ffhl      |
| 10.130.0.11                 | Switch im nbsp             |                 |
| 10.130.0.34                 | alfred                     |                 |
| 10.130.0.42                 | ctf-vm                     |                 |
| 10.130.0.68                 | Fluse100Cam                |                 |
| 10.130.0.72                 | Fluse-IP-Stromleiste       |                 |
| 10.130.0.98                 | tortilla                   |                 |
| 10.130.0.99                 | ffhl-builder               |                 |
| 10.130.0.100                | Paul's Server              |                 |
| 10.130.0.101                | blueberry                  | blueberry.ffhl  |
| 10.130.0.102                | strawberry                 | strawberry.ffhl |
| 10.130.0.103                | cranberry                  | cranberry.ffhl  |
| 10.130.0.240 - 10.130.0.255 | reserviert für Gateways    |                 |


Management 10.130.127.224/27 / 2001:67c:2d50:1::a82:7f00/123
------------------------------------------------------------

| IP4               | IP6                           | Verwendung  |
|-------------------|-------------------------------|-------------|
| 10.130.127.224/32 | 2001:67c:2d50:1::a82:7fe0/128 | Anycast DNS |

[Category:Technische Details](Category:Technische_Details "wikilink")
