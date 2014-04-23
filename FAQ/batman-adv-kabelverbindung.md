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
Ein Port muss von VLAN1 in VLAN2 wechseln.
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
            option ports '0t 1 2'  


## Router A und Router B
Desweiteren muss WAN angepasst werden. Router A braucht noch einen Alias damit weiterhin der VPN-Tunnel funktioniert.

### Vorher
    config interface 'wan'  
            option ifname 'eth0.2'  
            option proto 'dhcp'  
            option type 'bridge'  
            option accept_ra '0'  
            option auto '1'  
            option macaddr '66:70:02:aa:aa:aa'  

### Nach Anpassung
    config interface 'wan'   
            option ifname 'eth0.2'  
            option proto 'batadv'  
            option type 'bridge'  
            option accept_ra '0'  
            option macaddr '66:70:02:aa:aa:aa'  
            option mesh 'bat0'  
       
    config alias  
            option interface 'wan'  
            option proto 'dhcp'  

Die Alias-Sektion wird nur in **Router A** benötigt. In **Router B** kann man Sie einfach weglassen.
