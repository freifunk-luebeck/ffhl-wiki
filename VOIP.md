# VoIP - Internettelefonie

Im Freifunk konnten wir bereits seit einiger Zeit Erfahrungen mit VoIP sammeln. Es bringt definitiv Spaß, da eine recht gute Sprachqualität erreicht werden kann. Wenn Du Lust hast, bist du herzlich zum Ausprobieren eingeladen.

In der Meute steht nun ein SIP-fähiges Telefon. Auch Paul ist via SIP zu erreichen, denn dort läuft ein Asterisk-Telefonserver. Dieser nimmt immer ab und spielt für Testzwecke Audiodateien ab. 

## Mitmachen 

Wer mitmachen will, sollte sich zuerst einen freien Nutzernamen wählen und diesen dann mit _NUTZERNAME_@&zwj;sip.ffhl im SIP Client einstellen. Danach sollte man für Tests meute@&zwj;sip.ffhl oder paul@&zwj;sip.ffhl anrufen! Bei vielen Clients klappt es auch, wenn man nur 'meute' bzw. 'paul' anruft.

Falls es nicht mit sip.ffhl klappt, kann auch direkt die IP des SIP-Servers (10.130.0.12) genommen werden.

## SIP Clients 

### Linux

 * twinkle
 * ekiga (Damit gab es ein paar Probleme beim Anruf des Meutetelefons)

### Android

 * [[csipsimple|http://code.google.com/p/csipsimple/]] funktioniert ziemlich gut
   Installation (Ihr solltet dabei natürlich im Freifunk WLAN sein.)
    1. APK von hier http://nightlies.csipsimple.com/trunk/CSipSimple-latest-trunk.apk installier
    2. Im Assistenten Basic auswählen
    3. Kontoname ist frei wählbar
    4. Benutzername ist euer Nickname über den ihr erreichbar seid. z.B. "meute" oder "paul"
    5. SIP Server: sip.ffhl (Falls das nicht klappt: 10.130.0.12)
    6. Passwort: Hier müsst ihr etwas eingeben, aber es wird (vorerst) nicht ausgewertet. Ein Leerzeichen reicht also.
    7. Zum Testen im Wählfenster auf 'txt' klicken und 'paul' oder 'meute' anrufen.
        
 * sipdroid (kann nicht immer von twinkle angerufen werden)

### IPhone/IPod

 * [[Media5-Fone|http://www.media5corp.com/softphones/media5-fone-iphone]]
 * [[3CX Phone|http://itunes.apple.com/us/app/3cxphone-voip-sip-softphone/id392927995?mt=8]]

Leider kann Android Roaming nicht richtig, sodass Verbindungen durchaus abbrechen, wenn man sich zu weit vom aktuellen Knoten entfernt.

## Telefonbuch

Bei manchen Clients muss noch @&zwj;sip.ffhl angefügt werden.

 * meute (oder direkt per IP 10.130.14.58)
 * paul
 * kaspar
 * nils (Handy)
 * nils410 (Laptop)
 * ak-mobil
 * derderwish
 * neoraider

### Vanity Nummern

Alle Telefonnummern sind auch als [[Vanity-Nummer|http://de.wikipedia.org/wiki/Vanity-Nummer]] erreichbar. D.h. statt **meute** kann auch **63883** gewählt werden. Dies soll in Zukunft dazu dienen die Telefone auch aus dem Festnetz erreichbar zu machen. Bei Mehrdeutigkeit ist das Verhalten derzeit undefiniert.

### Aus dem Festnetz

Weiterhin sind alle SIP Telefone aus dem Festnetz erreichbar:

 1. **045130504399** anrufen
 2. Ansage abwarten
 3. Vanity nummer + **#** eingeben. (z.B. **63883#** für die Meute) 

## Erfahrungsberichte

 * VOIP über mehrere DIR-300 funktioniert. Es gibt jedoch Aussetzer. 

 * VOIP mit einem Nokia N900 (nativer SIP Client) funktioniert auch mit Roaming erstaunlich gut.
