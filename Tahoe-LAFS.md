# Tahoe-LAFS

## Idee
Tahoe-LAFS stellt ein verteiltes und verschlüsseltes Dateisystem bereit.

## Umsetzung
Im Netzwerk laufen einige Knoten, die Speicherplatz zur Verfügung stellen und beliebige Daten von speichern und bereitstellen.
Über Tahoe-LAFS-Clients können nun Daten in diese Wolke geschoben werden. Diese werden dabei auf dem lokalen Client verschlüsselt und redundant im Netzwerk ablegt.

## Vorteile
Durch die Redundanz können auf Tahoe-LAFS-Knoten ausfallen und trotzdem bedeutet das nicht direkt Datenverlust. Standardmäßig benötigt man ca. 3 von 10 Teilen einer Datei, damit diese dann wieder korrekt zusammen gesetzt werden kann.

Durch das verschlüsselte Ablegen der Daten ist sichergestellt, dass die Betreiber der Knoten selbst nicht wissen, was sie da speichern und nicht darauf zugreifen können.

## Notwendige Software und Einstellungen
Die Software funktioniert nur unter unixoiden Betriebssystemen.

Zum Betrieb eines Tahoe-LAFS-Knotens muss von [https://tahoe-lafs.org] die Datei [https://tahoe-lafs.org/source/tahoe-lafs/releases/allmydata-tahoe-1.9.2.zip allmydata-tahoe-1.9.2.zip] herunter geladen werden, wenn die aktuelle Version 1.9.2 nicht im jeweiligen Repository der Distribution. Diese muss dann entpackt werden. Mit ''sudo setup.py build''  & ''sudo setup.py install'' bauen und installieren.

Mit ''bin/tahoe start'' wird der lokale Knoten gestartet. Beim ersten Start wird dann ein ''.tahoe''-Ordner im home-Verzeichnis angelegt. In dessen ''tahoe.cfg''-Datei muss dann noch unter ''introducer.furl'' ein Link zu unserer Wolke eingefuegt werden, den es gern auf Anfrage gibt.

## Verwendung
Wenn der lokale Knoten läuft, kann man dessen Web-interface mit einem beliebigen Browser über [http://localhost:3456] erreichen.

## Weitere Infos
Unter [https://tahoe-lafs.org] sind nähere Informationen verfügbar.
