# Debian als fastd-Gateway

Diese Anleitung beschreibt den Aufbau eines fastd Gateways auf Basis von Debian GNU/Linux. Ein solcher Gateway ist dazu gedacht den VPN Zugang ins Lübecker Freifunknetz zur Verfügung zu stellen, so dass die normalen Freifunkknoten dahinter entlastet werden.

## Vorraussetzungen

PC mit zwei Netzwerkkarten, `eth0` und `eth1`. Eines davon wird der WAN Port, das andere der batman-adv Port. Wir entscheiden uns für:

    $WAN = eth1
    $BATMAN = eth0

Im Folgenden sind also beide "Variablen" entsprechend zu ersetzen.

## Installation

Normales Debian installieren. NTP und SSH sind praktisch.

## Netzwerk konfigurieren

    allow-hotplug $WAN
    iface $WAN inet dhcp

## fastd konfigurieren

Zunächst wird das fastd Repo eingebunden:

    deb http://repo.universe-factory.net/debian/ sid main
    
und fastd installiert:

    apt-get update && apt-get install fastd

## batman-adv konfigurieren

    apt-get install batman-adv-dkms

# Konkrete Installationen

## alfred

Schwartauerallee