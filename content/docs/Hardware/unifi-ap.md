# Unifi AP flashen


https://openwrt.org/toh/ubiquiti/unifi

```
wget http://firmware.ffhl.de/stable/factory/gluon-ffhl-0.14.1-ubiquiti-unifi-ap.bin
sudo ip a add 192.168.1.21/24 dev eth0
scp -o KexAlgorithms=+diffie-hellman-group1-sha1 gluon-ffhl-0.14.1-ubiquiti-unifi-ap.bin  ubnt@192.168    .1.20:/tmp
ssh -oKexAlgorithms=+diffie-hellman-group1-sha1  ubnt@192.168.1.20
mv /tmp/gluon-ffhl-0.14.1-ubiquiti-unifi-ap.bin  /tmp/fwupdate.bin
cd /tmp
nohup syswrapper.sh upgrade2
```

wait

firefox http://192.168.1.1
