#!/bin/bash


DEST="./ffhl"
SECRET=$(fastd --generate-key | awk '/Secret/ {print $2 }')
# generate a random address and hope its not already used
IPADDRESS="10.130.$(( 16 + $RANDOM % 15)).$(( 1 + $RANDOM % 254))"

mkdir -p $DEST

cat - > $DEST/fastd.conf << EOF
log to syslog level debug;
interface "ffhl";
secret "$SECRET";
mode tap;
secure handshakes yes;
method "salsa2012+umac";
mtu 1500;
peer limit 1;

on up "./fastd-up";

include peers from "peers";
EOF



# setup remote peer
mkdir -p $DEST/peers
cat - > $DEST/peers/vpn_gw << EOF
key "812e7282ebf33f5203cb120a820acf731482cae694b8c08ece3f81faec6cd725";
remote "pablo.0x000.net" port 9999;
EOF

# ip setup script
cat - > $DEST/fastd-up << EOF
#!/bin/sh

ip address add ${IPADDRESS}/16 dev \$INTERFACE
ip link set \$INTERFACE up
EOF

chmod a+x $DEST/fastd-up

echo "=========================================================="
echo "!!!!! send this key to someone !!!!!"
echo "run 'fastd --show-key -c $DEST/fastd.conf' to see it again"
echo "you also want to move $DEST to /etc/fastd/"
echo "   sudo mv $DEST to /etc/fastd/"
echo
fastd --show-key -c $DEST/fastd.conf
