# Lübeck Freifunk Firmware Repository Checkout/Build

## Build instructions - latest development version

    git clone http://www.metameute.de/git/lff.git -b experimental
    cd lff
    echo 'src-git lff ssh://git.metameute.de/var/git/lffpkg.git;experimental' >> feeds.conf.default
    scripts/feeds update -a
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