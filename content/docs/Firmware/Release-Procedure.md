# Release Procedure

Example for a 0.10 release based on Gluon v2018.2

### 0. Pre-Build

* Add (or update) "Gluon release version <-> firmware/site release version" to [README.md](https://github.com/freifunk-luebeck/site-ffhl/blob/master/README.md) in the site repository master branch:
* ``0.10: v2018.2``

### 1. Build

```
$ VERSION=0.10-1
$ GLUON_VERSION=v2018.2

$ git clone https://github.com/freifunk-gluon/gluon.git
$ cd gluon
$ git checkout $GLUON_VERSION
$ git clone https://github.com/freifunk-luebeck/site-ffhl.git site

$ make update
$ for target in ar71xx-generic ar71xx-tiny ar71xx-nand brcm2708-bcm2708 brcm2708-bcm2709 ipq40xx mpc85xx-generic mpc85xx-p1020 ramips-mt7620 ramips-mt7621 ramips-mt76x8 ramips-rt305x sunxi-cortexa7 x86-generic x86-geode x86-64; do echo "Building: $target"; make GLUON_TARGET="$target" clean; make GLUON_RELEASE=$VERSION GLUON_BRANCH=stable GLUON_TARGET="$target" -j $(nproc); done

$ make manifest GLUON_BRANCH=beta GLUON_RELEASE=$VERSION GLUON_PRIORITY=0
$ make manifest GLUON_BRANCH=stable GLUON_RELEASE=$VERSION GLUON_PRIORITY=7

```

Visually check that output/images/* and the contents of output/images/sysupgrade/{stable,beta}.manifest looks fine.

Then copy output/images to ``srv01.luebeck.freifunk.net:/var/lib/ffhl-firmware/autoupdates/0.10-1``. And run ``chown -R firmware:nogroup /var/lib/ffhl-firmware/autoupdates/0.10-1``. This maps to: https://luebeck.freifunk.net/firmware/0.10-1/sysupgrade/

### 2. Beta release

First, manually download and flash a few images to a few devices to check that the overall build process went fine. If the devices boot fine, then:

```
$ cd site
$ git tag v0.10-1 master
$ git push origin v0.10-1
$ git push 
$ cd ..
$ ./contrib/sign.sh ~/your-autoupdate-key.priv ./output/images/sysupgrade/beta.manifest
```

The sign.sh call needs to be redone by each signer to reach the minimum amount of valid signatures needed for the autoupdater to start. Then:

* Update the beta.manifest on the server with the new, added signatures below the "---" in the local copy of the beta.manifest.
* On srv01.luebeck.freifunk.net call:

```
$ cd /var/lib/ffhl-firmware/autoupdates/
$ rm beta
$ ln -s 0.10-1 beta
```

Then check for about 2 weeks that nodes with the beta branch selected in their autoupdater updated and run fine. Make sure to have at least one device of the more popular ones on a beta branch.

*Post-beta-rollout checklist:*

* Nodes are alive and stable with new version number (check node's status page)
* Check that all wifi interfaces are up and running (run ``iwinfo`` via ssh)
* Check that meshing works (run ``batctl o`` via ssh)
* Check that the process list looks fine (run ``ps`` via ssh - no missing processes? no new, suspicious processes?)
* Check that /etc/config/autoupdater looks fine and has the correct public keys
* Check that /etc/dropbear/authorized_keys was left unmodified

### 3. Stable release

If everything went smoothly, with no issues so far then proceed here. Otherwise redo steps 1) and 2) with the appropriate changes and increment the build version number (e.g. 0.10-2 for the second try).

First update the "DATE" parameter in your local copy of the stable.manifest to a time in the future at which autoupdates should start. Note that until then all signers (or at least the minimum amount of signers necessary) should have added their signature. Otherwise the safety measure of an update stretched over a week via GLUON_PRIORITY will not apply. That is, if the minimum amount of necessary signatures was added after DATE + GLUON_PRIORITY then all nodes will update immediately instead of stretched over a week.

To sign the stable release do the following in your local copy:

```
$ cd site
$ git tag v0.10 master
$ git push origin v0.10
$ git push 
$ cd ..
$ ./contrib/sign.sh ~/your-autoupdate-key.priv ./output/images/sysupgrade/stable.manifest
```

The sign.sh call needs to be redone by each signer to reach the minimum amount of valid signatures needed for the autoupdater to start. Then:

* Update the DATE in the stable.manifest on the server with the new start time.
* Update the stable.manifest on the server with the new, added signatures below the "---" in the local copy of the stable.manifest.
* On srv01.luebeck.freifunk.net call:

```
$ cd /var/lib/ffhl-firmware/autoupdates/
$ ln -s 0.10-1 0.10
$ ln -s 0.10-1 stable
```

*Pre-stable-rollout checklist:*

* Verify that images are downloadable via https://luebeck.freifunk.net/firmware/0.10/sysupgrade/
* Verify that stable.manifest on the server contains a sufficient amount of valid signatures
* Verify that the start DATE of the stable.manifest on the server is correct

Then prior the stable update start date, inform passengers: Inform about scheduled landing time of the new release and the firmware changes it contains on the talk@luebeck.freifunk.net mailing list.

*Peri-stable-rollout checklist:*

* Daily:
  * Check that the predicted number of nodes updates to the new firmware version
  * For the nodes which updated successfully, check their status page:
    * enough RAM
    * load ok (usually < 1)
    * neighbor link quality ok
  * Monitor mailing lists for passenger feedback

In case of any issues occurring, on srv01.luebeck.freifunk.net abort via:

```
$ cd /var/lib/ffhl-firmware/autoupdates/
$ rm 0.10
```

*Post-stable-rollout checklist:*

* Check if any nodes might have failed updating (any nodes that might have gone offline, especially during the update time at about 04:00 o'clock.
  * If available, inform individual node owners via the contact information they set in the config-mode about their failed update. If possible, determine cause for failure.
* Update firmware version and models on the website: https://luebeck.freifunk.net/firmware.html
  * set "FIRMWARE_VERSION" in _plugins/firmwares.rb
  * run "jekyll build"
  * check for warnings about unknown/new devices: add them to firmwares.rb
  * rerun "jekyll build" and update firmware.rb until no more warnings occur
  * git-commit and -push changes
* Update https://luebeck.freifunk.net/: Add a new blog entry to inform about the new firmware release
* Inform via Twitter about the new firmware release
* Increment DEFAULT_GLUON_RELEASE in https://github.com/freifunk-luebeck/site-ffhl/blob/master/site.mk

## Version Numbering

``0.10.5-3 - 0.x[.y]-z``

* **x:** major version number
* **y:** minor version number
* **z:** build version number

***The major version number (x) is increased:***

* for releases with a new Gluon major version number (e.g. Gluon v2018.1.3 -> Gluon v2018.2) and/or
* for releases with significant changes to site.conf and/or site.mk

If the major version number is increased than any previous minor version number is removed. (**ok:** 0.9.5 -> 0.10, **not ok:** 0.9.5 -> 0.10.1)

***The minor version number (y) is increased or added:***

* for releases with a new Gluon minor version number (e.g. Gluon v2018.1 -> Gluon v2018.1.3), with only small or no changes to site.conf or site.mk

***The build version number (z) is increased:***

* if a beta rollout was not satisfactory

After a stable release/rollout with a particular build version number, it is not increased further. New stable releases should use a new minor and/or major version number.
