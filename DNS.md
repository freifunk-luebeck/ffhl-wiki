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

### .hack (ChaosVPN)

    zone "hack" in{
        type slave;
        file "slave/slave.hack";
        masters {172.31.0.5;};
        allow-transfer { any; };
        forwarders { };
    };


### .dn42 (Dn42)

    zone "dn42" {
        type slave;
        file "slave/dn42.zone";
        masters { 172.22.184.1; };
        allow-transfer { any; };
        forwarders { };
    };

### .ffa (Freifunk Augsburg)

    zone "ffa" in {
        type stub;
        file "stub/ffa.zone";
        masters {10.11.63.26; 10.11.10.15; 10.11.0.8; };
    };

stub/ffa.zone

    ffa.    IN    SOA   ns1.stubdns.ffa. stub.stub.stub (
                              1   ; sn = serial number
                              2d  ; ref = refresh
                              15m ; ret = update retry
                              2w  ; ex = expiry
                              3m  ; min = minimum
                              )
            IN      NS      ns1.stubdns.ffa.
            IN      NS      ns2.stubdns.ffa.
            IN      NS      ns3.stubdns.ffa.

    ns1.stubdns     A       10.11.63.26
    ns2.stubdns     A       10.11.10.15
    ns3.stubdns     A       10.11.0.8

### .ffc (Freifunk Chemnitz)

    zone "ffc" in {
        type stub;
        file "stub/ffc.zone";
        masters { 10.8.6.6; };
    };

### .ffki (Freifunk Kiel)

    zone "ffki" IN {
        type slave;
        file "slave/ffki.zone";
        masters { fda1:384a:74de:4242::66; fda1:384a:74de:4242::2; };
        allow-transfer { any; };
        forwarders { };
    };

