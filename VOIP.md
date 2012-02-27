# VOIP

Wir haben am 17. Februar 2012 ein paar Erfahrungen mit VOIP und SIP im Freifunk gesammelt. VOIP im Freifunk bringt definitiv Spaß und man kann damit auch eine ziemlich gute Sprachqualität erreichen (einige Codecs schaffen sogar 48 kHz).

In der Meute steht nun ein SIP fähiges Telefon und auch paul ist via SIP zu erreichen (dort läuft Asterisk ohne weitere Konfiguration). 

## Mitmachen 

Wer mitmachen will: ${benutzername}@sip.ffhl im SIP Client einstellen und meute@sip.ffhl oder paul@sip.ffhl anrufen! Bei vielen Clients klappt es auch, wenn man nur 'meute' bzw. 'paul' anruft.

Falls ihr sip.ffhl nicht auflösen könnt, könnt ihr auch direkt die IP des SIP Servers nehmen: 10.130.0.12

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

Leider kann Android Roaming nicht richtig, sodass Verbindungen sehr schnell abbrechen, wenn man sich zu weit vom Knoten entfernt.

## Telefonbuch

Bei manchen Clients muss noch @sip.ffhl angefügt werden.

 * meute (oder direkt per IP 10.130.214.124)
 * paul
 * kaspar
 * nils (Handy)
 * nils410 (Laptop)
 * ak-mobil
 * derderwish
 * derderwish_netbook
 * neoraider

## VOIP und Freifunk

VOIP über mehrere DIR-300 funktioniert. Es gibt jedoch Aussetzer. 
