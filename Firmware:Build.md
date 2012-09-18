# Lübeck Freifunk Firmware Repository Checkout/Build

## Build instructions - v0.4.x development version

Die Entwicklung der Firmware v0.4 ist noch in der Planungsphase, es existiert noch kein benutzbarer Code.

## Build instructions - v0.3.x development version

Da diese Version in Entwicklung ist, kann sie möglicherweise problematische Bugs enthalten. Es ist sehr zu empfehlen, nach einem Update einmal 'make target/linux/clean' auszuführen, damit der Kernel auf jeden Fall neu gebaut wird und zum Rest der Firmware passt.

Wer Entwicklungsversionen nutzt, muss selbst auf seine Config-Dateien achten! Update-Scripte liegen in /lib/freifunk/upgrade, es passiert aber bei der Verwendung von Entwicklungsversionen leicht, dass diese nicht ausgeführt werden, da sich die Versions-Nummer der Freifunk-Firmware nicht bei jedem Update ändert.

    # für 741nd
    git clone git://krtek.asta.uni-luebeck.de/lff/firmware.git -b v0.3.x
    # für 1043nd
    git clone git://krtek.asta.uni-luebeck.de/lff/firmware.git -b v0.3.x-tl-wr1043nd

    cd firmware
    scripts/feeds update -a
    scripts/feeds install -a
    make

## Build instructions - v0.3 release version

Diese Version ist das aktuelle Release und sollte normalerweise verwendet werden.

    # für 741nd
    git clone git://krtek.asta.uni-luebeck.de/lff/firmware.git -b v0.3
    # für 841nd
    git clone git://krtek.asta.uni-luebeck.de/lff/firmware.git -b v0.3-tl-wr841nd
    # für 1043nd
    git clone git://krtek.asta.uni-luebeck.de/lff/firmware.git -b v0.3-tl-wr1043nd

    cd firmware
    scripts/feeds update -a
    scripts/feeds install -a
    make

## Webseiten der verwendeten Repositories

 * http://git.metameute.de/lff/firmware/
 * http://git.metameute.de/lff/pkg_config_mode/
 * http://git.metameute.de/lff/pkg_fastd/