---
title: "Hilfe"
weight: 200
---

# Hilfe zur Bearbeitung von Seiten hier im Wiki
Dieses Wiki ist mit [hugo](https://gohugo.io/) generiert. Die Quelldateien liegen im [Gitea](https://gitlab.com/freifunk-luebeck/ffhl-wiki)

## Seite bearbeiten
Zum bearbeiten einer Seite klicke auf der Seite ganz unten auf "Edit this page". Du wirst direkt zu
der entsprechenden Datei im [Gitea]({{< relref "git#Gitea" >}}) weitergeleitet. Du musst angemeldet
und Member des Freifunk-Teams sein, um die Seite direkt zu bearbeiten.

## Neue Seite
Das Respository, in dem du Artikel auch bearbeiten kannst, findest du [hier](https://gitlab.com/freifunk-luebeck/ffhl-wiki).



## Seitenlayout
Eine Seite im Wiki sollte immer mit einer Überschrift beginnen ('#').<br>
Alle weiteren Abschnitte dann mit h2 bzw h3 als Unterpunkten.<br>
wenn man einen zusätzlichen Zeilenumbruch benötigt, kann man dies mit dem HTML-Tag br erreichen

## Interne Links
Andere Seiten im Wiki können über einen hugo Befehl automatisch verlinkt werden:

[Gitea]({{&lt; relref &quot;git&quot; &gt;}}) wird zu `[Gitea]({{< relref "git" >}})` was dann
zu [Gitea]({{< relref "git" >}}) wird.


<br>

### Diese Seite ist noch unvollständig
Wenn du Dinge weisst, die andern helfen koennen, waere es grossartig, diese hier zu ergaenzen :)
