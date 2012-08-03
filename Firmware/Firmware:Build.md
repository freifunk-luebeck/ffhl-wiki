# Lübeck Freifunk Firmware Repository Checkout/Build

## Build instructions - v0.3 development version

Da diese Version noch in Entwicklung ist, kann sie noch problematische Bugs enthalten.

    # für 741nd
    git clone git://krtek.asta.uni-luebeck.de/lff/firmware.git
    # für 1043nd
    git clone git://krtek.asta.uni-luebeck.de/lff/firmware.git -b tl-wr-1043nd

    cd firmware
    scripts/feeds update -a
    scripts/feeds install -a
    make

## Build instructions - v0.2.1 release version

Diese Version ist obsolet und sollte nicht mehr verwendet werden.

    git clone --recursive http://www.metameute.de/git/lff.git
    cd lff
    git checkout lff-v0.2.1
    scripts/feeds install -a
    scripts/env switch lff-dlink-dir300-v0.2.1
    make

Or substitute `lff-dlink-dir300` with any other available profile branch in LFF-Profiles.

## Web pages of various (sub-)repositories

 * http://git.metameute.de/LuebeckFreifunkFirmware/
 * http://git.metameute.de/LFF-Packages/
 * http://git.metameute.de/LFF-Profiles/
 * http://git.metameute.de/LFF-Info/

[[Firmware:Repository-Design-Concept]]