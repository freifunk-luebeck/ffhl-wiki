# Mesh-VPN
## Grundidee
Das Mesh-VPN verbindet einzelne Freifunkrouter, die sich nicht direkt sehen können, über das Internet miteinander. Es stellt damit eine virtuelle Brücke dar.

## Funktionsweise
Die einzelnen Knoten werden mit einen vorhandenen Internetanschluss. In der Regel wird das ein eigener bereits vorhandener Router sein. Nun sind unsere Knoten standardmäßig so eingestellt, dass sie versuchen, ob sie eine Verbindung zum restlichen Mesh-VPN herstellen können. Genauer gesagt versuchen sie unsere großen Gateways [[Burgtor|Knoten:Burgtor]] und [[Holstentor|Knoten:Holstentor]] zu kontaktieren. Wenn dies gelingt, wird mit diesen eine verschlüsselte Verbindung aufgebaut und darüber ist dann der Zugang zum Rest des Netzes möglich.
Die öffentliche IP-Adresse des genutzen Internetanschlusses ist nur der Gegenseite (also den Gateways) bekannt, denn diese müssen natürlich wissen, wohin sie die Daten schicken sollen.
Diese Adresse (über die eine Identifizierung des Anschlusses & Inhabers möglich wäre) ist nicht den anderen Teilnehmern des Netzes bekannt. Sie kann auch nicht von Dritten, die den Knoten nutzen, herausgefunden werden.

## Vorteile
Der wichtigste Vorteil ist, wie bereits erwähnt, die Verbindung von Knoten, die sich sonst nicht sehen könnten.

Auch kann so die Verbindung mit Rechnern hergestellt werden, die als Server in Rechenzentren stehen. Diese können dann ihre [[Dienste|Freifunk-verwenden]] (wie Webseiten, [[VOIP]] oder [[Zugang zu anderen Netzen|Peerings]]) anbieten.

## Nachteile
Eigentlich läuft die Nutzung des Internets dem Freifunkgedanken etwas entgegen, da wir eine alternative Infrastruktur aufbauen wollen. Aber leider stellt sie zum gegenwärtigen Zeitpunkt die einzige gute Lösung dar.

Die notwendige Verschlüsselung belastet die Hardware der Router ziemlich. Auch aus diesem Grund wird die Verwendung des [[TP-Link 741nd|Firmware:741nd]] oder des besseren [[TP-Link 1043nd|Firmware:1043nd]] empfohlen. Diese sind in der Lage, die Verschlüsselung auch schnell genug zu berechnen, da sonst die Übertragungsrate deutlich einbricht.