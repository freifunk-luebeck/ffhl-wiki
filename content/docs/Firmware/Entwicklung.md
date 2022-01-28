[Gluon-Docs](https://gluon.readthedocs.io/en/latest/user/getting_started.html)

## Getting-Started


Site-Config und gluon submodule clonen:  
```
git clone --recurse-submodules git@git.chaotikum.org/freifunk-luebeck/site-ffhl.git
```

### Signing-Key generieren

```
sudo apt install ecdsautils
ecdsakeygen -s > ffhl-private.key  # Private Key geheim halten
ecdsakeygen -p < ffhl-private.key  > ffhl-public.key 
cat ffhl-public.key 
vim ffhl-site/site.config          # Public Key  unter autoupdater hinzufügen
```

Um später damit Firmware zu signieren kann das `site-ffhl/gluon/contrib/sign.sh` script benutzt werden. Mehr zum Release Procedure [hier]({{< relref "Release-Procedure" >}})


### Lokal Testen

Dependencies installieren oder im [Docker-Container](https://git.chaotikum.org/freifunk-luebeck/gluon-build) bauen.

`scripts/build-images.sh`  
Das builden dauert recht lange, daher besser zum ausprobieren nur eine Architektur mit `GLUON_TARGET=x86_64`.
Alle möglichen targets kannst du dir mit `make -C gluon list-targets` anzeigen lassen.

### Auf Gitlab pushen

Wir benutzen zum builden die Gitlab-CI. Daher muss man da auch hinpushen. 

```
git remote add gitlab git@git.chaotikum.org:freifunk-luebeck/site-ffhl
git push gitlab master
```

https://git.chaotikum.org/freifunk-luebeck/site-ffhl/

CI builds landen hier: https://firmware.ffhl.de/nightly/

Mehr zum [Git-chaos]({{< relref "../Infrastruktur/git" >}})


## Git Branching

Neues "Features" (z.B. wireguard, neue Gluon version, etc) werden auf einem eigenemen Branch entwickelt.   
Nach erfolgreichem Build / Tests kann auf Master gemerget werden.
Kleine Änderungen können direkt auf dem Master committed werden.  
 
Für Release wird auf dem Master ein Tag gesetzt (`git tag -s v0.xx.y`)
