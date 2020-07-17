# srv02

VM in chaotikums `gallifrey` server [s.h. chaotikum wiki](https://wiki.chaotikum.org/ag:infrastruktur:chaotikum:gallifrey)

## Migration srv01 -> srv02

| Server    | IPs                              | Services               | domain            | Port | Pfad                                                                |
|-----------|----------------------------------|------------------------|-------------------|------|---------------------------------------------------------------------|
| **srv01** | 10.130.0.9/20                    |                        |                   |      |                                                                     |
|           |                                  | fastd für srv02        |                   |      | `srv01:freifunk <=> srv02:enp7s0`                                   |
| **srv02** | 10.130.0.10/20, 176.9.147.120/32 |                        |                   |      |                                                                     |
|           | 2a01:4f8:160:3067::4             | grafana                | monitor.          | 3000 |                                                                     |
|           |                                  | prometheus             |                   | 9090 |                                                                     |
|           |                                  | map                    | map.              |      | /var/www/hopglass                                                   |
|           |                                  | hopglass server        |                   | 4000 | ~hopglass/hopglass-server                                           |
|           |                                  | packages opkg          | firmware.         |      | /var/www/firmware                                                   |
|           |                                  | firmware-selector      | firmware.*/wizard |      | /var/www/firmware-selector                                          |
|           |                                  | gitea                  | git.              | 3001 | /home/git                                                           |
|           |                                  | fastd-keys             |                   |      | [repo](https://git.luebeck.freifunk.net/FreifunkLuebeck/fastd-keys) |
|           |                                  | website                |                   |      | /var/www/luebeck.freifunk.net                                       |
|           |                                  | authoritive DNS (pdns) |                   | 53   | /var/lib/powerdns/zones                                             |

- [x] ~~Nach und nach Services umziehen, mit nginx auf srv01 als reverse-proxy überbrücken und abschließend die ipv4 srv02 geben.~~ Done (Jul. 2020)
- [ ] srv02 ans neue (batadv15) Netz anbinden.


## srv01
`srv01` macht im Moment nichts, außer eine fastd Verbindung ins Mesh für `srv02`. Interessant wäre es, srv01 durch ein gluon vm auszutauschen.
