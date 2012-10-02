#Großer Mobilknoten/Relay

##Motivation:
In manchen Einsatzsituationen kommt es vor, das ein normaler Mobilknoten nicht mehr ausreicht, es aber nicht möglich ist, normale Hardware(Server, Netzwerkinfrastruktur) einzusetzen. 
Diese Lücke zwischen Mobilknoten und stationärer Infrastruktur soll der große Mobilknoten schließen.
Dazu muss er zusätzlich zu den Aufgaben, als Uplink zu dienen und Meshverbindungen aufzubauen noch weitere Aufgaben erfüllen:

1. Erweiterte Meshfunktionalität: Neben dem lokalen Wlan, sollte der Knoten noch mindestens eine, um als Relay dienen zu können eher zwei, Richtfunkverbindungen aufbauen können.
2. Er sollte als mobiler Uplink arbeiten können. Dazu bietet sich UMTS oder LTE an.
3. Als Relay müsste ein längerer (z.b. 1 Woche) autonomer Betrieb möglich sein.
4. Er sollte in der Lage sein ein eigenes Netzwerk aufzuspannen, auch per Lan. Das wäre z.b. sinnvoll, wenn man
einen Stand betreibt und Netzwerk/Internet benötigt.
5. Schlußendlich, muss er noch vernünftig transportabel sein, aber trotzdem robust genug um unterschiedlichen Witterungsbedingungen zu widerstehen.

##Planung:
Als Basis für den Knoten dient eine wasserdichte Alukiste. In ihr sollen alle Komponenten fest eingebaut werden und zusätzlich etwas Stauraum für Zubehör vorhanden sein. Die Stromversorgung sollen 1 oder 2 Autobatterien übernehmen (12 V 55Ah). Die Batterien sollen über ein intigriertes Ladegerät geladen werden können. Spannungswandler übernehmen die Umwandlung der 12V auf 9V bzw 5V die von den Komponenten benötigt werden. 
Das komplette System soll von einem Arduino kontrolliert werden, der unterschiedliche Parameter misst (Spannung, Temperatur etc) und entsprechend reagiert. Zusätzlich wird dieser per Netzwerk erreichbar sein und so Fernkontrolle der Hardware ermöglichen (z.b. Router oder eine Heizung einschalten/ausschalten).
Für Richtfunkverbindungen könnte man 2 Tp-Link 741 Router oder ein Alix Board verwenden. 

##Ansprechpartner:
Derzeit ist Erik (berik) für dieses Projekt verantwortlich. Er ist per IRC erreichbar.

