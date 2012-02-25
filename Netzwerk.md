Prinzipiell besteht das Freifunk Lübeck Mesh Netzwerk aus verschiedenen Schichten. Zum einen gibt es natürlich die WLAN-Router, die über die Luft ein WLAN Mesh-Netzwerk aufbauen und hier die Datenpakete weiterleiten. Wer schon "luebeck.freifunk.net" z.B. an seinem Fenster empfangen kann, aber auf der gemütlichen Wohnzimmer-Couch nicht mehr, der kann so ein vorkonfiguriertes Gerät bei uns abholen (30€ Pfand) oder [[selber zusammenbasteln|Lübeck-Freifunk-Firmware]] und muss dieses nur noch an sein Fenster stellen und an die Steckdose anschließen. Durch diesen intelligenten "WLAN-Repeater" vergrößert sich die Mesh-Wolke und der Empfang im Wohnzimmer wird möglich - und auch für die nächsten Nachbarn.

Zum zweiten gibt es verschiedene Knoten, die kleine Wolken in Lübeck durch einen verschlüsselten Tunnel durch das Internet mit einander verbinden. Wer einen schnellen Internetzugang hat (VDSL oder schneller?) und sich mit VPNs auskennt, kann somit gerne seine eigene kleine Wolke bei sich zu Hause starten. Die Internetleitung wird hierbei ''nicht'' als Ausgang für andere Mesh-Nutzer ins Internet benutzt. Siehe auch: [[IntraCityVPN]].

Zum dritten gibt es verschiedene Knoten im Mesh-Netzerk die ihre Internetleitung nicht nur für den VPN-Tunnel zur Verfügung, sondern auch anderen Benutzern direkt als Ausgang ins Internet, als sogenannter Internet-Gateway. Hierzu sollte man sich aber zuvor über die rechtlichen Konsequenzen informieren (die Gesetzeslage ist hierbei leider auch nach dem BGH-Gerichtsurteil immernoch unklar... siehe auch: [[hier|http://freifunkstattangst.de/2010/06/17/das-wlan-urteil-des-bgh-und-seine-auswirkungen-auf-offene-netze/]] und [[hier|http://www.elektrischer-reporter.de/labor/video/235/]])

[[Netzwerk:IP-Subnetze]]

## Architektur 

Bisher fahren wir die [[Komplettes-Briding|http://kbu.freifunk.net/index.php/Netzwerk-Konfiguration#Komplettes_Bridging]] Strategie. Das heißt für jedes Gerät im Mesh-Netzwerk scheint alles nur wie ein großer Switch zu sein, alles ist virtuell nur einen einzigen Hop entfernt.

[[Planung zur Dynamisches Bridging Architektur|DynamischesBridging]]

## DNS

Wir haben für unser Netz die TLD ffhl ausgewählt. Auf burgtor und holstentor läuft ein bind und die Zonefiles liegen vorerst auf https://github.com/MetaMeute/ffhl-dns

Bei Änderungswünschen könnt ihr entweder Pull Requests erstellen oder direkt tcatm@ccchl.de anmailen. In naher Zukunft wird es hoffentlich ein dezentrales System zur Verwaltung der Domains geben.

## Peerings

 * [[ChaosVPN|http://wiki.hamburg.ccc.de/index.php/ChaosVPN]] über burgtor
 * [[dn42|https://dn42.net/trac/]] über aftermath
