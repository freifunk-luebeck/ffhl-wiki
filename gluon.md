Die Informationen auf dieser Seite sind zum Teil veraltet!

## Aktueller Entwicklungsstand

Gluon ist nun offiziell released (März/April, 2014) und alle Freifunker werden gebeten, die Firmware entsprechend zu aktualisieren. Die Entwickler Nils, Matthias und Linus signieren die jeweiligen stabilen Images und stellen sie für automatische Updates in einem separaten stable Repository bereit. Für den Download siehe
http://luebeck.freifunk.net/firmware/stable.

## Selber kochen statt Konserve

Jeder möge bitte damit mit dem Quellcode der Images experimentieren und Fehler melden oder Verbesserungen vornehmen. Diese vielen "Eyeballs" sind ein wesentliches Element der Open Source Kultur. Bei einem
geplanten längerfristigen Einsatz bedenke man bitte, dass bei selbst gebauten Images die automatischen Updates nicht vorgenommen werden.
Die Schritte zu Installation sind die folgenden, insbesondere auch erklaert im README des source
code repositories auf https://github.com/freifunk-gluon/gluon :

  git clone https://github.com/freifunk-gluon/gluon.git        # Get the frameworking gluon developments in
  cd gluon
  git clone git://github.com/freifunk-gluon/site-ffhl.git site # Get the Freifunk Lübeck site repository - or use your own!
  make update                                                  # Get other repositories used by Gluon
  make                                                         # Build Gluon

Ausserhalb Luebecks wird man sich nicht site-ffhl direct clonen sondern erst einen Fork in github anlegen und diesen entsprechend der eigenen Infrastruktur (gateways, ssid, etc.) anpassen.

Es folgt das das Protokoll auf virtuellen Maschine mit 64bit Debian Linux. Eingegeben wird nur
der Teil hinter dem "$" Dollar Zeichen, dem Prompt. Direkt davor steht das aktuelle Verzeichnis,
vor dem Doppelpunkt der Rechnername, und wie bei einer email dann auch der Nutzername vor dem
"@" Klammeraffen (at-sign).

<code>
user@vm-moeller-debian:~/freifunk-source$ git clone https://github.com/freifunk-gluon/gluon.git  
 Klone nach 'gluon'...  
 remote: Counting objects: 535, done.  
 remote: Compressing objects: 100% (242/242), done.  
 remote: Total 535 (delta 305), reused 507 (delta 277)  
 Empfange Objekte: 100% (535/535), 257.38 KiB | 163.00 KiB/s, done.  
 Löse Unterschiede auf: 100% (305/305), done.  
 Prüfe Konnektivität... Fertig  
 </code>  
 user@vm-moeller-debian:~/freifunk-source$ cd gluon   
 user@vm-moeller-debian:~/freifunk-source/gluon$ git clone git://github.com/freifunk-gluon/site-ffhl.git site   
 <code>  
 Klone nach 'site'...  
 remote: Reusing existing pack: 109, done.  
 remote: Counting objects: 6, done.  
 remote: Compressing objects: 100% (6/6), done.  
 remote: Total 115 (delta 2), reused 4 (delta 0)  
 Empfange Objekte: 100% (115/115), 13.24 KiB | 0 bytes/s, done.  
 Löse Unterschiede auf: 100% (46/46), done.  
 Prüfe Konnektivität... Fertig  
 </code>
 user@vm-moeller-debian:~/freifunk-source/gluon$ make update  
 <code>
 /home/user/freifunk-source/gluon/scripts/update.sh /home/user/freifunk-source/gluon  
 Initialized empty Git repository in /home/user/freifunk-source/gluon/openwrt/.git/  
 remote: Counting objects: 10150, done.  
 remote: Compressing objects: 100% (5842/5842), done.  
 remote: Total 10150 (delta 3658), reused 10125 (delta 3643)  
 Receiving objects: 100% (10150/10150), 11.27 MiB | 2.85 MiB/s, done.  
 Resolving deltas: 100% (3658/3658), done.  
 From git://nbd.name/attitude_adjustment  
   \* branch            HEAD       -> FETCH_HEAD  
 Switched to a new branch 'base'  
 Initialized empty Git repository in /home/user/freifunk-source/gluon/packages/openwrt/.git/  
 remote: Counting objects: 5134, done.  
 remote: Compressing objects: 100% (3920/3920), done.  
 remote: Total 5134 (delta 533), reused 5125 (delta 529)  
 Receiving objects: 100% (5134/5134), 4.33 MiB | 2.83 MiB/s, done.  
 Resolving deltas: 100% (533/533), done.  
 From git://nbd.name/packages_12.09  
   \* branch            HEAD       -> FETCH_HEAD 
 Switched to a new branch 'base'  
 Initialized empty Git repository in /home/user/freifunk-source/gluon/packages/mac80211/.git/  
 remote: Counting objects: 339, done.  
 remote: Compressing objects: 100% (259/259), done.  
 remote: Total 339 (delta 149), reused 229 (delta 74)  
 Receiving objects: 100% (339/339), 400.43 KiB | 0 bytes/s, done.  
 Resolving deltas: 100% (149/149), done.  
 From git://nbd.name/aa-mac80211  
   \* branch            HEAD       > FETCH_HEAD  
 Switched to a new branch 'base'  
 Initialized empty Git repository in /home/user/freifunk-source/gluon/packages/gluon/.git/   
 remote: Reusing existing pack: 1755, done.   
 remote: Counting objects: 171, done.  
 remote: Compressing objects: 100% (101/101), done.  
 remote: Total 1926 (delta 40), reused 145 (delta 14)  
 Receiving objects: 100% (1926/1926), 203.15 KiB | 98.00 KiB/s, done.  
 Resolving deltas: 100% (401/401), done.  
 From git://github.com/freifunk-gluon/packages  
   \* branch            HEAD       -> FETCH_HEAD  
 Switched to a new branch 'base'  
 Initialized empty Git repository in /home/user/freifunk-source/gluon/packages/routing/.git/  
 remote: Counting objects: 2260, done.  
 remote: Compressing objects: 100% (1374/1374), done.  
 remote: Total 2260 (delta 679), reused 2260 (delta 679)  
 Receiving objects: 100% (2260/2260), 733.77 KiB | 299.00 KiB/s, done.  
 Resolving deltas: 100% (679/679), done.  
 From git://github.com/openwrt-routing/packages  
   \* branch            HEAD       -> FETCH_HEAD  
 Switched to a new branch 'base'  
 Initialized empty Git repository in /home/user/freifunk-source/gluon/packages/luci/.git/  
 remote: Counting objects: 63107, done.  
 remote: Compressing objects: 100% (17380/17380), done.  
 remote: Total 63107 (delta 38482), reused 62587 (delta 38126)  
 Receiving objects: 100% (63107/63107), 13.24 MiB | 2.14 MiB/s, done.  
 Resolving deltas: 100% (38482/38482), done.  
 From git://github.com/freifunk-gluon/luci  
   \* branch            HEAD       -> FETCH_HEAD  
 Switched to a new branch 'base'  
 /home/user/freifunk-source/gluon/scripts/patch.sh /home/user/freifunk-source/gluon  
 Switched to a new branch 'patching'  
 Applying: Make Unifi images flashable  
 Applying: Update netifd from Barrier Breaker  
 Applying: Update odhcp6c to latest git master  
 Applying: package/base-files: change sysctl handling  
 Applying: Fix ping6 sender address  
 Applying: Remove hostapd and mac80211 packages  
 Switched to a new branch 'patching'  
 Applying: radvd: update to 1.9.8 and add patch to fix race condition  
 Applying: haveged: start directly after the root partition has been mounted  
 Switched to a new branch 'patching'  
 Switched to a new branch 'patching'  
 Switched to a new branch 'patching'  
 Switched to a new branch 'patching'  
 </code>  
 
Der Speicherplatzbedarf ist nicht zu unterschaetzen. Bislang haben wir nur den Quellcode besorgt und noch nichts damit gemacht. Und dennoch, werden schlappe 164MB belegt.

<code>
user@vm-moeller-debian:~/freifunk-source/gluon$  du -sh .  
164M    .                                      
</code>

Nun wird der Compiliervorgang angestartet mit 'make'. Beim ersten mal dauert das noch recht lange, da nicht nur kompiliert wird, sondern zunaechst
auch noch die Kompilier-Werkzeuge erstellt werden muessen. Der Linux Kernel fuer den meist in den Routern befindlichen MIPS Kernel und dessen Umfeld werden auf diese Weise von einer anderen Platform kompiliert, dem Rechner zu Hause.

Es lohnt sich, mehrere CPU Kerne fuer die Kompilation einzusetzen. Das gilt auch schon bei Verfuegbarkeit nur eines Kerns, da so der Quellcode von der Festplatte geladen werden kann, wenn die CPU arbeitet und andersherum. Beim ersten Versuch moechte ich davon jedoch abraten, sicher ist sicher. Dann aufrufen mit "make -j5" oder -j6 bei vier Kernen. 


user@vm-moeller-debian:~/freifunk-source/gluon$ make  
<code>
 make[1] prepare                                                                                                                              
 make[2] feeds                                                                                                                                
 make[2] config                                                                                                                               
 make[3] defconfig                                                                                                                            
 make[2] toolchain                                                                                                                            
 make[2] toolchain                                                                                                                            
 make[3] tools/install                                                                                                                        
 make[4] target/prereq                                                                                                                        
 make[5] -C target/linux prereq                                                                                                               
 make[4] -C tools/m4 compile                                                                                                                  
 make[4] -C tools/m4 install                                                                                                                  
 make[4] -C tools/sed compile                                                                                                                 
 make[4] -C tools/sed install                                                                                                                 
 make[4] -C tools/libtool compile  
 make[4] -C tools/libtool install  
 make[4] -C tools/autoconf compile  
 make[4] -C tools/autoconf install  
 make[4] -C tools/pkg-config compile  
 make[4] -C tools/pkg-config install  
 make[4] -C tools/xz compile  
 make[4] -C tools/xz install  
 make[4] -C tools/automake compile  
 make[4] -C tools/automake install  
 make[4] -C tools/gmp compile  
 make[4] -C tools/gmp install  
 make[4] -C tools/mpfr compile  
 make[4] -C tools/mpfr install  
 make[4] -C tools/mpc compile  
 make[4] -C tools/mpc install  
 make[4] -C tools/libelf compile  
 make[4] -C tools/libelf install  
 make[4] -C tools/flex compile  
 make[4] -C tools/flex install  
 make[4] -C tools/bison compile  
 .....   
 make[4] -C tools/b43-tools compile  
 make[4] -C tools/b43-tools install  
 make[3] toolchain/install  
 make[4] -C toolchain/gdb prepare  
 make[4] -C toolchain/gdb compile  
 .....   
 make[4] -C toolchain/uClibc/utils compile  
 make[4] -C toolchain/uClibc/utils install  
 make[2] kernel  
 make[2] packages  
 make[3] package/cleanup  
 make[3] package/compile  
 make[4] -C package/toolchain compile  
 make[4] -C package/libnl-tiny compile  
 make[4] -C package/libjson-c compile  
 make[4] -C package/lua compile  
 make[4] -C package/libubox compile   
 make[4] -C package/ubus compile  
 make[4] -C package/uci compile  
 .....   
 make[4] -C package/lua host-compile  
 make[4] -C package/px5g compile  
 make[4] -C package/uhttpd compile  
 make[4] -C /home/user/freifunk-source/gluon/packages/luci/contrib/package/luci compile  
 make[4] -C /home/user/freifunk-source/gluon/packages/gluon/gluon/gluon-config-mode compile  
 make[4] -C /home/user/freifunk-source/gluon/packages/gluon/gluon/gluon-ebtables compile  
 make[4] -C /home/user/freifunk-source/gluon/packages/gluon/gluon/gluon-ebtables-filter-multicast compile  
 make[4] -C /home/user/freifunk-source/gluon/packages/gluon/gluon/gluon-ebtables-filter-ra-dhcp compile  
 make[4] -C /home/user/freifunk-source/gluon/packages/gluon/gluon/gluon-luci-admin compile  
 make[4] -C /home/user/freifunk-source/gluon/packages/gluon/gluon/gluon-luci-autoupdater compile  
 make[4] -C /home/user/freifunk-source/gluon/packages/routing/batman-adv compile  
 make[4] -C /home/user/freifunk-source/gluon/packages/gluon/gluon/gluon-mesh-batman-adv compile  
 make[4] -C /home/user/freifunk-source/gluon/packages/gluon/gluon/gluon-mesh-vpn-fastd compile  
 make[4] -C /home/user/freifunk-source/gluon/packages/gluon/gluon/gluon-next-node compile  
 make[4] -C /home/user/freifunk-source/gluon/packages/openwrt/libs/libdaemon compile  
 make[4] -C /home/user/freifunk-source/gluon/packages/openwrt/ipv6/radvd compile  
 make[4] -C /home/user/freifunk-source/gluon/packages/gluon/gluon/gluon-radvd compile  
 make[4] -C /home/user/freifunk-source/gluon/packages/mac80211/hostapd compile  
 make[4] -C package/iw compile  
 make[4] -C /home/user/freifunk-source/gluon/packages/mac80211/mac80211 compile  
 .....   
 make[4] -C package/uboot-ar71xx compile  
 make[4] -C package/zlib compile  
 make[4] -C package/uboot-envtools compile  
 make[3] package/index  
 make[2] prepare-image  
 make[3] -C target/linux/ar71xx/image prepare  
 make[1] images  
 make[2] image/TLWR740  
 make[2] image/TLWR741  
 make[2] image/TLWR841  
 make[2] image/TLWR842  
 make[2] image/TLWR941  
 make[2] image/TLWR1043  
 make[2] image/TLWDR4300  
 make[2] image/TLMR3020  
 make[2] image/TLMR3040  
 make[2] image/TLMR3220  
 make[2] image/TLMR3420  
 make[2] image/UBNT  
</code>

Das war's! Die fertigen images liegen im gleichgenannten Verzeichnis:

<code>
 $ find images -name *factory.bin  
 images/ar71xx/TLMR3220/gluon-ar71xx-generic-tl-mr3220-v1-squashfs-factory.bin  
 images/ar71xx/TLWR741/gluon-ar71xx-generic-tl-wr741nd-v1-squashfs-factory.bin  
 images/ar71xx/TLWR741/gluon-ar71xx-generic-tl-wr741nd-v2-squashfs-factory.bin  
 images/ar71xx/TLWR741/gluon-ar71xx-generic-tl-wr741nd-v4-squashfs-factory.bin  
 images/ar71xx/TLMR3020/gluon-ar71xx-generic-tl-mr3020-v1-squashfs-factory.bin  
 images/ar71xx/TLMR3040/gluon-ar71xx-generic-tl-mr3040-v1-squashfs-factory.bin  
 images/ar71xx/TLWDR4300/gluon-ar71xx-generic-tl-wdr4300-v1-squashfs-factory.bin  
 images/ar71xx/TLWDR4300/gluon-ar71xx-generic-tl-wdr3600-v1-squashfs-factory.bin  
 images/ar71xx/TLWDR4300/gluon-ar71xx-generic-tl-wdr4310-v1-squashfs-factory.bin  
 images/ar71xx/TLWR841/gluon-ar71xx-generic-tl-wr841nd-v7-squashfs-factory.bin  
 images/ar71xx/TLWR841/gluon-ar71xx-generic-tl-wr841nd-v5-squashfs-factory.bin  
 images/ar71xx/TLWR841/gluon-ar71xx-generic-tl-wr841nd-v3-squashfs-factory.bin  
 images/ar71xx/TLWR841/gluon-ar71xx-generic-tl-wr841n-v8-squashfs-factory.bin  
 images/ar71xx/TLWR1043/gluon-ar71xx-generic-tl-wr1043nd-v1-squashfs-factory.bin  
 images/ar71xx/UBNT/gluon-ar71xx-generic-ubnt-bullet-m-squashfs-factory.bin  
 images/ar71xx/UBNT/gluon-ar71xx-generic-ubnt-ls-sr71-squashfs-factory.bin  
 images/ar71xx/UBNT/gluon-ar71xx-generic-ubnt-rspro-squashfs-factory.bin  
 images/ar71xx/UBNT/gluon-ar71xx-generic-ubnt-rocket-m-squashfs-factory.bin  
 images/ar71xx/UBNT/gluon-ar71xx-generic-ubnt-airrouter-squashfs-factory.bin  
 images/ar71xx/UBNT/gluon-ar71xx-generic-ubnt-unifi-squashfs-factory.bin  
 images/ar71xx/UBNT/gluon-ar71xx-generic-ubnt-unifi-outdoor-squashfs-factory.bin  
 images/ar71xx/UBNT/gluon-ar71xx-generic-ubnt-nano-m-squashfs-factory.bin  
 images/ar71xx/UBNT/gluon-ar71xx-generic-ubnt-rs-squashfs-factory.bin  
 images/ar71xx/TLWR842/gluon-ar71xx-generic-tl-wr842n-v1-squashfs-factory.bin  
 images/ar71xx/TLWR941/gluon-ar71xx-generic-tl-wr941nd-v2-squashfs-factory.bin  
 images/ar71xx/TLWR941/gluon-ar71xx-generic-tl-wr941nd-v4-squashfs-factory.bin  
 images/ar71xx/TLWR941/gluon-ar71xx-generic-tl-wr941nd-v3-squashfs-factory.bin  
 images/ar71xx/TLMR3420/gluon-ar71xx-generic-tl-mr3420-v1-squashfs-factory.bin  
 images/ar71xx/TLWR740/gluon-ar71xx-generic-tl-wr740n-v3-squashfs-factory.bin  
 images/ar71xx/TLWR740/gluon-ar71xx-generic-tl-wr740n-v1-squashfs-factory.bin  
 images/ar71xx/TLWR740/gluon-ar71xx-generic-tl-wr740n-v4-squashfs-factory.bin  
</code>

Die Verfuegbarkeit eines images heisst nicht zwingend, dass die Hardware fuer den
Freifunk verwendet werden sollte. So sehen wir etwa von dem Einsatz des TL-WR740
oder TL-WR741 ab.

Auf einer schnellen Haswell Maschine benoetigte der hier beschriebene Durchlauf
auf einem virtuellen Kern mit Virtualbox 4.3.6 etwa 65 Minuten. Beeindruckender
noch ist der gestiegene Speicherplatz

user@vm-moeller-debian:~/freifunk-source/gluon$ du -sh .  
<code>
 5,8G    .  
</code>

an dem die images 

user@vm-moeller-debian:~/freifunk-source/gluon$ du -sh images/
<code>
 481M    images/  
</code>

einen nicht ungehoerigen Anteil haben.
