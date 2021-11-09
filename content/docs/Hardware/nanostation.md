# Nanostation

https://openwrt.org/toh/ubiquiti/

Flashen
========

per Webinterface
----------------

set static ip to 192.168.1.21/24  
conntect webinterface via 192.168.1.20

downgrade to  
XW.v6.0.6-beta.30875.170526.0023  
XW.v5.6.15.  

flash freifunk firmware  


via tftp
---------

sudo ip a add 192.168.1.254/24 dev eth0
cp  openwrt-ar71xx-generic-ubnt-nano-m-squashfs-factory.bin code.bin
echo -e "binary\nrexmt 1\ntimeout 60\ntrace\nput code.bin flash_update\n" | tftp 192.168.1.20
