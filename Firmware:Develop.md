# Develop

## Update von OpenWrt

## Hinzufügen von Software

Sollte eine bestimmte Software in der Firmware nicht vorhanden sein, die aber auf einem Router benötigt wird,
kann man diese selbst hinzufügen. Dazu sucht man sich die entsprechende Software in der !OpenWrt-Konfiguration
heraus und wählt diese zur Installation aus:

    make menuconfig

Sollte die Software nicht in der Konfiguration vorhanden sein, kann man das durch Hinzugügen eines feeds beheben.
Näheres dazu findet sich im !OpenWrt-wiki auf: http://wiki.openwrt.org/doc/devel/feeds

Wenn man nicht die ganze Firmware neu bauen möchte sondern nur eine bestimmte Software, dann kann man die .ipk Datei wie folgt erstellen:

    make package/PAKETNAME/compile


Eine allgemeine Anleitung zum Benutzen der !OpenWrt-build-Umgebung liefert ebenfalls das !OpenWrt-wiki: http://wiki.openwrt.org/doc/howto/build

## Anzeigen der Modifikationen von OpenWrt

Wie folgt listet man die zusätzlichen Fixes und Features zu !OpenWrt auf oder die gesamten inhaltlichen Unterschiede. Die 'git diff's sollten zeitig auf null gebracht werden, um einen dauerhaften Fork von !OpenWrt zu verhindern.

### backfire

    git log --no-merges openwrt-backfire+ --not openwrt-backfire

oder

    git diff openwrt-backfire openwrt-backfire+

### packages-10.03.1

In das Verzeichnis des package feeds wechseln:

    cd feeds/packages

Dann:

    git log --no-merges master --not openwrt-10.03.1

oder `git diff` wie oben entsprechend.

### luci-0.10

In das Verzeichnis des LuCI feeds wechseln:

    cd feeds/luci

Dann:

    git log --no-merges master --not luci-0.10

oder 'git diff' wie oben entsprechend.

## Updates aus dem upstream OpenWrt einholen

git(-svn) remotes hinzufügen:

    ...

### OpenWrt Backfire updates einholen

    git checkout openwrt-backfire
    git svn fetch
    git svn rebase
    git checkout openwrt-backfire+
    git merge openwrt-backfire
    git checkout master
    git merge openwrt-backfire+


### OpenWrt package feed updates einholen

    ...