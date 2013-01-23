# fastd Schlüsselverwaltung

Das Repository befindet sich auf krtek:

Aus dem Freifunk:            ssh://git@krtek.ffhl/fastd-keys 
Aus dem Internet (nur IPv6): ssh://git@metameute.de/fastd-keys

Für jeden Publickey befindet sich eine Datei im Repository. Sie ist
wie folgt aufgebaut:

    # $name <$email>
    key "$key";

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

    Add zafer
    New Treibsand key, mark old one as stolen
    Fluse046 wegen MTU Problemen deaktiviert
    update krtek

Falls eine Aktion, wie das deaktivieren eines Knotens, rückgängig
gemacht werden soll, ist `git revert` zu verwenden und die vorgegebene
Commitmessage zu übernehmen, falls keine besonderen Informationen
festgehalten werden müssen.