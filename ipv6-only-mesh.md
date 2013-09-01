# Freifunk Lübeck und IPv6

Hier sollen Informationen und Ideen darüber gesammelt werden, wie wir ein
Freifunknetz, das nur noch IPv6 einsetzt, aufbauen können. Ziel ist es, völlig
auf IPv4 verzichten zu können.

## Aktueller Stand

### Adressverteilung

Aktuell wird im Lübecker Freifunknetz sowohl IPv4 als auch IPv6 (Dual-Stack)
eingesetzt. IPv6 Adressen werden dabei mittels RA und Autokonfiguration
vergeben, während für IPv4 noch DHCP zum Einsatz kommt.

### Routing

Auf den Gateways werden mittels BGP und OSPF Routen für IPv6 als auch IPv4
verteilt, so dass Clients einen der Gateways als Standardgateway verwenden
können um andere Freifunknetze und das Internet zu erreichen.

Der Internetzugang für sowohl IPv6 als auch IPv4 erfolgt mittels NAT,
sodass die internen Adressen nicht nach außen sichtbar werden.

### DNS

Auf den Gateways gibt es auch DNS Server, die sowohl IPv6 als auch
IPv4 sprechen. Diese lösen zusätzlich zu den ICANN TLDs noch diverse,
Freifunk und dn42 interne TLDs auf.

## Ziel der Umstellung auf IPv6

IPv4 ist aufgrund der Abhängig von DHCP nicht unbedingt für große
Meshnetze geeignet. Die Autokonfiguration von IPv6 hingegen
vereinfacht die Vergabe der Adressen in Meshnetzen deutlich.

Es wäre also wünschenswert im Freifunknetz nur noch IPv6 zu verwenden.

## Gründe für IPv4

Aktuell gibt es noch viele Freifunknetze, die nur IPv4
verwenden. Diese können nur über NAT mit einem IPv6 Netz verbunden
werden. Das erreichen von IPv6 Netzen mittels IPv4 ist mittels NAΤ
auch möglich, allerdings nicht trivial umzusetzen.

## Probleme

### Geräte, die DHCP erwarten

Es gibt Geräte, die zwingend eine IPv4 Adresse über DHCP verlangen
bevor sie die Verbindung als "aufgebaut" betrachten. Davon ist
u.a. Android betroffen.

Für diese Geräte könnten wir eine Dummy Adresse verwenden und sämtliche
Pakete auf den Knoten von und zu dieser Adresse verwerfen.

### DNS Server (RDNSS)

Viele Betriebssystem haben weiterhin das Problem, dass sie keine
Nameserver für IPv6 erhalten können. Davon, laut Wikipedia, betroffen (auswahl):

	* Android
	* Solaris
	* Symbian
	* Windows (NT + Phone)


## Mögliche Lösungen

### DNS

Das größte Problem stellt die Verteilung der DNS Server dar. Daher
wäre ein IPv6-only Netz nur möglich, wenn gleichzeitig zumindest noch
DNS über IPv4 aufgelöst würde. Das DNS Protokoll eignet sich dabei gut
für NAT, so dass der Knoten die Übersetzung der DNS Anfragen auf IPv6
und zurück übernehmen könnte.


