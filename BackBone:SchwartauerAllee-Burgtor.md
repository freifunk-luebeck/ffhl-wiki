# Schwartauer Allee - Burgtor

## Standorte

**Burgtor:**
 * Dachluke an der West-Seite: [[53.87423 10.69036|http://openstreetmap.org/?lat=53.874236&lon=10.689695&zoom=18&layers=M]]

Foto: [[http://krtek.ffhl/~nils/stuff/Burgtor-Dach/PANO_20130710_154003.jpg]]

Ausleuchtung (dunkel blau: freie Sicht; hell blau: ein Baum davor): [[PNG|bilder/schwartauer-burgtor.png]] [[SVG|bilder/schwartauer-burgtor.svg]]

Sowie weitere Bilder verschiedener, anderer Fenster beim Burgtor: [[http://krtek.ffhl/~nils/stuff/Burgtor-Dach/]]

**Fluse100 (Schwartauer Allee):**
 * Dach: [[53.87568592639191 10.677165985107422|http://openstreetmap.org/?lat=53.875688&lon=10.677166&zoom=18&layers=M]]

[[Video|http://www.youtube.com/watch?v=kKFVzhWoq2I&feature=share&list=UUqP-nU6QwZ8ijGhr_vomAUA]]

Fluse100 ist also leider gerade so nicht mehr im Sichtfeld zum Burgtor, ein Baum ist dazwischen

## Antennen

### Burgtor

 * Winkel: 90° horizontal, ~10-30° vertikal
 * zu Fluse100: hoher Durchsatz

#### [[AirMax Sector 2G-16-90: 2.4 GHz 2x2 MIMO Antenna (UBNT)|http://varia-store.com/Antennas/Antennas-2-4-2-5GHz/Sector-antennas-2-4-2-5GHz/AirMax-Sector-2G-16-90-2-4-GHz-2x2-MIMO-Antenna-UBNT::1054.html]]

**Vorteile:**
 * Hoher Durchsatz dank 2x2 MIMO
 * Optimaler horizontaler Winkel

**Nachteile:**
 * Hat einen eigentlich für uns unnützen, zu verschwendeten vertikalen Winkel von 90°

#### [[IT ELITE PRO-SECTOR24015dual H&V, 15dBi sector antenna, 2.4 - 2.5 GHz|http://varia-store.com/Antennas/Antennas-2-4-2-5GHz/Sector-antennas-2-4-2-5GHz/IT-ELITE-PRO-SECTOR24015dual-H-V-15dBi-sector-antenna-box-2-4::2193.html]]

**Vorteile:**
 * Hoher Durchsatz dank 2x2 MIMO
 * Optimaler horizontaler, vertikaler Winkel in Ordnung
 * Platz für ein Mikrotik RouterBOARD (könnten die neuesten/besten Atheros WLAN-Karten/Chipsätze einbauen und austauschen)

#### 3x [[IT ELITE SRA24014 DUAL - 14dBi panel antenna 2,4GHz|http://varia-store.com/Antennas/Antennas-2-4-2-5GHz/Panel-outdoor-2-4-2-5GHz/IT-ELITE-SRA24014-DUAL-14dBi-panel-antenna-2-4GHz::1486.html]]

**Vorteile:**
 * Hoher Durchsatz dank 2x2 MIMO
 * Optimaler horizontaler und vertikaler Winkel
 * Drei (relativ) unabhängige Datenströme für höheren simultanen Durchsatz zwischen Stadteilen

**Nachteile:**
 * Braucht drei Freifunk-Router
 * Sehr groß (3x 385x385x80mm = 1.15m Länge oder Höhe)
 * + Abstand zwischen Antennen um Interferenzen zu vermeiden

#### 6x [[Outdoor Panel Antenna 18dbi bg 2.4GHz, w/ Mounting Kit|http://varia-store.com/Antennas/Antennas-2-4-2-5GHz/Panel-outdoor-2-4-2-5GHz/Outdoor-Panel-Antenna-18dbi-bg-2-4GHz-w-Mounting-Kit::1759.html]]

**Vorteile:**
 * Hoher Durchsatz dank 2x2 MIMO (eine horizontal und eine vertikal polarisieren)
 * Hoher Gewinn (wird auch bei Regen perfekt funktionieren)
 * Optimaler horizontaler und vertikaler Winkel
 * Drei (relativ) unabhängige Datenströme für höheren simultanen Durchsatz zwischen Stadteilen

**Nachteile:**
 * Sehr groß (3x 263x263x30mm = 0.789m Länge, 2x 263x263x30mm = 0.526 Höhe)
 * + Abstand zwischen Antennen um Interferenzen zu vermeiden

#### 2x [[Square Grid Antenna 19dBi, 2.4GHz|http://varia-store.com/Antennas/Antennas-2-4-2-5GHz/Grid-antennas-2-4-2-5GHz/Square-Grid-Antenna-19dBi-2-4GHz::1045.html]]

**Vorteile:**
 * Hoher Durchsatz dank 2x2 MIMO (eine horizontal und eine vertikal polarisieren)
 * Noch einmal ~30% mehr Durchsatz (im Vergleich zu Sektor/Omni/Panel) weil kein CTS/RTS benötigt wird
 * HT40 sollte problemlos gehen (mehr Durchsatz)
 * Hoher Gewinn (wird auch bei Regen perfekt funktionieren)
 * Kaum anfällig gegenüber Umgebungsrauschen etc. da stark gerichtet

**Nachteile:**
 * Nur Punkt-zu-Punkt-Verbindung wegen sehr kleinem Winkel, kein horizontaler 90° Winkel
 * Groß

#### [[WiBOX PA D4M5-18HV, MIMO 4x4 directional panel, 5300-6000MHz|http://varia-store.com/Antennas/Antennas-5-0-6-0GHz/Panel-outdoor-5-0-6-0GHz/WiBOX-PA-D4M5-18HV-MIMO-4x4-directional-panel-5300-6000MHz::2057.html]]

**Vorteile:**
 * Extrem hoher Durchsatz dank 4x4 MIMO (bis zu drei mal so hoch wie 2x2 MIMO, also ~150-200MBit/s netto?)
 * HT40 sollte problemlos gehen (mehr Durchsatz)
 * Hoher Gewinn (wird auch bei Regen gut funktionieren)
 * Kaum anfällig gegenüber Umgebungsrauschen etc. da stark gerichtet und 5GHz

**Nachteile:**
 * Nur Punkt-zu-Punkt-Verbindung wegen sehr kleinem Winkel, kein horizontaler 90° Winkel
 * Software: RegDB Patch ist noch nicht upstream (könnte ich aber vermutlich dran kommen), 5GHz DFS noch nicht viel getestet

### Fluse100

 * Winkel: 360° horizontal, ~10-30° vertikal (oder auch gerne mehr, falls hoher Mast)
 * zu Burgtor: hoher Durchsatz

#### [[Omni Outdoor Antenna 15dbi bg, 2.4GHz|http://varia-store.com/Antennas/Antennas-2-4-2-5GHz/Omni-outdoor-2-4-2-5GHz/Omni-Outdoor-Antenna-15dbi-bg-2-4GHz::295.html]]

**Vorteile:**
 * Optimaler, riesiger horizontaler Winkel
 * Hohe Reichweite bei hohem Mast (Fresnel-Zone beachten)
 * Relativ günstig im Verhältnis zur abgedeckten Fläche

**Nachteile:**
 * Geringe Reichweite bei niedrigem Mast trotz Sichtverbindung und hohem Gewinn (Fresnel-Zone beachten)
 * Zu kleiner vertikaler Winkel für Fenster oder tiefere Dächer an nahe gelegenen Häusern
 * Sehr schnell geringer Durchsatz bei mehreren, simultanen Verbindungen (WLAN ist ein shared-Medium)

#### 5x [[AirMax Sector 2G-16-90: 2.4 GHz 2x2 MIMO Antenna (UBNT)|http://varia-store.com/Antennas/Antennas-2-4-2-5GHz/Sector-antennas-2-4-2-5GHz/AirMax-Sector-2G-16-90-2-4-GHz-2x2-MIMO-Antenna-UBNT::1054.html]]

**Vorteile:**
 * Riesige abgedeckte Fläche falls mit hohem Mast
 * Hoher Durchsatz dank 2x2 MIMO
 * Optimaler horizontaler Winkel (optimaler vertikaler Winkel, falls mit hohem Mast)
 * Fünf unabhängige Datenströme für höheren simultanen Durchsatz zwischen Stadteilen

**Nachteile:**
 * Sehr teuer
 * Hoher Mast braucht Baugenehmigung?
 * Bei tiefem Mast hat die Antenne einen eigentlich für uns unnützen, verschwendeten vertikalen Winkel von 90°

#### Richtfunk zum Burgtor

wie [[Square Grid Antenna 19dBi, 2.4GHz|http://varia-store.com/Antennas/Antennas-2-4-2-5GHz/Grid-antennas-2-4-2-5GHz/Square-Grid-Antenna-19dBi-2-4GHz::1045.html]], [[WiBOX PA D4M5-18HV, MIMO 4x4 directional panel, 5300-6000MHz|http://varia-store.com/Antennas/Antennas-5-0-6-0GHz/Panel-outdoor-5-0-6-0GHz/WiBOX-PA-D4M5-18HV-MIMO-4x4-directional-panel-5300-6000MHz::2057.html]]

Beschreibungen siehe oben.

## Außerdem

Nicht vergessen:
 * In der Software muss bei Sektor und Rundstrahlern mit großer Abdeckung unbedingt CTS/RTS aktiviert werden.
 * HT40 wird bei 2.4GHz mit anderen Access-Points im Sichtfeld nicht funktionieren (ca. halb so hoher Durchsatz). 5GHz oder Richtverbindungen haben das Problem eher weniger.
