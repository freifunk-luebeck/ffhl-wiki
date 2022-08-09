---
title: Infrastruktur
weight: 2
bookToc: false
---

DNS
===

- dns Einträge für technische Zwecke haben `.internal` als prefix:
  - z.B. `firmware01.internal.freifunknord.de` ist der direkt container, auf der die Firmware liegt.
    - Der muss direkt ansprechbar sein, damit die CI die Firmware hochladen kann.
    - Das der container **v6-only** ist, kann `firmware01.freifunknord.de` nicht direkt auf den container pointen
    - Zugang über http funktioniert (für v4 und v6) über `web.freifunknord.de` als reverse proxy
