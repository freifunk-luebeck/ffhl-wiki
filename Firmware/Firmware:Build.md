# Lübeck Freifunk Firmware Repository Checkout/Build

## Build instructions - v0.4.x development version

Die Entwicklung der Firmware v0.4 ist noch in der Planungsphase, es existiert noch kein benutzbarer Code.

## Build instructions - v0.3.x development version

Da diese Version in Entwicklung ist, kann sie möglicherweise problematische Bugs enthalten.

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