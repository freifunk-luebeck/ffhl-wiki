# Automatischer Wechsel zwischen batman-adv und VPN auf dem WAN Port

## Problemstellung

Bisher (0.3.2.1) verwenden Knoten den WAN Port lediglich um mittels fastd eine VPN Verbindung zu den Gateways aufzubauen. Das funktioniert gut, wenn nur ein einzelner Knoten aufgestellt wird. Anderen Knoten können nur per WLAN Mesh erreicht werden.

Für zukünftige Installationen planen wir, mehrere Knoten an einen Standort aufzustellen. Dabei soll auch ein Mesh über Ethernet möglich sein. Beispiel: Bullet M2 als Outdoor Meshknoten und ein TP-Link im Gebäude.


## Lösungsansatz 1: batman-adv und fastd auf dem WAN Port

Eine mögliche Lösung das Problems wäre gleichzeitig batman-adv und fastd auf dem WAN Port zu aktivieren. Diese Lösung würden wir jedoch gerne vermeiden, da so der gesamte batman-adv Traffic in das private Netz des Betreibers gelangt und von dort wahrscheinlich sogar über dessen WLAN verteilt wird. Das ist nicht sinnvoll.

## Lösungsansatz 2: batman-adv auf WAN Port gezielt aktivieren

Eine alternative Lösung wäre es batman-adv auf dem WAN Port gezielt zu aktivieren. Bisher ist das Problemlos per SSH möglich. Es lässt sich jedoch auch wie folgt automatisieren:

**Annahme 1**: Im privaten Netz des Betreibers gibt es einen DHCP Server, der dem Knoten eine IP gibt.
**Annahme 2**: `br-wan` enthält nur den WAN Port und keine WLANs.

Unter diesen beiden Annahmen wäre es möglich, batman-adv auf dem WAN Port genau dann zu aktivieren, wenn der Knoten keine DHCP Lease erhält. Dabei wird es das erste Mal aktiviert nachdem erfolglos versucht wurde eine Lease zu erhalten. Der Knoten wird jedoch weiterhin versuchen eine Lease zu bekommen und bei Erfolg batman-adv auf dem WAN Port sofort deaktivieren. Läuft die Lease aus ohne das es möglich war eine neue zu erhalten, wird batman-adv wieder aktiviert.

Dieses Verhalten lässt sich mit einem kurzen Skript, das nach `/etc/udhcpc.user` kopiert wird, erreichen:

    #!/bin/sh

    my_interface=wan

    . /usr/share/libubox/jshn.sh

    json_load "$(ubus call network.interface.${my_interface} status)"
    json_get_var my_device device

    test "$interface" == "$my_device" || exit 0

    case "$1" in                        
            deconfig)
                    batctl if add $interface
            ;;                       
            renew|bound)             
                    batctl if del $interface
            ;;                       
    esac

## Weiterführende Ideen

In einem solchen Setup wäre es wünschenswert einen (oder mehrere) Knoten als VPN Uplink zu verwenden. In diesem Fall sollte es möglich sein weitere Knoten an die LAN Ports anzuschließen und diese Ports automatisiert auf batman-adv umzuschalten.