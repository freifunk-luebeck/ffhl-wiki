# Freifunk Gateway auf Arch Linux

## Dienste auf dem Gateway

* fastd
* bird
* bird6
* dhcpd
* radvd
* named (für eigene Domain wie .ffhl)
* lighttpd (für ffmap)
* OpenVPN (für mullvad/ipredator)
* haveged (für Entropie)

## /etc/dhcpd.conf

    default-lease-time 600;
    max-lease-time 3600;

    authoritative;

    log-facility local7;

    subnet 10.130.0.0 netmask 255.255.240.0 {
    	range 10.130.12.2 10.130.13.255;

    	option routers 10.130.12.1;
    	option domain-name-servers 10.130.12.1;
    }

## /etc/radvd.conf

    interface freifunk-hl
    {
    	AdvSendAdvert on;
    	IgnoreIfMissing on;
    	MaxRtrAdvInterval 200;

    	prefix fdef:ffc0:3dd7::/64
    	{
    	};

    	RDNSS fdef:ffc0:3dd7::c01
   	{
    	};
    };

## /etc/network.d/freifunk-hl

    INTERFACE='freifunk-hl'
    CONNECTION='bridge'
    DESCRIPTION='freifunk-hl bridge'
    FWD_DELAY=0

    IP='static'
    IPCFG=("link set down address 52:54:00:0c:bb:eb dev $INTERFACE" "addr add 10.130.12.1/20 dev $INTERFACE" "addr add fdef:ffc0:3dd7::c01/64 dev $INTERFACE" "link set up dev $INTERFACE")

## /etc/network.d/mesh-hl

    CONNECTION='ethernet'
    DESCRIPTION='mesh-hl'
    INTERFACE='mesh-hl'

    PRE_UP=("ip link set address 52:54:00:0c:bb:eb dev $INTERFACE")

    IP='static'
    IPCFG=("addr flush dev $INTERFACE")
    POST_UP=("brctl addif freifunk-hl $INTERFACE")
    PRE_DOWN=("brctl delif freifunk-hl $INTERFACE || true")

## /etc/modules-load.d/modules.conf

    batman-adv

## /etc/fastd/ffhl-mesh-vpn/fastd.conf

Hierzu muss noch ein Secret generiert werden und in `secret.conf` gespeichert werden. Vgl. [fastd Tutorial](http://www.nilsschneider.net/2013/02/17/fastd-tutorial.html)

    log to syslog level debug;
    user "fastd";
    interface "ffhl-mesh-vpn";
    method "xsalsa20-poly1305";
    bind 0.0.0.0:10000;
    include "secret.conf";
    mtu 1426;

    include peers from "peers";

    on up "
    	ip link set address 8E:3D:C2:10:10:28 up dev $INTERFACE

    	batctl -m mesh-hl if add $INTERFACE
    ";

## Eigene Routingtabelle für Freifunk

Hiermit leiten wir alle Pakete aus den Freifunkinterfaces in die Routingtabelle 42 um. Dort kann dann eine andere Defaultroute als in der Systemroutingtabelle verwendet werden.

### /etc/systemd/system/iprules.service

    [Unit]
    Description=ip rule
    Before=network.target

    [Service]
    Type=oneshot
    ExecStart=/usr/sbin/ip rule add from all fwmark 0x1 table 42
    ExecStop=/usr/sbin/ip rule del from all fwmark 0x1 table 42
    RemainAfterExit=yes

    [Install]
    WantedBy=network.target

Aktivieren mit:

    systemctl enable iprules.service


### /etc/iptables/iptables.rules

    *filter
    :INPUT ACCEPT [11844:1916189]
    :FORWARD ACCEPT [0:0]
    :OUTPUT ACCEPT [6263:1020836]
    COMMIT
    *mangle
    :PREROUTING ACCEPT [174173:29763433]
    :INPUT ACCEPT [173743:29726484]
    :FORWARD ACCEPT [0:0]
    :OUTPUT ACCEPT [95448:18280029]
    :POSTROUTING ACCEPT [95459:18280541]
    -A PREROUTING -i freifunk-+ -j MARK --set-xmark 0x1/0xffffffff
    COMMIT
    *nat
    :PREROUTING ACCEPT [516:46790]
    :INPUT ACCEPT [80:9421]
    :OUTPUT ACCEPT [48:3433]
    :POSTROUTING ACCEPT [47:3349]
    -A POSTROUTING -o mullvad -j MASQUERADE
    COMMIT

### /etc/openvpn/mullvad-up

Hier setzen wir die Defaultroute über das VPN in der Tabelle 42.

    #!/bin/sh
    ip route replace 0.0.0.0/1 via $5 table 42
    ip route replace 128.0.0.0/1 via $5 table 42
    exit 0

## Gateway Check Script

Dieses Skript wird per Cron alle x Minuten aufgerufen:

    * * * * * check_gateway

Skript nach /usr/local/bin/:

    #!/bin/bash
    INTERFACE=mullvad
    shopt -s nullglob

    ping -q -I $INTERFACE 8.8.8.8 -c 4 -i 1 -W 5 >/dev/null 2>&1

    if test $? -eq 0; then
        NEW_STATE=server
    else
        NEW_STATE=off
    fi

    for MESH in /sys/class/net/*/mesh; do
  	OLD_STATE="$(cat $MESH/gw_mode)"
  	[ "$OLD_STATE" == "$NEW_STATE" ] && continue
             echo $NEW_STATE > $MESH/gw_mode
             echo 54MBit/54MBit > $MESH/gw_bandwidth
             logger "batman gateway mode changed to $NEW_STATE"
    done