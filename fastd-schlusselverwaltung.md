# fastd Schlüsselverwaltung

Das Repository befindet sich auf Krtek:

* Aus dem Internet: `git@srv01.luebeck.freifunk.net:fastd-keys`

Für jeden Publickey befindet sich eine Datei im Repository. Sie ist
wie folgt aufgebaut:
```
    # $name <$email>
    key "$key";
```

Die Angaben $name und $email sollen eine Kontaktaufnahme ermöglichen.
Es wäre also ausreichend dort nur eine Emailadresse zu vermerken. Bei
wichtigen Knoten, wie z.B. Gateways oder krtek, bei denen jedem bekannt
ist, wer Ansprechpartner ist, darf ggf. auf eine Kontaktadresse
verzichtet werden.

In der Commitmessage sollte die jeweilige Aktion und die betroffenen
Knoten erwähnt werden. Die Aktion ist dabei nach Möglichkeit durch ein
einzelnes Verb (englisch oder deutsch) auszudrücken. Das Zusammenfassen
von Knotennamen, wie z.B. "Fluse023..042", ist erwünscht.

Beispiele:

* Add zafer
* New Treibsand key, mark old one as stolen
* Fluse046 wegen MTU-Problemen deaktiviert
* update krtek

Falls eine Aktion, wie das deaktivieren eines Knotens, rückgängig
gemacht werden soll, ist `git revert` zu verwenden und die vorgegebene
Commitmessage zu übernehmen, falls keine besonderen Informationen
festgehalten werden müssen.

## Knoten außerhalb von Lübeck

Wir möchten vermeiden Knoten (weit) außerhalb von Lübeck mit in das Mesh aufzunehmen. Das hat derzeit hauptsächlich technische Gründe und könnte sich mit besser skalierender Technik ándern.

Deshalb nehmen wir in solchen Fällen Kontakt mit dem Betreiber auf und ermitteln den Grund für die Wahl der Lübecker Firmware.
Meistens handelt es sich um eine neue Community, die gerne Erfahrungen sammeln möchte.
Handelt es sich nur um einen einzelnen Knoten ohne die Absicht dort kurzfristig ein Mesh aufzubauen, lehnen wir ab und legen den Aufbau einer eigenen Community nahe.
Ist erkennbar, dass sich eine Community gebildet hat, nehmen wir ein bis zwei Testgeräte mit auf und notieren im Repository ein Ablaufdatum von etwa 30 Tagen.
Dazu fragen wir dem Knotenbetreiber jedoch vorher, ob dieses Angebot für ihn hilfreich wäre.

Weitere Anfragen werden, mit Verweis auf die bereits eingetragenen Testgeräte, abgelehnt. Stattdessen laden wir die Community ein uns zu besuchen.