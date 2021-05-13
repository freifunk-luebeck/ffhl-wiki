# gallifrey-gluon01

`gallifrey-gluon01` ist eine gluon VM auf dem dem Server `gallifrey`. Er macht den uplink ins
Freifunk für [srv02]({{< relref "srv02" >}}).


## respondd ebtables rule

Damit srv02 respondd requests rausschicken kann, die nicht von gluon geblockt werden, ist diese rule
nötig.


{{< hint warning >}}
**Achtung!**

Die rule ist nicht reboot persistent und muss nach einem neustart wieder hinzugefügt werden.
Siehe [hier](https://github.com/freifunk-gluon/gluon/pull/2103)
{{< /hint >}}


`/lib/gluon/ebtables/110-mcast-allow-respondd`:

```
rule 'MULTICAST_OUT -p IPv6 --ip6-protocol udp --ip6-destination-port 1001 --ip6-dst ff02::2:1001 -j RETURN'
rule 'MULTICAST_OUT -p IPv6 --ip6-protocol udp --ip6-destination-port 1001 --ip6-dst ff05::2:1001 -j RETURN'
```

## Erstellen

### Auf Host:

```
$ virt-install -r $RAM -n $NAME -f /dev/vg_data/$NAME.img --network bridge=vms --graphics none --console pty,target_type=serial --extra-args 'console=ttyS0,115200n8 serial' --os-type linux --os-variant debian9 -l http://ftp.de.debian.org/debian/dists/stable/main/installer-amd64/
```

```
$ cd /var/lib/libvirt/images
$ wget "https://firmware.luebeck.freifunk.net/0.12.0-1/factory/gluon-ffhl-0.12.0-1-x86-64.img.gz" -O - | gunzip -c > ffhl-gluon01.img
$ virsh pool-refresh default
$ virt-install --ram 256 -n ffhl-gluon01 --os-type=linux --disk vol=default/ffhl-gluon01.img --network bridge=ffhl --network bridge=vms --graphics none --import
```


### In der VM Konsole:

```
$ vim /etc/dropbear/authorized_keys
```
-> ssh public keys hinzufügen

```
$ uci set system.@system[0].hostname="gallifrey-gluon01"
$ uci set fastd.mesh_vpn.enabled='1'
$ uci set gluon-setup-mode.@setup_mode[0].configured='1'

# IP Adressen für VM hier reservieren:
# -> https://wiki.chaotikum.org/ag:infrastruktur:chaotikum:gallifrey

$ uci set network.wan.proto='static'
$ uci set network.wan.ipaddr='192.168.1.22'
$ uci set network.wan.netmask='255.255.255.0'
$ uci set network.wan.gateway='192.168.1.2'

$ uci set network.wan6.proto='static'
$ uci set network.wan6.ip6addr='2a01:4f8:160:3067::16/64'
$ uci set network.wan6.ip6gw='2a01:4f8:160:3067::2'

# Digitalcourage DNS Server:
$ uci add_list gluon-wan-dnsmasq.@static[0].server='46.182.19.48'

$ uci commit
$ sync
$ reboot

# Dann fastd public key holen und im key repository hinzufügen
# vom Laptop z.B. per SSH holen:
$ ssh root@2a01:4f8:160:3067::16 /etc/init.d/fastd show_key mesh_vpn
```

