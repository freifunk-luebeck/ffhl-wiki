# Git und Gitea

Einen Großteil der Organisation und Issue tracking machen wir in unserem [Gitea](https://git.luebeck.freifunk.net/).

Man kann sich dort einfach einen Account erstellen und mitmachen. Natürlich kann man auch andere Projekte dort hosten. Allerdings läuft das ganze auf einem Server, mit endlich viel Speicher, den wir priorisiert für Freifunk nutzen.

## Repos
* [site-ffhl](https://git.luebeck.freifunk.net/FreifunkLuebeck/site-ffhl): Unsere site config.
  Das Repo findet sich auch auf gitlab [gitlab](https://gitlab.com/freifunk-luebeck/site-ffhl). Wir benutzen den CI-Gedöns von gitlab.
* [ssh-keys](https://git.luebeck.freifunk.net/FreifunkLuebeck/ssh-keys): Eine Sammlung von ssh-Schlüsseln, damit man nicht jedes mal wieder nachfragen muss.
* [fastd-keys](https://git.luebeck.freifunk.net/FreifunkLuebeck/fastd-keys) (privat): Alle fastd Keys. Die gateways pullen hier regelmäßig.


# GitHub, GitLab und Gitea?
Hauptsächlich soll alles im [Gitea](https://git.luebeck.freifunk.net/) ablaufen. Da es aber nunmal so ist, dass GitHub als Plattform sehr weit verbreitet ist, veruschen wir das meiste dahin zu mirrorn.
Da GitLab ein sehr gutes und einfaches CI System hat, mirrorn wir dort auch die meisten Repos und lassen für die Firmware dort auch CI-Pipelines laufen.

## Mirror Skript
Während GitLab eingebautes mirroring hat, unterstützt GitHub das nicht und wir brauchen da ein kleines Skript, welches die Repos regelmäßig synchronisiert.

Das Skript liegt auf srv02 in `~gitmirror/git-mirror.sh`. Wenn ein weiteres eingerichtet werden soll, muss das so aussehen:
```bash
mirror_repo "<quell_url>" "<ziel_url>"

# Bsp.:
mirror_repo "https://git.luebeck.freifunk.net/FreifunkLuebeck/ffhl-wiki.git" "git@github.com:freifunk-luebeck/ffhl-wiki.git"
mirror_repo "https://git.luebeck.freifunk.net/FreifunkLuebeck/ffhl-website.git" "git@github.com:freifunk-luebeck/ffhl-website.git"
mirror_repo "https://git.luebeck.freifunk.net/FreifunkLuebeck/ffhl-dns.git" "git@github.com:freifunk-luebeck/ffhl-dns.git"
```

Der ssh-key von `gitmirror` muss auf dem Zielsystem hinterlegt sein.

Key:
```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIPD4cYtm3ar3FnN5xaCZyQ9fCS+y7yS7mRIgfrZ7srI gitmirror@ffhl-srv02
```
