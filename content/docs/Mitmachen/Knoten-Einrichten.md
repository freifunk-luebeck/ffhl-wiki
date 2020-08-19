---
title: Freifunk-Knoten einrichten
draft: true

---

## Freifunk-Firmware Flashen

Im Folgenden findest Du eine Anleitung wie Du deinen Router zu einem Freifunk-Router verwandeln kannst.
Wir versuchen zu den meisten aktuellen Modellen Anleitungen bereitzustellen und diese aktuell zu halten. Solltest du an einem Schritt Probleme haben, frag gerne um Hilfe (per [email](mailto:info@luebeck.freifunk.net) oder im [matrix-chat #ffhl:matrix.org](https://matrix.to/#/!abaEXDFMmCWEivMGJF:matrix.org?via=matrix.org&via=matrix.eclabs.de&via=toppoint.de)) oder komm zu einem unserer nächsten [Treffen](https://luebeck.freifunk.net/treffen.html) und bring den Router gleich mit! 

### Firmware herunterladen

Lade zuerst die passende Firmware für deinen Router herunter. Beachte, dass die Hardwarerevision bei der Firmware relevant ist.

{{< button href="https://firmware.luebeck.freifunk.net/wizard" >}}Firmware-Wizard{{< /button >}}

### Firmware Flashen

Um den Router mit der Firmware zu flashen, gibt es je nach Hardware unterschiedliche Wege.
Die allermeisten lassen sich über ein Webinterface, manche per SSH und andere nur per sftp flashen.

{{< tabs "uniqueid" >}}
{{< tab "Webinterface / Gl.iNet" >}} 

1. Verbinde dich mit dem Router per Lan-Kabel an eine der Client-Buchsen des Routers (meistens Gelb).
2. Öffne das Webinterface des Routers (häufig http://192.168.0.1, http://192.168.1.1, http://192.168.178.1)
3. Finde das Menü für ein Systemupgrade und lade die Freifunk-Firmware hoch.
4. Den Router auf keinen Fall ausschalten, das installieren der Firmware kann einen moment dauern.
5. Gehe auf die Seite http://192.168.1.1 und folge den Schritten im Freifunk-Installationswizard
7. Jetzt kannst du deinen PC vom Router trennen und den Router mit einem Uplink zu deinem DSL- oder Kabelmodem verbinden. Sollten andere Freifunkknoten in der nähe sein, werden sie sich automatische über Wlan verbinden

TODO Bilder

{{< /tab >}}
{{< tab "Webinterface / Netgear EX6150" >}} 

https://freifunk-ingolstadt.de/eigener-freifunk-hotspot/anleitung/installationsanleitung-fuer-netgear-wi-fi-range-extender-ex6150-v2/

{{< /tab >}}

{{< tab "FritzTool / SSH - AVM Fritzbox 4040" >}} 

https://fritz-tools.readthedocs.io/de/latest/
https://wiki.bremen.freifunk.net/Anleitungen/Firmware/Flashen-FritzBox-4040

{{< /tab >}}
{{< tab "TP-LINK Archer" >}} 

https://www.youtube.com/watch?v=l9dopd0AtBY

{{< /tab >}}
{{< tab "Ubiquiti " >}} 

Unifi AC: https://wiki.freifunk.net/Ubiquiti_Unifi_AC/Flash-Anleitung
M-Serie: https://wiki.freifunk.net/Ubiquiti_M-Serie/Flash-Anleitung

{{< /tab >}}
{{< /tabs >}}

Du solltest nun ein Wlan mit dem Namen _"luebeck.freifunk.net"_ empfangen. Nach kurzer Zeit sollte der neue Knoten auch auf der [Karte](https://map.luebeck.freifunk.net/) auftauchen. 



## Router in Config-Mode starten

Um den Router erneut in den Konfigurationsmodus zu starten, muss je nach Gerät der QSS-, WPS-, DECT- oder Reset-Button des laufenden Routers etwa 3-15 Sekunden lang gedrückt werden - solange, bis alle Lichter einmal kurz aufleuchten. Dann startet der Router im Konfigurationsmodus neu.
