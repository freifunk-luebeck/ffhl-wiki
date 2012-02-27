# Firmwareupdate

So aktualisiert man seinen Router, der bereits eine Lübeck Freifunk Firmware hat (TODO: Bildschirmfotos hinzufügen):

**Achtung:** Das es bei v0.1 das Webinterface noch nicht gab, muss hier ein wenig mehr Handarbeit angelegt werden, siehe hierzu "Update vom OpenWRT Failsafe-Modus".

 1. Die zum Modell passende, aktuelle [[Firmware]] herunterladen.
 1. Im gleichen Verzeichnis, die Prüfsumme aus der Datei md5sums für die entsprechende Datei speichern (Beispiel: `5b9f1c864a7b9c24a71aae00a226378f  openwrt-ar71xx-tl-wr1043nd-v1-squashfs-sysupgrade.bin`).
 1. Den Freifunk-Router an deinen Heimnetz-Router anschließen.
 1. Das Stromkabel an den Freifunk-Router einstecken.
 1. z.B. einen Laptop an deinen Heimnetz-Router anschließen.
 1. Im Browser `https://Freifunk-[MAC]` eintippen, wobei [MAC] durch die unter dem Router aufgedruckte MAC ersetzt werden muss. (Beispiel: `https://Freifunk-D85D4CF2AEC2`)
 1. Auf Login klicken (Passwort leer lassen, Username 'root' lassen), dann auf System -> Backup/Restore. Und dann einmal auf 'Create Backup' klicken und die heruntergeladene Datei dann sicher wegspeichern.
 1. Dann auf "System" -> "Flash Firmware" klicken. Auf 'Browse' klicken und die vorher heruntergeladene Firmware auswählen. Stelle sicher, dass der Haken bei 'Keep configuration files' ''gesetzt'' ist. Dann auf 'Upload Image' klicken.
 1. Sicherstellen, dass die MD5 Prüfsumme im Webinterface mit der von der heruntergeladenen Firmware-Datei übereinstimmt.
 1. Ungefähr 10min. warten.

Falls es Probleme gibt, das Webinterface des Freifunk-Routers zu erreichen, dann probiere ein oder mehrere der folgenden Punkte:

 * Ziehe das Stromkabel des Freifunk-Routers und stecke es erneut ein.
 * Probiere "http" statt "https".
 * Setze die IP Adresse auf deinem Laptop auf 192.168.20.80, Subnetzmaske 255.255.255.0, Gateway/DNS leer lassen. Probiere dann `https://192.168.20.81` oder `http://192.168.20.81` über den Webbrowser zu erreichen.

## Update vom OpenWRT Failsafe-Modus

Der OpenWRT Failsafe-Modus kann zum Neu-Flashen benutzt werden, wenn man sich aus dem Router, z.B. durch eigene Änderungen an der Netzwerkkonfiguration oder Firewall, ausgesperrt haben sollte. Auch ein Update von einer Lübeck Freifunk Firmware v0.1 muss über das den Failsafe-Modus gemacht werden.

Der Failsafe-Modus wird wie folgt gestartet:

 * Router einschalten
 * Warten bis die SYS LED blinkt
 * Reset-Taste gedrückt halten bis das Blinken schneller wird

Das Updaten kann dann mit [[diesem|openwrt-failsafe-flasher.sh]] Skript unter Linux gemacht werden. Eigene IP auf 192.168.1.5/24 setzen und mit `./openwrt-failsafe-flasher.sh path/to/file` starten.