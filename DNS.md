# DNS

Wir haben derzeit zwei DNS Server um die TLD `.ffhl` aufzulösen.

 * 10.130.14.1
 * 10.130.15.1

## BIND Konfiguration

    zone "ffhl" {
        type slave;
        file "slave/ffhl.zone";
        masters { 10.130.14.1; 10.130.15.1; };
        allow-transfer { any; };
    };
