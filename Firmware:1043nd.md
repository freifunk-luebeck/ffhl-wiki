# TP-Link WR1043ND
[[/bilder/Freifunkrouter/TP-Link_1043nd_300px.JPG]]
[[höhere Auflösung|bilder/Freifunkrouter/TP-Link_1043nd.JPG]]

## Verwendungszweck
_Leider treten mit diesem Modell durch den W-Lan-Chip einige Probleme auf, weshalb wir ihn nicht mehr für Neuanschaffungen empfehlen!_

Da der USB-Port im System nutzbar ist und noch ca. 3MB Flash frei ist, ist es möglich, dass noch andere Dienste auf diesem laufen könnten. Dies muss dann allerdings vom Knotenbetreiber, der sich in OpenWRT einliest, selbst geschehen und liegt außerhalb unserer Zuständigkeit.

## Eigenschaften
* 8MB Flash
* 32MB RAM
* gleicher Prozessor wie [[TP-Link 741ND|Firmware:741nd]] & [[TP-Link 841ND|Firmware:841nd]]
* 3 Antennenanschlüsse
* 1 USB-Anschluss
* 12V-Stromanschluss
* 100mW Sendeleistung (2,4 GHz)

## Unterstützte Hardwarerevisionen:
Auf dem Typenschild der Unterseite befindet sich die Angabe der Hardwarerevision.
Von diesem Gerät ist uns nur eine Version bekannt.

* v1.x [[Link zum Image|http://metameute.de/~freifunk/firmware/0.3.2/lff-0.3.2-ar71xx-generic-tl-wr1043nd-v1-squashfs-factory.bin]]

# Firmware via TFTP flashen

## Auf dem Host

1. IP auf 192.168.0.5/24 setzen
1. Firmwaredatei `0200A8C0.lmg` nennen
1. `in.tftpd -vls .` ausführen (TFTPD im aktuellen Verzeichnis)

## Auf dem 1043nd

Die serielle Konsole verwendet 115200 baud.

1. `tpl` tippen während `Autobooting in x seconds` erscheint
1. `tftpboot`
1. `erase 0ybf020000 +0z7d0000`
1. `cp.b 0x81000000 0xbf02OO00 0x7c0000` (`0x7c0000` ist die Imagegröße und sollte von `tftpboot` angezeigt werden. Ggf. anpassen!)

## Default Environment

    bootargs=console=ttyS0,115200 root=31:02 rootfstype=jffs2 init=/sbin/init mtdparts=ar9100-nor0:128k(u-boot),1024k(kernel),4096k(rootfs),64k(art)
    bootcmd=bootm 0xbf020000
    bootdelay=1
    baudrate=15200
    ethaddr=11:22:33:44:55:66
    ipaddr=192.168.0.2
    serverip=192.168.0.5
    stdin=serial
    stdout=serial
    stderr=serial
    ethact=eth0
    
    Environment size: 317/131068 bytes
