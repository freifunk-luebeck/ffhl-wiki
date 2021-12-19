Freifunk Lübeck Subnetz
=======================

Autonomes System
----------------

AS201173 (früher AS65052)


Für IPv6 verwenden wir das Prefix `2001:67c:2d50::/48` und das ULA
`fdef:ffc0:3dd7::/48`.

Das Prefix `2001:bf7:110::/44` ist uns noch zugeteilt, wird zur Zeit
jedoch nicht verwendet.


Subnetze
--------

### IPv6

Bitte nur das erste `/52` verwenden!

| Infix (aaaa:bbbb:cccc:0XXY::/60) | Beschreibung |
|----------------------------------|--------------|
| `2001:67c:2d50::/64`             | mesh         |

### Ideen zur Unterteilung des Präfixes

-   Wir könnten aus dem ersten /48 je /60 für alle Subnetze, die sich
    aus Gatewaysicht hinter dem Mesh befinden, aufsteigend verwenden.
-   Solche Subnetze wären z.B. die Meute, der nbsp, Heimnetze und das
    Mesh selber. Dabei wären 65536 Subnetze möglich.
-   Wir könnten weitere /48 für außerhalb des Meshes geroutete Netze
    verwenden (erstmal wohl unwahrscheinlich).

### IPv4


Für den Lübecker Raum ist das folgende Subnetz reserviert:

`10.130.0.0/16`


### IPv4 Exit über FF Rheinland
Im Moment nicht aktiv



Gateways
--------

| Name       | IPv4           | IPv6                  | Base MAC Address   | Status |
|------------|----------------|-----------------------|--------------------|--------|
| kaisertor  | `10.130.0.255` | `2001:67c:2d50::aaaa` | `de:ad:ca:fe:aa:*` | aktiv  |
| huextertor | `10.130.0.252` | `2001:67c:2d50::bbaa` | `de:ad:ca:fe:bb:*` | aktiv  |
| holstentor | `10.130.0.253` | `2001:67c:2d50::ccaa` | `52:54:00:0c:bb:*` | aktiv  |
| muehlentor | `10.130.0.254` | `2001:67c:2d50::ddaa` | `2e:7a:10:ba:d1:*` | aktiv  |
| gw05       | `10.130.0.251` | `2001:67c:2d50::5:1`  | `de:ad:ca:fe:05:*` | aktiv  |


DHCP-Ranges
----------

Im Grunde bedient jeder Gateway ein /21. Eine Ausnahme ist dabei der GW, der das 10.130.0.0/24 abdecken würde. Dieser Bereich ist für die statische Adressierung der Infrastruktur reserviert und wird nicht an Clients im Netz vergeben.
| CIDR             | DHCP Start    | DHCP Ende       | Gateway    | Status |
|------------------|---------------|-----------------|------------|--------|
| `10.130.0.0/21`  | `10.130.1.1`  | `10.130.7.255`  | holstentor | aktiv  |
| `10.130.8.0/21`  | `10.130.8.1`  | `10.130.15.255` | muehlentor | aktiv  |
| `10.130.16.0/21` | `10.130.16.1` | `10.130.23.255` | kaisertor  | aktiv  |
| `10.130.24.0/21` | `10.130.24.1` | `10.130.31.255` | huextertor | aktiv  |
| `10.130.32.0/21` | `10.130.32.1` | `10.130.39.255` | gw05       | aktiv  |
| `10.130.40.0/21` | `10.130.40.1` | `10.130.47.255` | none       | aktiv  |




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
 * 10.130.0.1 - 10.130.0.239, Netmask: 255.255.255.0 (/24)




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
| 10.130.0.10                 | srv02                      | srv02.ffhl      |
| 10.130.0.11                 | Switch im nbsp             |                 |
| 10.130.0.68                 | Fluse100Cam                |                 |
| 10.130.0.72                 | Fluse-IP-Stromleiste       |                 |
| 10.130.0.101                | blueberry                  | blueberry.ffhl  |
| 10.130.0.102                | strawberry                 | strawberry.ffhl |
| 10.130.0.103                | cranberry                  | cranberry.ffhl  |
| 10.130.0.104                | yunohost                   | yunohost.ffhl   |
| 10.130.0.240 - 10.130.0.255 | reserviert für Gateways    |                 |


Management 10.130.127.224/27 / 2001:67c:2d50:1::a82:7f00/123
------------------------------------------------------------

| IP4               | IP6                           | Verwendung  |
|-------------------|-------------------------------|-------------|
| 10.130.127.224/32 | 2001:67c:2d50:1::a82:7fe0/128 | Anycast DNS |

[Category:Technische Details](Category:Technische_Details "wikilink")
