# Anycast DNS

Auf den Gateways ist das Interface `anycast-dns` mit der IPv6 `2001:67c:2d50:1::a82:7fe0/128` konfiguriert. `anycast-dns` ist ein dummy-Interface, das lediglich dazu dient dem Host die IP zuzuweisen.

Zusätzlich ist in der Routingconfig (bird6) eine statische Route über das Interface auf die IP definiert, damit die anycast Route über das IGP zwischen den Gateways und im Mesh verteilt wird.

    protocol static anycast_dns {
      route 2001:67c:2d50:1::10.130.127.224/128 via "anycast-dns";
    }

Somit kann man einen der Gateways mittels `ip link set down anycast-dns` aus dem anycast Verbund entfernen und mit `up` wieder einfügen (Vorsicht: Auf Systemen mit systemd v219 aktiviert networkd das Interface sofort wieder!).