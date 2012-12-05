# FAQ - Router-Benutzung

## VPN Verbindung bricht von alleine ab. Neustart hilft.

Für das VPN wird das verbindungslos arbeitende UDP verwendet. Einige Heimrouter (= Gerät zwischen Freifunkknoten und Internet) haben damit Probleme, z.B. wenn sich die IP bei einer 24h-Trennung ändert. Abhilfe ist für die nächste Firmwareversion (0.3.2) geplant. Bis dahin hilft ein Cronjob oder eine Zeitschaltuhr.
