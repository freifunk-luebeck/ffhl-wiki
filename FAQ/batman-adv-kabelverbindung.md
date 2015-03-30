# ACHTUNG – Diese Seite ist veraltet und wird demnächst überarbeitet. Bitte nicht nutzen!

# Batman-adv Ethernetverbindung

hier die Doku zur Konfiguration einer batman-adv Kabelverbindung
zwischen 2 Tp-Link WDR3600 Routern.

Router A:
 * Mesh-VPN über fastd an WAN-Port
 * LAN1 wird die batman-adv-Verbindung zu Router B
 * Die restlichen LAN-Ports bleiben normale Client-Ports

Router B:
 * WAN-Port ist mit LAN1 von Router A verbunden
 * Kein Mesh-VPN

Anpassungen sind nur in **/etc/config/network** notwendig.


## Router A: 
Ein Port muss von VLAN1 in ein neues VLAN wechseln. Hier nennen wir es VLAN3.
Wir wollen ja schließlich auf LAN1 (Port 2) auch batman-adv sprechen. 
### Vorher:
    config switch_vlan  
            option device 'eth0'  
            option vlan '1'  
            option ports '0t 2 3 4 5'  
       
    config switch_vlan  
           option device 'eth0'  
           option vlan '2'  
           option ports '0t 1'  


### Danach:
    config switch_vlan  
           option device 'eth0'  
           option vlan '1'  
           option ports '0t 3 4 5'  
      
    config switch_vlan  
            option device 'eth0'  
            option vlan '2'  
            option ports '0t 1'  

    config switch_vlan
            option device 'eth0'
            option vlan '3'
            option ports '0t 2'
  
    config interface 'mesh_lan'
            option ifname 'eth0.3'
            option mesh 'bat0'
            option proto 'batadv'

## Router B
Es wird im configmode einfach Mesh on WAN aktiviert.
