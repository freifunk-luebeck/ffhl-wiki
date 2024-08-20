---
title: JLS Julius-Leber-Schule
---

# Dachstandort Julius-Leber-Schule

[![panorama](/jls_panorama.png)](/jls_panorama.png)



```
            N

  CPE510   EAP  CPE510

W   EAP   JLS    EAP   O

    WAP   EAP   CPE510

           S

 N: EAP225
 NO: CPE510
 O: EAP225
SO: CPE510 -> Burgtor
 S: EAP225 + UMA-D
SW: WAP60 -> Fluse 100
 W: EAP225 + UMA-D
NW: CPE510 -> Feuerwehr /  Krempelsdorfer Alle

```

| Hostname          | Modell                    | LAN IP             | Firmware                 |
| ----------------- | ------------------------- | ------------------ | ------------------------ |
| jls-eap225-n      | TP-Link EAP225-Outdoor v1 | -                  | Gluon v2022.1.1          |
| jls-eap225-o      | TP-Link EAP225-Outdoor v3 | -                  | Gluon master             |
| jls-eap225-s      | TP-Link EAP225-Outdoor v3 | -                  | Gluon master             |
| jls-eap225-w      | TP-Link EAP225-Outdoor v3 | -                  | Gluon master             |
| jls-cpe510-no     | TP-Link CPE510 v3.20      | 192.168.0.10       | OpenWrt 23.05.0          |
| jls-cpe510-so     | TP-Link CPE510 v3.20      | 192.168.0.11       | OpenWrt 23.05.0          |
| jls-cpe510-nw     | TP-Link CPE510 v3.20      | 192.168.0.12       | OpenWrt 23.05.0          |
| jls-wap60-o       | Mikrotik wAP 60Gx3 AP     | 192.168.0.13       | MikroTik RouterOS 7.11.2 |
| jls-rb260gsp      | MikroTik RB260GSP         | 192.168.0.253      | MikroTik SwOS 2.13       |
| jls-sg300-10pp    | Cisco SG300-10PP          | 192.168.0.254      |                          |


```
   -----------------------------
   |                           |
-------------------         ----------------------------
| jls-rb260gsp    |         | jls-sg300-10pp           |
| [1][2][3][4][5] |         | [1][2][3][4][5][6][7][8] |
-------------------         ----------------------------
      |  |  |                     |  |  |  |  |
      jls-cpe510-no               jls-eap225-n|
         |  |                        |  |  |  |
         jls-cpe510-so               jls-eap225-o
            |                           |  |  |
            jls-cpe510-nw               jls-eap225-s
                                           |  |
                                           jls-eap225-w
                                              |
                                              jls-wap60-o
```

## TP-Link EAP225-Outdoor

* jls-eap225-n -> TP-Link EAP225-Outdoor v1
* jls-eap225-o/s/w -> TP-Link EAP225-Outdoor **v3**

* EAP225-outdoor-v3: mit Gluon master (4606fe89cb4) + https://github.com/freifunk-gluon/gluon/pull/3033 (3fdf6f677a4b31d) geflasht
 * sollte mit nächstem Gluon Release dann auch automatisch mit drin sein

## TP-Link CPE510

* Firmware: OpenWrt 23.05.0 (stock/vanilla)
* Config:
  * ESSID: FFHL-MESH-JLS-NW / FFHL-MESH-JLS-NO / FFHL-MESH-JLS-SO
  * Kanal: 5GHz, auto outdoor mit DFS -> UCI: “channel: auto”, “channels: 96-140”, "htmode: HT40", "country: DE"
  * “mode: ap”, “wds: 1”, (“isolate: 1”)
  * LAN+Wifi bridge

## wAP 60Gx3 AP

* Hostname: jls-wap60-o
* Firmware: MikroTik RouterOS 7.11.2
* SSID: FFHL-MESH-JLS-60-O
* Frequency: auto
* Mode: ap bridge
* SSID: FFHL-MESH-JLS-60-O
* Isolate Stations: off (for now)
* IP: 192.168.0.13

{{< hint warning >}}
**Diese Rictfunkstrecke ist noch nicht eingerichtet!**
{{< /hint >}}
* connected to: Fluse100 with Mikrotik LHG 60G
  * Hostname: fluse100-lhg60-w
  * Firmware: MikroTik RouterOS 7.11.2
  * Mode: station bridge
  * SSID FFHL-MESH-JLS-60-O
  * IP: 192.168.0.23

### UCI

* /etc/config/wireless:

```
config wifi-device 'radio0'
        option type 'mac80211'
        option path 'platform/ahb/18100000.wmac'
        option channel 'auto'
        option channels '96-140'
        option band '5g'
        option htmode 'HT40'
        option country 'DE'
        option cell_density '0'

config wifi-iface 'default_radio0'
        option device 'radio0'
        option network 'lan'
        option mode 'ap'
        option ssid 'FFHL-MESH-JLS-NO'
        option encryption 'none'
        option wds '1'
[        option isolate '1']
```

* /etc/config/network:

```
config interface 'loopback'
        option device 'lo'
        option proto 'static'
        option ipaddr '127.0.0.1'
        option netmask '255.0.0.0'

config globals 'globals'
        option ula_prefix 'fd13:2a62:81e7::/48'

config device
        option name 'br-lan'
        option type 'bridge'
        list ports 'eth0'

config interface 'lan'
        option device 'br-lan'
        option proto 'static'
        option ipaddr '192.168.1.1'
        option netmask '255.255.255.0'
        option ip6assign '60'
```

```
# change:
uci set system.@system[0].hostname='jls-cpe510-no'
uci commit system

# change:
uci set network.lan.ipaddr='192.168.0.10'
uci commit network

uci set wireless.radio0.channel='auto'
uci set wireless.radio0.channels='96-140'
uci set wireless.radio0.htmode='HT40'
uci set wireless.radio0.country='DE'
uci set wireless.radio0.disabled='0'
uci set wireless.default_radio0.country='DE'
# change:
uci set wireless.default_radio0.ssid='FFHL-MESH-JLS-NO'
uci set wireless.default_radio0.wds='1'
#uci set wireless.default_radio0.isolate='1'
uci commit wireless

uci set dhcp.lan.ignore='1'
uci commit dhcp

uci set uhttpd.main.listen_http='127.0.0.1:80'
uci set uhttpd.main.listen_https='127.0.0.1:443'
uci commit uhttpd

cat <<EOF > /etc/dropbear/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCmb+l54Y5QMUGJCGu0zrigfFgMU9I5Feu55b2+wPYUR8Uuz11GCbmkmive7Avj8/UWfXTOnBuEBp3o6t9VcbIHa1Dt+cU3z+BxoFyge40fQVJ2GOAmprMQIuxBsw5+1REBBJrsmYXfabWisCh8Q213DyUeAjMwYIBtH+3M3NNA0S0oNB/x4S+N7bSxHrhb06PUpG51aOWvAWjhOc+us4NRwF63dGeIKGBED3On41WoDqH875sv4myP4T8s8XXpOiAM1xubLuNLzKa/uqy1IcSLakXQUOaRnKcgkSPS9VuZzOxrpUSUn34ryXTq9rEUNGMpteOpfhT+xQv0zh+ECng6NLEmDuCRJojh26cJLAqfj5IAhpDx4FYLIQIzZIBubOsfavyew4lbKwpBE1HfPXsimxrHWmYX+zSLxUFQki9ixM9+RAYe61CeDZS/iAcP5t8ojsVUtATRd2QpBBOjv55JFFln9jk9il7zjVn9NJSU5sphc6v19Kj8tYKGzJDxM2n5FWwkP19UdOvTaIMt8c904KCkKUXqCyox+2TJGonNyiZh+5wxnKACRSBSJMxD2LZywoX1BeZPz/H6+cLP30keZ8lmvAbHCArNcc896EECFM7kRL3r4kwxVn+X21NzNAnvHTeuKB6m8RCm9rOLwUb3EXs1MlMKBCv6q/JcimSGCQ==
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFNacZ7VZHJeVMowN9f/Gx6qWwy9tlFp+It3gB7hyJk1/eG0Y8TbcgQQfTdRktZu0BTecfs+e8Wuc/nTIJWbsZwpi8jGBQLMy48fKlaxUawUgri3KPwnhI9Np9vqHoezYJRD3V+sjvLOFE30y30Bh0kjMkM1zvGZeyAGLePwlanvLvJWAqIip2zMSKy3ygQEOCAU2Z2ULh16hQO9IfKE4XUxOAnMnLebMyE6CzHcjqEBbHfq4TENoqz9IpC7zThWdhQs39ACvYpLyvTgPTQzWPgmNmP3mTX0n4wwD7ri9xlR/R61tZjww2boHLPO5LoO6L90Lf0qIV1PAEK56lXUI7 yksflip@yksflip
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDQaNPo8cjFy3lYAaOwptCnpl6HfFaksl2riTeeRKcyvsEyuv04HqosPc8NRpY5uwIcNT2s/IgTes3ayzlMokKMML1y06A2U5rKXrBmT0IbZKWnu7lLkT+D89SGl/Ra5zNK0xG18J08HgcEJrRqhKUo9DFxOJZxCCF67349UI/1K9V/qjpqyLsZUYuuQwLh/r4t0oymjaqZ9AtQvEjv9cOsKDDR/hRNHn+Ycdiqa3PPGISGZprOuj9lc1strYMsTJ3u/RGFvobCxEcZy3rpRGwaJZLZ4S9TuRYLepH5E9oDV998SteL4uI7CXD+xtKa46osMk/v/hu6iZSiPe1BOlTsYvjWvQ8f6O7foCBj+mek+4qC65WXSEuuNB8VGC0dmf5TvI/hyb1cr3UpiPhhOBkTFHyhA3YCHzH1+Argg8ZFRViCcjof2qi9fhy9F0c3/S3BnC74AcemqUyVlR/lHs9oDL/TuvrxzoQjNW4FKLFmQl1K/Zc7yDnKYKh4cvGPPuVVHZpbqS+Xf0d+syLNFbuZyc6HjXGgyk3a7LWa7Pbv1VBR/oopDuiuvNIZ3jAZJbv3pUj4aNKLaSleT2ayfFKxPA+BZjjz+Sxi122SkmdF8t4gvmaDlvG3WtOHgE1HKklbcksLezrNrRBVlFaxn3Ht1iwGCN/6ihb4sLLeL1BGfw== lptp
EOF
uci set dropbear.@dropbear[0].PasswordAuth='off'
uci commit dropbear
```


## MikroTik RB260GSP - passiv 24V PoE Switch

* Port 1 -> jls-sg300-10pp (no PoE)
* Port 2 -> jls-cpe510-no, PoE: on
* Port 3 -> jls-cpe510-so, PoE: on
* Port 4 -> jls-cpe510-nw, PoE: on
* Port 5 -> -, PoE: off

## Cisco SG300-10PP - aktiv 54V PoE Switch

* Port 1 -> jls-rb260gsp
* Port 2 -> jls-eap225-n
* Port 3 -> jls-eap225-o
* Port 4 -> jls-eap225-s
* Port 5 -> jls-eap225-w
* Port 6 -> jls-wap60-o

## Optimierungen mit VLANs

* Vermeiden, dass Daten über Dachstandorte über JLS gebridget werden,
  statt per batman-adv geroutet/gemesht zu werden
* Vorteile: bessere Skalierung mit batman-adv, da kleinere
  Nachbarschaften
* Verhindert Loops im WLAN-Backbone
* mehr reale Links auf der Karte

```
   -----------------------------
   |                           |
-------------------         ----------------------------
| jls-rb260gsp    |         | jls-sg300-10pp           |
| [1][2][3][4][5] |         | [1][2][3][4][5][6][7][8] |
-------------------         ----------------------------
      |  |  |                     |  |  |  |  |  |  |
      jls-cpe510-no [VLAN12,      jls-eap225-n|  |  | < [VLAN2, untagged]
         |  |        untagged]       |  |  |  |  |  |
         jls-cpe510-so [VLAN13,      jls-eap225-o|  |    < [VLAN2, untagged]
            |           untagged]       |  |  |  |  |
            jls-cpe510-nw [LAN14,       jls-eap225-s|       < [VLAN2, untagged]
                           untagged        |  |  |  |
                                           jls-eap225-w        < [VLAN2, untagged]
                                              |  |  |
                                              jls-wap60-o         < [VLAN6, untagged]
                                                 |  | < [integ. eth: VLAN2/3/4/5/12/13/14, tagged]
                                                 ---Pi-4
                                                 ^
                                                [USB eth: VLAN6, untagged]
```

* Neu/Ergänzung: Pi4
  * Hostname: jls-pi4
  * Firmware: Gluon
  * 2x Gigabit Ethernet: 1x integriert, 1x per USB-Ethernet dongle
  * übersetzt nicht-Gluon Geräte, wie die CPE510s und den WAP60 auf Gluon/Mesh
* VLANs auf den PoE switches konfigurieren, sowie auf dem Pi4 im Gluon

* CPE510s / WAP60:
  * client isolation auf dem WLAN AP interface an ->
    meshing/routing über jls-pi4 erzwingen

Neue Pi4 /etc/config/gluon:

```
config core 'core'
        option domain 'default'

config interface 'iface_single'
        option name '/single'
        list role 'uplink'

config interface 'iface_vlan2'
        option name 'eth0.2'
        list role 'mesh'

config interface 'iface_vlan6'
        option name 'eth0.6'
        list role 'mesh'

config interface 'iface_vlan12'
        option name 'eth0.12'
        list role 'mesh'

config interface 'iface_vlan13'
        option name 'eth0.13'
        list role 'mesh'

config interface 'iface_vlan14'
        option name 'eth0.14'
        list role 'mesh'

config wireless 'wireless'
        option outdoor '0'
        option preserve_channels '0'

config mesh_vpn 'mesh_vpn'
        option enabled '0'
        option limit_ingress '3000'
        option limit_enabled '0'
        option limit_egress '200'
```
