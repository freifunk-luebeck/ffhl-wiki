---
weight: 10
---

# Infrstruktur

Diese Seite soll für uns einen kleinen Überblick geben. Dinge, die wir benutzen und Zugang zu haben sollten hier eingetragen werden. Falls etwas zeitweilig nicht funktioniert, sollte das auch hier stehen. Im besten Fall mit einem Hinweis, warum das so ist. Auch wer auf gerade wo Zugang hat bzw. wen man dafuer kontaktieren muss, sollte hier stehen.

## Server

| Name              | Domain                                      | wer verwaltet den?                | Host / Kontakt        |
| ----------------- | ------------------------------------------- | --------------------------------- | --------------------- |
| gallifrey-gluon01 | gallifrey-gluon01.nodes.ffhl                | linus, paul, philipp              | Gallifrey (chaotikum) |
| [srv02](srv02)    | srv02.luebeck.freifunk.net                  | linus, paul, wonka, philipp       | Gallifrey (chaotikum) |
| hostentor         | holstentor.mesh.ffhl.chaotikum.org          | linus, paul, philipp              | johnyb (hetzner)      |
| muehlentor        | holstentor.mesh.ffhl.chaotikum.org          | linus, paul, philipp              | ffhh                  |
| kaisertor         | kaisertor.mesh.ffhl.chaotikum.org           | linus, yuna, paul, wonka, philipp | ffhh                  |
| huextertor        | huextertor.mesh.ffhl.chaotikum.org          | linus, zafer, paul, philipp       | ffoh (netcup)         |
| blueberry         | blueberry.luebeck.freifunk.net (ipv6 only)  | paul, phiilipp, linus             | nbsp                  |
| strawberry        | strawberry.luebeck.freifunk.net (ipv6 only) | paul, phiilipp, linus             | philipp               |

## DNS

- **ns1.luebeck.freifunk.net**: srv02 (5.9.249.24, 2a01:4f8:172:1ba6:1::3)
- **ns2.luebeck.freifunk.net**: huextertor (185.163.119.235, 2a03:4000:3b:53c:a4d4:5dff:fee7:d0e0)

## SSH-Keys

{{< hint danger >}}
**Achtung**: ed25519-keys funktionieren **nicht** mit gluon/openwrt
{{< /hint >}}

Weiter Keyss sind auch im [Key-repo](https://git.chaotikum.org/freifunk-luebeck/ssh-keys). (private)

| Name    | Key                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Paul    | `ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMNci5346re/3QqOhjC9PW1Zo0MA47hMm2r1GcEvdgff paul@taco`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|         | `ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFEE6VP2jNtotQHEdc+qyw9jHA8Z2Bj2BAwKyhH/SjRG paul@tapas`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
|         | `ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCmb+l54Y5QMUGJCGu0zrigfFgMU9I5Feu55b2+wPYUR8Uuz11GCbmkmive7Avj8/UWfXTOnBuEBp3o6t9VcbIHa1Dt+cU3z+BxoFyge40fQVJ2GOAmprMQIuxBsw5+1REBBJrsmYXfabWisCh8Q213DyUeAjMwYIBtH+3M3NNA0S0oNB/x4S+N7bSxHrhb06PUpG51aOWvAWjhOc+us4NRwF63dGeIKGBED3On41WoDqH875sv4myP4T8s8XXpOiAM1xubLuNLzKa/uqy1IcSLakXQUOaRnKcgkSPS9VuZzOxrpUSUn34ryXTq9rEUNGMpteOpfhT+xQv0zh+ECng6NLEmDuCRJojh26cJLAqfj5IAhpDx4FYLIQIzZIBubOsfavyew4lbKwpBE1HfPXsimxrHWmYX+zSLxUFQki9ixM9+RAYe61CeDZS/iAcP5t8ojsVUtATRd2QpBBOjv55JFFln9jk9il7zjVn9NJSU5sphc6v19Kj8tYKGzJDxM2n5FWwkP19UdOvTaIMt8c904KCkKUXqCyox+2TJGonNyiZh+5wxnKACRSBSJMxD2LZywoX1BeZPz/H6+cLP30keZ8lmvAbHCArNcc896EECFM7kRL3r4kwxVn+X21NzNAnvHTeuKB6m8RCm9rOLwUb3EXs1MlMKBCv6q/JcimSGCQ== paul@taco` |
| Philipp | `ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGFEc3u8Zffw9l7kIJRBB5p1RXHtA7LSDl6li/Zr6C1e yksflip@laptop`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
|         | `ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFNacZ7VZHJeVMowN9f/Gx6qWwy9tlFp+It3gB7hyJk1/eG0Y8TbcgQQfTdRktZu0BTecfs+e8Wuc/nTIJWbsZwpi8jGBQLMy48fKlaxUawUgri3KPwnhI9Np9vqHoezYJRD3V+sjvLOFE30y30Bh0kjMkM1zvGZeyAGLePwlanvLvJWAqIip2zMSKy3ygQEOCAU2Z2ULh16hQO9IfKE4XUxOAnMnLebMyE6CzHcjqEBbHfq4TENoqz9IpC7zThWdhQs39ACvYpLyvTgPTQzWPgmNmP3mTX0n4wwD7ri9xlR/R61tZjww2boHLPO5LoO6L90Lf0qIV1PAEK56lXUI7 yksflip@yksflip`                                                                                                                                                                                                                                                                                                                                                   |
| Linus   | `ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEApOTMJ+6z+x7jKeMRKj0imqdNdc65T+n8GKtNtf9KZjHf17K547JfDc0i4/SdCJO6Kud8gaoSm4YxhzOsJ/9c3GmyedvtyMJ1KFyTqd0PDOmvsgjviD4EfdENen55rYRwovKAHFgBN7vksgdcZcgVBCkApTrJelHVaHRukji7lNDNdA09qZBYkBPluPWA5MxFkntfarKzkSxdPnspkVmjSYYJ+PRiVJ5kcFv+FwjwmWjBSg8Ua5CSQ4kpUfCzXVXdnWKaaOcOqDkoIyr7/FHPNt9t35MpTjFrZ9s9o0DvPjaMW6fG6m0oq7IqBIZQR/iI8zTG+3LqkNwE0UH1gfidGrWLLNfZsP6HWKuJ6aUSaEBLBQV03wrj+9TDbCj4BiJHEUoG8rtPomsoP/kVuxvQhazJtGBvi2dY7lvirNrDdL+Cx3Po6DhTsJ4ScadWBjIiLJD4aN/k7WEp5i71du0PesyMiWlFyFlUXJh04OR7S7lD09s6m1bpNnyYXsyekJDbROckCZJCBd6Nq9JS0OekbFhGD2a9Yn9SZwl6qxsxvvadr0DoGVKBAo5VBOEsCFOZdQ9GPhBg8alQLBpjfG7M1rIP4Fq+5GYgsApq0SXP9HUXqpCTU1G3GKuaPO6dU1onJn9CxaJ/IrPzkbah7pLEtCypu2NjD0LXEFVfmzi/vm0=`               |
