# Skripte

## Knotenanzahl FFAPI-Updater

**Bedingungen:**

* batman-adv, alfred, batadv-vis, sed, grep

Initial muss eine ffapi-Datei angelegt werden, zum Beispiel so: https://git.metameute.de/ffhl/startseite/tree/ffapi.json. Wichtig ist, dass die Sektion "state" vorhanden ist.

Danach kann man folgendes Skript zum Aktualisieren der Knotenanzahl in /etc/cron.hourly/ffapi-update-nodes ausführbar (chmod +x) hinterlegen:

[[ffapi-update-nodes|Netzwerk:Skripte:ffapi-update-nodes]]

## Generisches Freifunk-Knoten Skript

**Bedingungen:**

* ip, iw, macchanger, brctl, hostapd, dhclient, insmod, modprobe, dmesg, tail, sed, killall, sleep

[[start-ff.sh|Netzwerk:Skripte:start-ff.sh]]

## DHCP-Server Prüfer für batman-adv gateways

**Bedingungen:**

* etables, awk, pkill, dhclient, grep

[[dhcp-check.sh|Netzwerk:Skripte:dhcp-check.sh]]

## VPN-Gateway Prüfer

...
