# Lübeck Freifunk Firmware Repository Checkout/Build

## Build instructions - latest development version

Diese Version ist wirklich nur für Entwicklungszwecke gedacht und sollte nicht produktiv verwendet werden!

    # für 741nd
    git clone git://krtek.asta.uni-luebeck.de/lff/firmware.git -b experimental
    # für 1043nd
    git clone git://krtek.asta.uni-luebeck.de/lff/firmware.git -b experimental-tl-wr-1043nd

    cd firmware
    echo 'src-git lff git://krtek.asta.uni-luebeck.de/lff/pkg.git;experimental' > feeds.conf
    echo 'src-svn luci http://svn.luci.subsignal.org/luci/trunk/contrib/package' >> feeds.conf
    scripts/feeds update -a
    scripts/feeds install -a
    make

## Build instructions - v0.2.1 release version

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