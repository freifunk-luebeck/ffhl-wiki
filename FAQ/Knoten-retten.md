# Knoten retten
Die folgenden Anleitungen sollten nur in Notfällen benutzt werden, wenn Knoten anders nicht mehr erreichbar sind.
Der empfohlene Weg für normale Einstellungen ist eindeutig der [[Configmode|FAQ:Benutzung#Configmode]].

Diese Anleitungen sind für erfahrene Personen gedacht.
Das Wissen, wie man sich per Telnet verbindet und wie man sich in einer Linux-Shell bewegt, werden vorrausgesetzt.

## Failsafmode
Der Failsafemode ist für Notfälle gedacht, wenn man nicht mehr anders an den Knoten kommt.
Er ist durch Hardwarezugriff auslösbar und dann für erfahrene Nutzer gedacht.

### In den Failsafemode gelangen
In den Failsafemode kommt man per Hardwarezugriff, wenn man beim Neustart des Knotens den Reset-Knopf so lange gedrückt hält, bis die Sys-Lampe schnell blinkt.

Danach kann man sich über einen der LAN-Ports verbinden und per Telnet über die `192.168.1.1` zum Knoten verbinden.
Dabei steht kein DHCP zur Verfügung.

### Das System schreibbar machen
Standardmäßig arbeitet man erstmal nur im RAM und für dauerhafte Änderungen muss das Dateisystem explizit gemountet werden.
Dafür ist `mount_root` notwendig.

### Eine neues root-Passwort setzen
Für ein neues root-Passwort muss einfach `passwd` eingegeben werden.
Danach wird man nach dem neuen Passwort und einer Bestätigung gefragt.

### Den SSH-Server starten
Da dieser Modus nur die notwendigsten Dienste bietet, ist der SSH-Server manuell zu starten.
Dies geschieht mit `/etc/init.d/dropbear start`.
Danach kann der Knoten wie gewohnt per SSH oder SCP erreicht werden.

### Ein neues Image flashen
Nachdem der SSH-Server erfolgreich gestartet wurde, kann das neue Image nun per SCP nach `/tmp` auf den Knoten gelegt werden.
Das Flashen selbst startet mit `sysupgrade /tmp/IMAGENAME`.
Dabei kann mit der Option `-n` die Config überschrieben werden.

Das Flashen bitte nicht abbrechen oder den Knoten während des Vorgangs vom Strom trennen.
Sonst kann es dazu führen, dass das Gerät unbrauchbar wird.
