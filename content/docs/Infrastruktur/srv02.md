---
title: srv02
---

# srv02

VM auf chaotikums `magrathea` [s.h. chaotikum wiki](https://wiki.chaotikum.org/infrastruktur:server:magrathea)

| Server    | IPs                              | Services          | domain             | Port | Pfad                                                        |
| --------- | -------------------------------- | ----------------- | ------------------ | ---- | ----------------------------------------------------------- |
| **srv02** | 10.130.0.10/20, 176.9.147.120/32 |                   |                    |      |                                                             |
|           | 2a01:4f8:160:3067::4             | grafana           | monitor.           | 3000 |                                                             |
|           |                                  | prometheus        |                    | 9090 |                                                             |
|           |                                  | map               | map.               |      | /var/www/hopglass                                           |
|           |                                  | hopglass server   |                    | 4000 | ~hopglass/hopglass-server                                   |
|           |                                  | packages opkg     | firmware.          |      | /var/www/firmware                                           |
|           |                                  | firmware-selector | firmware.\*/wizard |      | /var/www/firmware-selector                                  |
|           |                                  | gitea             | git.               | 3001 | /home/git                                                   |
|           |                                  | fastd-keys        |                    |      | https://git.luebeck.freifunk.net/FreifunkLuebeck/fastd-keys |
|           |                                  | website           |                    |      | /var/www/luebeck.freifunk.net                               |
|           |                                  | pdns, dnsdist     |                    | 53   | /var/lib/powerdns/zones                                     |
|           |                                  | requstd           |                    |      |                                                             |
