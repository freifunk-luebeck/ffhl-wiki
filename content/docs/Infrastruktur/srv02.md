# srv02

VM in chaotikums `case` server [s.h.](https://wiki.chaotikum.org/hackerspace:netz:hosts:case)

## Migration srv01 -> srv02

| Server    | IPs                     | Services             | domain                    | Port | Pfad                               |
|-----------|-------------------------|----------------------|---------------------------|------|------------------------------------|
| **srv01** | 176.9.147.120/32        |                      |                           |      |                                    |
|           | 2a01:4f8:160:3067::3/64 | website              | .                         |      |                                    |
|           |                         | firmware autoupdater | */firmware                |      | /var/lib/ffhl-firmware/autoupdater |
|           | 10.130.0.9/20           | packages opkg        | opkg.services.            |      | /var/lib/ffhl-firmware/opkg        |
|           | 2001:67c:2d50::9/64     | fastd-keys           | git@ffhl-srv01:fastd-keys |      |                                    |
|           |                         | map                  | map.                      |      |                                    |
|           |                         | ...?                 |                           |      |                                    |
| **srv02** | 10.130.0.10/20          |                      |                           |      |                                    |
|           | 2a01:4f8:160:3067::4    | grafana              | monitor.                  | 3000 |                                    |
|           |                         | prometheus           |                           | 9090 |                                    |
|           |                         | map2                 | map2.                     |      |                                    |
|           |                         | packages opkg        | firmware.                 |      | /var/www/firmware                  |
|           |                         | firmware-selector    | firmware.*/wizard         |      | /var/www/firmware-selector         |
|           |                         | gitea                | git.                      | 3001 | /home/git                          |


Nach und nach Services umziehen, mit nginx auf srv01 als reverse-proxy überbrücken
und abschließend die ipv4 srv02 geben.
