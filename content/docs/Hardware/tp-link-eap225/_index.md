---
title: TP-Link EAP225
bookCollapseSection: true
---

- https://openwrt.org/toh/tp-link/eap225
- https://www.tp-link.com/de/support/download/eap225-outdoor/v1/#Firmware
-
-
- ## Flash Firmware
  - Connect to Wifi the device opens
  - open webinterface von http://tplinkeap.net/ (admin:admin)
  - Upgrade the firmware to version v5.0.3, which fixes a bug that may cause the EAP to reboot abnormally during firmware upgrading and cause the device to brick
  - Enable the SSH-Server via the web interface
  - ssh into the target device and run `cliclientd stopcs`
  - upload the factory image via the web interface
  - connect via ethernet open 192.168.1.1 and see freifunk config mode

iperf3

| Gatway         | VPN        | Down | Up   | Connection | Uplink   |
| -------------- | ---------- | ---- | ---- | ---------- | -------- |
| Muehlentor     | fastd@null | 20.3 | 35.2 | 5ghz       | 100 / 40 |
| Kaisertor      | fastd@null | 20.3 | 37.4 | 5ghz       | 100 / 40 |
| Kaisertor      | fastd@l2tp | 53.3 | 37.4 | 5ghz       | 100 / 40 |
