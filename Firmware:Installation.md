# Schnellstart Anleitung

(TODO: Bildschirmfotos hinufügen!)

## Hast du schon ein Freifunk WLAN bei dir in der Nähe?

Wenn ja:

 1. Zum Beispiel den [[TP-Link TL-WR741ND|http://wiki.openwrt.org/toh/tp-link/tl-wr741nd]] oder [[TP-Link TL-WR1043ND|http://wiki.openwrt.org/toh/tp-link/tl-wr1043nd]] besorgen.
 1. Die zum Modell passende, aktuelle [[Firmware]] herunterladen.
 1. In der vom Hersteller ausgelieferten Web-Oberfläche die Firmware hochladen. Einige Minuten warten und **!!nicht den Strom abschalten!!** - ansonsten kann es zur Beschädigung des Gerätes kommen.
   * Den Laptop/PC an einen LAN-Anschluss (gelb) des TP-Link Routers anschließen.
   * In den Browser `http://192.168.1.1` eintippen.
   * Mit dem Standard-Benutzernamen `admin` und -Passwort `admin` einloggen.
   * Auf "System Tools", dann "Firmware Upgrade" klicken.
   * Die Lübeck Freifunk Firmware Datei auswählen (Datei mit der Endung .bin).
   * Auf Upgrade klicken um den Router zu flashen.
 1. An einen Punkt mit gutem Empfang zum anderen, benachbarten Freifunk Router aufstellen.
 1. Fertig!

Ansonsten:

## Hast du einen DSL Anschluss?

Falls ja:

 1. Den [[TP-Link TL-WR1043ND|http://wiki.openwrt.org/toh/tp-link/tl-wr1043nd]] besorgen (hat mehr Speicher, was für die VPN Software notwendig ist).
 1. Die zum Modell passende, aktuelle [[Firmware]] herunterladen.
 1. In der vom Hersteller ausgelieferten Web-Oberfläche die Firmware hochladen. Einige Minuten warten und **!!nicht den Strom abschalten!!** - ansonsten kann es zur Beschädigung des Gerätes kommen.
   * Den Laptop/PC an einen LAN-Anschluss (gelb) des TP-Link Routers anschließen.
   * In den Browser "http://192.168.1.1" eintippen.
   * Mit dem Standard-Benutzernamen `admin` und -Passwort `admin` einloggen.
   * Auf "System Tools", dann "Firmware Upgrade" klicken.
   * Die Lübeck Freifunk Firmware Datei auswählen (Datei mit der Endung .bin).
   * Auf Upgrade klicken um den Router zu flashen.
 1. Den IntraCity-VPN Zugang einrichten, siehe [[IntraCityVPN]].
 1. Fertig!

## Ganz Ungeduldig? Oder Unschlüssig?

Du kannst dir auch für einen Pfand einen fertig eingerichteten Router bei unseren wöchentlichen Treffen beim CCCHL abholen und beantworten dir hier gerne noch offene Fragen.

## Coole Features für Fortgeschrittene

Der Router basiert auf Linux, das heißt es steht eine Menge freier Software zu Verfügung, die du auch auf deinem Freifunk Router installieren kannst. Praktische Tools und Konfigurationsbeispiele findest du [[hier|Freifunk verwenden]].