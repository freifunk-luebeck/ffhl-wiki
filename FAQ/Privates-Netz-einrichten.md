# Privates Netz einrichten

## Diese Anleitung wird zur Zeit überarbeitet und funktioniert noch nicht!

Was macht diese Anleitung? Was sind die angestrebten Setups?

- **Szenario A1**: Geroutetes Subnetz auf den LAN-Ports.
- **Szenario A2**: Wie **A1**. Zusätzlich privates WLAN gebridged.
- **Szenario B**: Wie **A**, jedoch mit IPv4 Uplink über den WAN-Port.

## Vorbereitung im Wiki

[[Netzwerk:IP Subnetze]]

- IPv6 Subnetz reservieren
- IPv4 Subnetz reservieren

## Benötigte Pakete

Für ein privates Netz werden zusätzliche Pakete benötigt: 

- bird6
- tayga
- odhcpd

Diese können mittels `opkg update` gefolgt von `opkg install bird6 tayga odhcpd` installiert werden.

## Konfiguration

- ggf. ripng erlauben
- br-lan anlegen
- firewall anpassen?
- tayga konfigurieren
- bird6 konfigurieren
- dns?
- firewall für dns?

## /etc/config/network

- eth0.1 mit einem Editor der Wahl in der Datei `/etc/config/network` aus `client` rausnehmen
- `client` die reservierte IP zuweisen

        config interface 'client'
        ...
            option proto 'static'
            option ipaddr '10.130.0.120' <-- anpassen!
            option netmask '255.255.240.0'
    
- neues Interface `privat` erstellen


        config interface 'privat'     
            option ifname 'eth0.1'
            option type 'bridge'      
            option proto 'static'
            option ip6addr 'fdef:ffc0:3dd7:78::1/64' <-- anpassen!
            option ipaddr '10.130.120.1'  <-- anpassen!
            option netmask '255.255.255.224'

## /etc/config/firewall editieren

In config defaults und zone client jeweils `forward ACCEPT` einstellen.

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
Die vorhandene Datei muss durch diese Eintragungen ersetzt werden.

    config interface                     
        option interface       'privat'
        option AdvSendAdvert   1

    config prefix
        option interface     'privat'
        option AdvOnLink     1
        option AdvAutonomous 1
        option AdvRouterAddr 0

## /etc/bird6.conf
Die vorhandene Datei muss durch diese Eintragungen ersetzt werden.

    router id 1.1.1.1;
    
    protocol static {
      route 2001:67c:2d50:xxx0::/60 reject;
      route 2001:67c:2d50:1::10.130.yy.0/123 via "tayga-nat64";
      # /123 = /96 + /27
    }

    protocol kernel {
      scan time 20;
      import none;
      export all;
    }

    protocol device {
      scan time 10;
    }

    protocol rip {
      import where rip_metric < 16;
      export all;
      interface "br-client";
    }

## Initscripte aktivieren

    /etc/init.d/dnsmasq enable
    /etc/init.d/radvd enable
    /etc/init.d/bird4 enable
    /etc/init.d/bird6 enable

## Port Forwarding (optional)
Wenn auf dem nun im privaten Netz hängenden Computer ein Dienst läuft, der aus dem Internet erreichbar sein soll, so muss eine entsprechende Portweiterleitung sowohl im DSL-Router als auch im Freifunk-Knoten konfiguriert werden. Die Anleitung zur Konfiguration des Freifunk-Knotens kann hier gefunden werden:
http://wiki.openwrt.org/doc/howto/port.forwarding

Es müssen hierzu lediglich die Option "dest_ip" und "target" (freifunk) angepasst werden.