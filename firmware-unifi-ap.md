Die Unify AP Geräte gibt es als indoor und outdoor Varianten - beide leider mit unterschiedlichen Firmwares.
Die outdoor Geräte beschreibe bitte jemand, der sie hat.

#Indoor Produktpalette

* Aktuell bekannte unterstützte Geräte
 * AP
 * AP long range
* Noch etwas teurere aber auch leistungsfährigere Geräte

Es wäre für den Lübecker Freifunk sehr interessant, die leistungsfähigeren Geräte kennenzulernen.  

#Installation

Für das erste Flashen kann leider nicht auf den von Ubiquity bereitgestellten Konfigurator zurückgegriffen werden.
Auch hat das Gerät keinen eigenen Webserver, auf den zugegriffen werden könnte - wenigstens keinen initial aktivierten.
Es muss über SSH auf das Gerät zugegriffen werden und von dort wir dauch das Firmware update initiiert.

Das Gerät meldet sich initial mit der IP Adresse 192.168.1.20, holt sich aber über einen DHCP Server auch eine eigene Adresse, wie im Beispiel geschehen. Zur Vorbereitung muss beispielsweise mit WinSCP die factory Firmware in das Verzeichnis /tmp des Geräts gespielt werden. Mit putty oder die cygin shell kann dann auf das Gerät wie unten beschrieben zugegriffen werden:

```
$ ssh ubnt@192.168.178.96
The authenticity of host '192.168.178.96 (192.168.178.96)' can't be established.
RSA key fingerprint is 97:cc:cc:72:35:f9:f0:02:0c:6b:33:3d:1d:46:b7:20.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '192.168.178.96' (RSA) to the list of known hosts.
ubnt@192.168.178.96's password:


BusyBox v1.11.2 (2013-06-28 16:11:52 PDT) built-in shell (ash)
Enter 'help' for a list of built-in commands.

BZ.v2.4.5# cd /tmp
BZ.v2.4.5# find
gluon-ffhl-0.4-ubiquiti-unifi.bin  sysinit.txt
rc.txt                             system.cfg
setmgmt.cfg
BZ.v2.4.5# fwupdate.real -m gluon-ffhl-0.4-ubiquiti-unifi.bin
Writing 'kernel         ' to /dev/mtd2(kernel         ) ...  [%100]
Writing 'rootfs         ' to /dev/mtd3(rootfs         ) ...  [%100]
Done
```

Das Gerät rebootet und kann über 192.168.1.1 regulär im Konfigurationsmodus gefunden werden.


#See also
http://wiki.openwrt.org/toh/ubiquiti/unifi