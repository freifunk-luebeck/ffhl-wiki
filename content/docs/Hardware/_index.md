---
title: Hardware
bookCollapseSection: true
weight: 50
---

## Router kaufen

Achte beim Kauf auf die Hardware-Revision!
Nicht immer existiert für jedes Gerät eine Firmware, obwohl es zur
selben Modellreihe gehört.
Schaue daher vor dem Kauf auf die Verpackung oder kontaktiere deinen
Lieferanten zur Klärung.

Achte auch auf [zu vermeidende Routemodelle]({{< relref "docs/Hardware/zu-vermeidende-routermodelle" >}}).

Wir empfehlen den Besuch beim lokalen Händler deines Vertrauens, da du
dort die Revision vor dem Kauf überprüfen kannst. Alternativ lohnt sich
der Preisvergleich im Internet bei Seiten wie
[Geizhals](https://geizhals.de/) oder [Idealo](https://www.idealo.de/).

### Empfehlungen

Je nach Geldbeutel und Installationsort eignen sich verschiedene Geräte,
für die folgende Auswahl ist Zukunftssicherheit die gemeinsame Basis.
Das heißt, wir haben bei allen Geräten keine Bedenken für mindestens die
nächsten 5 Jahre.

{{< tabs "uniqueid" >}}

{{% tab "Indoor" %}}

Unsere gängigen Empfehlungen für den Betrieb moderner Hardware im

| Abbildung        | ![Netgear EX6150](/hardware/ex6150v2.svg)                                                                          | ![AVM FRITZ!Box 4040](/hardware/fritz4040.svg)                            | ![Ubiquiti Unifi AP AC-Lite](/hardware/unifi_ac_lite.svg)                       | ![GL.iNet GL-B1300](/hardware/gl-b1300.svg)                                                                        |
|------------------|--------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------|---------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|
| Hersteller       | Netgear                                                                                                            | AVM                                                                       | Ubiquiti                                                                        | Gl.iNet                                                                                                            |
| Modell           | EX6150 v2                                                                                                          | FRITZ!Box 4040                                                            | Unifi AC Lite                                                                   | GL-B1300                                                                                                           |
| Stromversorgung  | integriertes Netzteil                                                                                              | Netzteil                                                                  | PoE Injektor                                                                    | Netzteil                                                                                                           |
| CPU              | 4x717 MHz                                                                                                          | 4x717 MHz                                                                 | 1x750 MHz                                                                       | 4x717 MHz                                                                                                          |
|                  | ARMv7                                                                                                              | ARMv7                                                                     | MIPS 74Kc                                                                       | ARMv7                                                                                                              |
| RAM              | 256 MB                                                                                                             | 256 MB                                                                    | 128 MB                                                                          | 256 MB                                                                                                             |
| Flash            | 16 MB                                                                                                              | 32 MB                                                                     | 16 MB                                                                           | 32 MB                                                                                                              |
| Wi-Fi Standard   | Wi-Fi 5                                                                                                            | Wi-Fi 5                                                                   | Wi-Fi 5                                                                         | Wi-Fi 5                                                                                                            |
|                  | 802.11ac (Wave2)                                                                                                   | 802.11ac (Wave2)                                                          | 802.11ac (Wave1)                                                                | 802.11ac (Wave2)                                                                                                   |
| Frequenzbänder   | 2.4 GHz / 5 GHz                                                                                                    | 2.4 GHz / 5 GHz                                                           | 2.4 GHz / 5 GHz                                                                 | 2.4 GHz / 5 GHz                                                                                                    |
| WLAN-Datenrate,  | 400 (2.4 GHz)                                                                                                      | 400 (2.4 GHz)                                                             | 300 (2.4 GHz)                                                                   | 400 (2.4 GHz)                                                                                                      |
| zu (MBit/s)      | 867 (5 GHz)                                                                                                        | 867 (5 Ghz)                                                               | 867 (5 GHz)                                                                     | 867 (5 GHz)                                                                                                        |
| USB              | ✗                                                                                                                  | 1x USB3.0                                                                 | ✗                                                                               | 1x USB3.0                                                                                                          |
| Neupreis         | [€ 60-70](https://geizhals.de/netgear-wi-fi-range-extender-ex6150-ex6150-100pes-a1232062.html)                     | [€ 70](https://geizhals.de/avm-fritz-box-4040-20002763-a1501050.html)     | [€ 80](https://geizhals.de/ubiquiti-unifi-ap-ac-lite-uap-ac-lite-a1325765.html) | [€ 80-90](https://geizhals.de/gl-inet-gl-b1300-a1812653.html)                                                      |
| Installation via | [Webinterface](https://git.openwrt.org/?p=openwrt/openwrt.git;a=commit;h=970f1914be3f299fb302ca74a214589397000858) | [FTP](https://fritz-tools.readthedocs.io/de/latest/flashing/general.html) | [SSH](https://forum.darmstadt.freifunk.net/t/unifi-ap-erstinstallation/790)     | [Webinterface](https://git.openwrt.org/?p=openwrt/openwrt.git;a=commit;h=04d3308b6248ef21a6f0bc3378b342906c2d2865) |

{{% /tab %}}
{{% tab "Outdoor" %}}

Für eine brauchbare Außenabdeckung muss ein Router Wind und Wetter
trotzen können, diese Geräte sind darauf hinreichend vorbereitet.

| Abbildung        | ![Ubiquiti Unifi AC Mesh](/hardware/unifi_ac_mesh.svg)                      |
|------------------|-----------------------------------------------------------------------------|
| Hersteller       | Ubiquiti                                                                    |
| Modell           | UniFi AC Mesh                                                               |
| Stromversorgung  | PoE Injektor                                                                |
|                  | 802.3af                                                                     |
| CPU              | 1x750 MHz                                                                   |
|                  | MIPS 74Kc                                                                   |
| RAM              | 128 MB                                                                      |
| Flash            | 16 MB                                                                       |
|                  | (8 MB nutzbar)                                                              |
| Wi-Fi Standard   | Wi-Fi 5                                                                     |
|                  | 802.11ac (Wave1)                                                            |
| Frequenzbänder   | 2.4 GHz                                                                     |
|                  | 5 GHz                                                                       |
| WLAN-Datenrate,  | 300 (2.4 GHz)                                                               |
| bis zu (MBit/s)  | 867 (5 GHz)                                                                 |
| USB              | ✗                                                                           |
| Neupreis         | [€ 87](https://geizhals.de/ubiquiti-unifi-ac-mesh-uap-ac-m-a1547488.html)   |
| Installation via | [SSH](https://forum.darmstadt.freifunk.net/t/unifi-ap-erstinstallation/790) |
{{% /tab %}}
{{% tab "Erschwinglich" %}}

Geräte welche teilweise nur auf dem Gebrauchtmarkt zu akzeptablen
Preisen verfügbar sind. Sie sind zwar technologisch überholt, es sind
uns jedoch keine weiteren Unzulänglichkeiten bekannt.

| Abbildung        | ![AVM FRITZ!Repeater 300E](/hardware/fritz450e.svg)                       | ![TP-Link WDR3600](/hardware/wr1043nd.svg)                                  | ![TP-Link WDR4300 (v1) ](/hardware/TL-WDR4300.svg)                              | ![Netgear R6120](/hardware/netgear-r6120.svg)                               | ![AVM FRITZ!Box 4020](/hardware/fritz4020.svg)                            |                                                                             |
|------------------|---------------------------------------------------------------------------|-----------------------------------------------------------------------------|---------------------------------------------------------------------------------|-----------------------------------------------------------------------------|---------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| Hersteller       | AVM                                                                       | TP-Link                                                                     | TP-Link                                                                         | Netgear                                                                     | AVM                                                                       | Gl.Inet                                                                     |
| Modell           | FRITZ!WLAN Repeater                                                       | TL-WDR3600                                                                  | TL-WDR4300                                                                      | R6120                                                                       | FRITZ!Box 4020                                                            | GL-MT300N-V2                                                                |
|                  | 300E                                                                      | v1                                                                          |                                                                                 |                                                                             |                                                                           |                                                                             |
| Stromversorgung  | integriertes Netzteil                                                     | Netzteil                                                                    | Netzteil                                                                        | Netzteil                                                                    | Netzteil                                                                  | USB                                                                         |
| CPU              | 1x400 MHz                                                                 | 1x560 MHz                                                                   | 1x560 MHz                                                                       | 1x580 MHz                                                                   | 1x750 MHz                                                                 | 1x580 MHz                                                                   |
|                  | MIPS 74Kc                                                                 | MIPS                                                                        | MIPS 74Kc                                                                       | MIPS 74Kc                                                                   | MIPS 74Kc                                                                 | MIPS24KEc                                                                   |
| RAM              | 64 MB                                                                     | 128 MB                                                                      | 128 MB                                                                          | 64 MB                                                                       | 128 MB                                                                    | 128 MB                                                                      |
| Flash            | 16 MB                                                                     | 8 MB                                                                        | 8 MB                                                                            | 16 MB                                                                       | 16 MB                                                                     | 16 MB                                                                       |
| Wi-Fi Standard   | Wi-Fi 4                                                                   | Wi-Fi 5                                                                     | Wi-Fi 5                                                                         | Wi-Fi 5                                                                     | Wi-Fi 4                                                                   | Wi-Fi 4                                                                     |
|                  | 802.11n                                                                   | 802.11 b/g/n, a/n                                                           | 802.11b/g/n, a/c                                                                | 802.11ac (Wave 1)                                                           | 802.11n                                                                   | 802.11b/g/n                                                                 |
| Frequenzbänder   | 2.4 GHz                                                                   | 2.4 GHz, 5GHz                                                               | 2.4 GHz, 5GHz                                                                   | 2.4 GHz / 5 GHz                                                             | 2.4 GHz                                                                   | 2.4 GHz                                                                     |
| WLAN-Datenrate,  | 300 (2.4 GHz)                                                             |                                                                             | 450 (2.4 GHz)                                                                   | 300 (2.4 GHz)                                                               | 450 (2.4 GHz)                                                             | 300 (2.4 GHz)                                                               |
| bis zu (MBit/s)  |                                                                           |                                                                             |                                                                                 | 866 (5 GHz)                                                                 |                                                                           |                                                                             |
| USB              | ✗                                                                         | 2x 2.0                                                                      | ✗                                                                               | 1x USB2.0                                                                   | (1x USB2.0)                                                               | (1x USB2.0)                                                                 |
|                  |                                                                           |                                                                             |                                                                                 |                                                                             | nicht unterstützt                                                         | nicht unterstützt                                                           |
| Neupreis         | ✗                                                                         | ✗                                                                           | [€ 59](https://geizhals.de/avm-fritz-wlan-repeater-450e-20002589-a1065058.html) | [€ 37](https://geizhals.de/netgear-r6120-r6120-100pes-a1624501.html)        | [€ 45](https://geizhals.de/avm-fritz-box-4020-20002713-a1244179.html)     | [€ 23](https://geizhals.de/gl-inet-mt300n-gl-mt300n-v2-a1662301.html)       |
| Gebrauchtpreis   | max. € 20                                                                 | max. € 25                                                                   | max. € 30                                                                       | max. € 35                                                                   | max. € 30                                                                 | ~ €23                                                                       |
| Installation via | [FTP](https://fritz-tools.readthedocs.io/de/latest/flashing/general.html) | [Webinterface](https://darmstadt.freifunk.net/mitmachen/router-einrichten/) | [FTP](https://fritz-tools.readthedocs.io/de/latest/flashing/general.html)       | [Webinterface](https://darmstadt.freifunk.net/mitmachen/router-einrichten/) | [FTP](https://fritz-tools.readthedocs.io/de/latest/flashing/general.html) | [Webinterface](https://darmstadt.freifunk.net/mitmachen/router-einrichten/) |
{{% /tab %}}
{{< /tabs >}}


Die Hardware-Illustrationen stammen von:

- [Daniel Krah](https://github.com/Moorviper/Freifunk-Router-Anleitungen)
  ([CC-BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/))
- [Julian Labus](https://github.com/belzebub40k/router-pics)
  ([CC-BY-NC-SA 4.0](http://creativecommons.org/licenses/by-nc-sa/4.0/))

Übersicht stammt von [Freifunk Darmstadt](https://darmstadt.freifunk.net/mitmachen/unterstuetzte-geraete/)
