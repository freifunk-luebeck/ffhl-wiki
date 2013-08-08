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
    
    allow-hotplug $BATMAN
    iface $BATMAN inet manual
    	up ip link set up dev $BATMAN
    	up batctl if add $BATMAN
    	up ip link set addr 1e:97:89:a7:ba:e5 dev bat0
    	up ip link set bat0 up


## fastd konfigurieren

Zunächst wird das fastd Repo eingebunden:

    deb http://repo.universe-factory.net/debian/ sid main
    
und fastd installiert:

    apt-get update && apt-get install fastd

dann eine fastd.conf erstellt (z.B. in /etc/fastd/ffhl-mesh-vpn/fastd.conf):

    log level debug;
    interface "mesh-vpn";
    method "xsalsa20-poly1305";
    include "secret.conf";
    mtu 1426;
    mode tap;
    
    peer group "backbone" {
    	peer limit 2;
    	include peers from "backbone";
    }

    on up "
    	#ip link set address **EINZIGARTIGEMACHIER** up dev $INTERFACE
    	batctl if add $INTERFACE
    ";

als nächstes das Schlüsselpaar wie folgt erstellen:

    fastd --generate-key

hiervon den Secret Schlüssel nach /etc/fastd/ffhl-mesh-vpn/secret.conf in folgender
Form kopieren:

    secret "188ec8c6bd604867d8469e9e15bd6825ba9e9e84a12e42f7d60c4304de086562";

und diese nur für Root les- und schreibbar machen:

    chmod 600 /etc/fastd/ffhl-mesh-vpn/secret.conf

und den Public Schlüssel per eMail an folgende Adresse schicken:

    freifunk.luebeck-keys@asta.uni-luebeck.de

dann die Gateways eintragen durch die Erstellung folgender Dateien:

/etc/fastd/ffhl-mesh-vpn/backbone/burgtor

    key "657af03e36ff1b8bbe5a5134982a4f110c8523a9a63293870caf548916a95a03";
    remote ipv4 "burgtor.mesh.ffhl.chaotikum.org" port 10000;

/etc/fastd/ffhl-mesh-vpn/backbone/holstentor

    key "8c660f7511bf101ea1b599fe53af20e1146cd923c9e9d2a3a0d534ee75af9067";
    remote ipv4 "holstentor.mesh.ffhl.chaotikum.org" port 10000;

/etc/fastd/ffhl-mesh-vpn/backbone/muehlentor

    key "bd4ec3cf87bb0042eed2fa121fbc402154d28fb1ae9dff9cdb71bb21892f401a";
    remote ipv4 "muehlentor.mesh.ffhl.chaotikum.org" port 10000;

## batman-adv konfigurieren

    apt-get install batman-adv-dkms

batman-adv beim Booten starten:

    echo batman-adv >> /etc/modules

# Konkrete Installationen

## alfred

Schwartauerallee
