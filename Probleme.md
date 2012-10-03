# Probleme

Aas der Struktur unseres Netzes heraus ergeben sich natürlich einige Besonderheiten, die beachtet werden sollten.

## Verschlüsselung

In unserem Netz findet die Kommunikation zwischen 2 Knoten prinzipiell unverschlüssselt statt. Jeder könnte damit prinzipiell Alles mithören ändern.
Dieses Problem betrifft aber nicht nur unser Netz, denn auch im Internet werden Daten normalerweise im Klartext übertragen (Bei verschlüsselten Funknetzwerken ist auch nur die Verbindung Rechner-Router verschlüsselt und zum Provider wird dann unverschlüsselt übertragen.).

Um dem entgegen zu wirken, sollte der Datenverkehr mitt einer Ende-zu-Ende-Verschlüsselung gesichert werden. Bei diesem können nur der Absender (z.B. der eigene Rechner) und der Empfänger (z.B. der Mail-Server) di Inhalte lesen. Um die Benutzung dieser Verfahren zu vereinfachen, wurden Protokolle wie SSL (z.B. für IMAP, HTTPS usw.) erfunden.

Ausführliche Informatinen befinden sich [[hier|Verschlüsselung]].