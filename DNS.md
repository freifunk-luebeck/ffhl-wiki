# DNS

Wir haben derzeit drei DNS Server, um die TLD `.ffhl` aufzulösen.

 * 10.130.10.1 / fdef:ffc0:3dd7::a01
 * 10.130.12.1 / fdef:ffc0:3dd7::c01
 * 10.130.14.1 / fdef:ffc0:3dd7::e01

## BIND Konfiguration

    zone "ffhl" {
        type slave;
        file "slave/ffhl.zone";
        masters { 10.130.10.1; 10.130.12.1; 10.130.14.1; };
        allow-transfer { any; };
    };

## FFHL zone files

Zu finden im Repo [auf github.](https://github.com/MetaMeute/ffhl-dns)

## DNS anderer Netze

Umgezogen nach: http://wiki.freifunk.net/DNS