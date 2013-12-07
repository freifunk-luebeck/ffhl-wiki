# Knoten retten
Die folgenden Anleitungen sollten nur in Notfällen benutzt werden, wenn Knoten anders nicht mehr erreichbar sind.
Der empfohlene Weg für normale Einstellungen ist eindeutig der [[FAQ/Benutzung#Configmode|Configmode]].

Diese Anleitungen sind für erfahrene Personen gedacht.
Das Wissen, wie man sich per Telnet verbindet und wie man sich in einer Linux-Shell bewegt, werden vorrausgesetzt.

## Failsafmode
Der Failsafemode ist für Notfälle gedacht, wenn man nicht mehr anders an den Knoten kommt.
Er ist durch Hardwarezugriff auslösbar und dann für erfahrene Nutzer gedacht.

### In den Failsafemode gelangen
In den Failsafemode kommt man per Hardwarezugriff.
Wie man in den Failsafemode kommt, ist unter [[Benutzung#Failsafemode|Benutzung]] beschrieben. 

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
