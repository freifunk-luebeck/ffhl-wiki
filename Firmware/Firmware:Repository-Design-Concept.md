# Repository Design Concept

The following repository layout has been chosen with the following key features in mind:

 * Easy creation of new OpenWRT profiles
   * ... for new target devices
   * ... for local Freifunk communities
 * With minimum/no forking of redundant data/changes

The following guidelines should be followed when making changes to any (sub)repository:

 * The profile subrepository should not contain any larger changes / files, try to stick to (uci) configurations only
 * For larger changes / data, think whether it could be benefical for someone else then your local community. If so, try to make it generic and configurable via uci and get it upstream to the OpenWRT repository.
 * If you have changes / data, which apply to multiple profiles / target devices, then put it in an extra sub-repository (i.e. a custom webpage for your local community)

To achieve this, no scripts to "enhance" / customize the build environment have been created, but already present features like OpenWRT profiles and git-submodules are being heavily used and encouraged. This avoids forking the official OpenWRT build environment - enhancing the build environment should always be generic and beneficial for everyone.