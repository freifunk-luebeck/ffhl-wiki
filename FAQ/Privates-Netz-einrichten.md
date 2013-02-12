# Privates Netz einrichten

## Benötigte Pakete

Für ein privates Netz werden noch drei zusätzliche Pakete benötigt: radvd, bird6 und bird4

    # opkg update
    Downloading http://downloads.openwrt.org/attitude_adjustment/12.09-rc1/ar71xx/generic/packages/Packages.gz.
    Inflating http://downloads.openwrt.org/attitude_adjustment/12.09-rc1/ar71xx/generic/packages/Packages.gz.
    Updated list of available packages in /var/opkg-lists/attitude_adjustment.
    # opkg install radvd bird6 bird4


## IP Subnetz festlegen

Zunächst sollte ein Subnetz auf [[Netzwerk:IP Subnetze]] unter "Andere reservierte Subnetze" reserviert werden. Ein /27 reicht dazu in den meisten Fällen. Aus dem Subnetz wird auch das IPv6 Subnetz berechnet:

    Subnetz:     10.130.120.0/27
                          ▲ nach Hex umwandeln
                          ▼ und hier einfügen
    IPv6: fdef:ffc0:3dd7:78::/64

    IPv4 des Knotens: 10.130.120.1
    IPv4 des Knotens im Mesh: 10.130.0.120
    IPv6 des Knotens: fdef:ffc0:3dd7:78::1

Es ist äußerst wichtig, dass das benutzte Subnetz dort direkt eingetragen wird, damit es auf keinen Fall zu Doppelbelegung kommt. Selbst bei Tests macht es also Sinn, das zu reservieren!

## IPv6 Linklocal und IPv4 von br-freifunk an Liste senden

Die Ausgabe von `ip -6 addr show br-freifunk` muss an die Mailingliste mit einem sinnvollen Kommentar geschickt werden, damit es in den Gateways richtig eingetragen wird und der Knoten später die Routen bekommt.

## /etc/config/network

- eth0.1 mit einem Editor der Wahl in der Datei `/etc/config/network` aus `freifunk` rausnehmen
- `freifunk` die reservierte IP zuweisen

        config interface 'freifunk'
        ...
            option proto 'static'
            option ipaddr '10.130.0.120' <-- anpassen!
            option netmask '255.255.240.0'
    
- neues interface 'privat' erstellen


        config interface 'privat'     
            option ifname 'eth0.1'
            option type 'bridge'      
            option proto 'static'
            option ip6addr 'fdef:ffc0:3dd7:78::1/64'
            option ipaddr '10.130.120.1'  
            option netmask '255.255.255.224'

## /etc/config/firewall editieren

In config defaults und zone freifunk jeweils `forward ACCEPT` einstellen.

In der Zone wan:

    option forward ACCEPT
    option masq 1
    option masq_src '10.130.120.0/27' <-- anpassen!

## /etc/config/dhcp

    config dhcp privat                                              
        option interface privat
        option start 10
        option limit 30
        option dhcp_option 'privat,6,10.130.10.1,10.130.12.1'

## /etc/config/radvd

    config interface                     
        option interface       'privat'
        option AdvSendAdvert   1

    config prefix
        option interface     'privat'
        option AdvOnLink     1
        option AdvAutonomous 1
        option AdvRouterAddr 0

## /etc/bird6.conf

    router id 10.130.0.120; <-- anpassen!

    protocol static {
        route fdef:ffc0:3dd7:78::/64 reject; <-- anpassen!
    }

    protocol kernel {
        scan time 20;
        import none;
        export where source != RTS_STATIC;
    }

    protocol device {
        scan time 10;
    }

    protocol ospf ospf_freifunk {
        import all;
        export where source = RTS_STATIC;

        area 0 {
                interface "br-freifunk" {
                        type nonbroadcast;
                        neighbors {
                                fe80::dcad:caff:fefe:461d eligible; # muehlentor
                                fe80::5054:ff:feee:5cd5 eligible; # burgtor
                                fe80::5054:ff:fe0c:bbeb eligible; # holstentor
                        };
                        priority 0;
                };
        };
    }

## /etc/bird4.conf

    router id 10.130.0.120; <-- anpassen!

    filter freifunk_dn42 {
	if net ~ [10.0.0.0/8+, 172.16.0.0/12+] then accept;
	else reject;
    }

    protocol kernel {
	scan time 20;		# Scan kernel routing table every 20 seconds
	import none;		# Default is import all
	export where source != RTS_STATIC_DEVICE;		# Default is export none
    }

    # This pseudo-protocol watches all interface up/down events.
    protocol device {
	scan time 10;		# Scan interfaces every 10 seconds
    }

    protocol static static_privat {
	route 10.130.120.0/27 via "br-privat"; <-- anpassen!
    }

    protocol ospf OSPF {
	rfc1583compat yes;
	export where proto = "static_privat";
	import filter freifunk_dn42;
	area 0.0.0.0 {
		interface "br-freifunk" {
			type nonbroadcast;
			neighbors {
				10.130.10.1 eligible; # muehlentor
				10.130.12.1 eligible; # holstentor
				10.130.14.1 eligible; # burgtor
			};
			priority 0;
		};
	};
   };

## initscripte aktivieren

    /etc/init.d/dnsmasq enable
    /etc/init.d/radvd enable
    /etc/init.d/bird4 enable
    /etc/init.d/bird6 enable
