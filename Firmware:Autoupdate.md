# Autoupdate

## Verwendungszweck
Mit wachsender Knotenanzahl ergibt sich zwangsläufig das Problem, dass die Knoten nur noch mit sehr hohem Aufwand aktuell gehalten werden können. Aus diesem Grund wurde ein System entwickelt, dass die Aktualisierung auf die Knoten selbst auslagert.

## Verfügbarkeit
Offiziell wird der Autoupdater ab der Firmware 0.3.3 enthalten und über den Configmode leicht konfigurierbar sein.

## Entwicklungsziele
* Der Knotenbetreiber muss selbst auf einfache Weise entscheiden können, ob er die automatische Aktualisierung wünscht.
* Die Updates müssen über ein Signaturverfahren abgesichert werden.
* Selbst wenn einige Entwickler aufhören, muss das Verfahren noch funktionieren.
* Der Server, der die Images verteilt, sollte möglichst einfach zu konfigurieren sein.
* Private Update-Server sollten möglich sein, damit das System möglichst dezentral arbeiten kann.

## Umsetzung
### Signaturen
Für das Signaturverfahren wird die Bibliothek [[ecdsautils|https://github.com/tcatm/ecdsautils]] genutzt und basiert auf der gleichen Verschlüsselungsmethode wie [[fastd|Firmware:fastd]].

Die Entwickler signieren nun die neuen Images und legen diese Signaturen zusätzlich auf den Update-Server, damit diese überprüft werden können.

### Aktualisierungsvorgang
Zu gegebener Zeit wird der Knoten bei seinem hinterlegten Update-Server nachschauen, ob es eine neue Version gibt.
Gibt es eine neue, so wird er diese mit den Signaturen herunterladen und dann prüfen, ob die Signaturen zum Image und vertrauenswürdigen Schlüsseln gehört.

Stuft er das Image als vertrauenswürdig ein, wird er dieses nun bei sich einspielen.
Zum Abschluss des Flashens wird er neustarten.

### Schlüsselzugang
Jeder Knoten vertraut einer gewissen einstellbaren Anzahl an Schlüssel.
Im Normalfall werden das die Schlüssel unserer Entwickler sein, können aber auch davon abweichen.

### Update-Server
Der Server, der die neuen Images bereitstellt, muss nur einige statische Dateien über HTTP zur Verfügung stellen und ist damit leicht konfigurierbar.
Er sollte möglichst über eine feste IP verfügen, damit er von den entsprechenden Knoten sicher gefunden werden kann.

### Eigener Update-Server
In der Regel sollte man einen Server wählen, den die Entwickler "offiziell" bereitstellen, damit man schnell die neuesten Versionen erhält.
In einigen fällen kann es aber durchaus sinnvoll sein, dass man seinen eigenen Server nutzen möchte.

Dafür muss ein eigener HTTP-Server aufgesetzt oder Webspace organisiert werden, der regelmäßig mit den neuen Versionen versorgt wird.
Möchte man nun noch sicherstellen, dass man nur selbst die Kontrolle hat, erzeugt man sich selbst einen oder mehrere Schlüssel und konfiguriert nur diese in den entsprechenden Knoten.


