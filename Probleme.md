# Probleme
Durch die Struktur unseres Netzes ergeben sich einige Besonderheiten, die bei seiner Verwendung beachtet werden sollten.

## Verschlüsselung
In unserem Netz findet die Kommunikation zwischen 2 Knoten prinzipiell unverschlüsselt statt. Jeder Netzwerk-Teilnehmer kann somit grundsätzlich den gesamten Datenverkehr mithören und ändern.
Dies betrifft aber nicht nur unser Netz, denn auch im Internet werden Daten normalerweise im Klartext übertragen. So betrifft beispielsweise die Verschlüsselung von verschlüsselten Funknetzwerken auch nur die Verbindung vom eigenen Rechner zum DSL-Router. Die weitere Verbindung zum Provider und darüber hinaus ist dann wieder unverschlüsselt, falls keine weiteren Maßnahmen ergriffen wurden.

Um die Sicherheit der eigenen Daten zu erhöhen, sollte der eigene Datenverkehr daher mit einer sogenannten Ende-zu-Ende-Verschlüsselung gesichert werden. Hierbei können nur der Absender (z.B. der eigene Rechner) und der Empfänger (z.B. der Mail-Server) die Inhalte lesen. Um die Benutzung dieses Verfahrens zu vereinfachen, wurden Protokolle wie SSL (z.B. für IMAP, HTTPS usw.) erfunden. 

E-Mail-Klienten und andere Software kann angewiesen werden diese sicheren Protokolle zu benutzen. Besonders einfach geht dies beim Browsen durch Benutzung von HTTPS statt HTTP. Die Browser-Erweiterung [[HTTPS Everywhere|https://www.eff.org/https-everywhere]] von der [[Electronic Frontier Foundation|https://www.eff.org/]] wählt dieses sichere Protokoll automatisch, wenn es von der angesurften Website unterstützt wird. Bei E-Mail-Klienten kann wiederum beispielsweise die Verschlüsselungsart SSL/TLS für Verbindungen zum Mail-Server ausgewählt werden.
