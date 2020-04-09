#!/bin/sh

#modprobe -r ath9k
#modprobe ath9k

WIFI_MODULES="compat/compat.ko net/wireless/cfg80211.ko net/mac80211/mac80211.ko compat/sch_fq_codel.ko drivers/net/wireless/ath/ath.ko drivers/net/wireless/ath/ath9k/ath9k_hw.ko drivers/net/wireless/ath/ath9k/ath9k_common.ko drivers/net/wireless/ath/ath9k/ath9k.ko drivers/net/wireless/ath/ath9k/ath9k_htc.ko"
#WIFI_MODULES_DIR="/var/batman/compat-wireless/compat-wireless-3.6-rc7-1"
WIFI_MODULES_DIR="/var/batman/compat-wireless/compat-wireless-2012-09-07"

reverse() {
	out=""
	for w in $1; do
		out="$w $out"
	done
	echo $out
}

load_wifi_modules() {
	for module in $WIFI_MODULES; do
		insmod "$WIFI_MODULES_DIR"/"$module"
	done
}

unload_wifi_modules() {
	for module in $(reverse "$WIFI_MODULES"); do
		rmmod "$WIFI_MODULES_DIR"/"$module"
	done
}

unload_wifi_modules
load_wifi_modules

iw reg set DE

ifconfig wlan0 down
macchanger -m 02:13:13:13:13:13 wlan0
iwconfig wlan0 mode ad-hoc
iwconfig wlan0 channel 1
iwconfig wlan0 essid "02:d1:11:37:fc:38" ap 02:d1:11:37:fc:38
ifconfig wlan0 mtu 1528
ifconfig wlan0 up

iw phy phy0 interface add wlan1 type managed
sleep 5
FOO=`dmesg | tail -n50 | grep "udev.*renamed network interface wlan1 to" | tail -n1 | sed "s/.*renamed network interface wlan1 to //"` && \
	[ -n "$FOO" ] && {
	echo "FOO is: $FOO"
	ip link set dev "$FOO" name wlan1
}
macchanger -m 06:13:13:13:13:13 wlan1

brctl addbr ff0

modprobe -r batman-adv
insmod /var/batman/batman-adv-2012.3.0.ko

/var/batman/batctl/batctl-2012.3.0/batctl if add wlan0
/var/batman/batctl/batctl-2012.3.0/batctl gw client

brctl addif ff0 bat0

ifconfig bat0 up

killall hostapd
sleep 5
hostapd -B /etc/hostapd/hostapd-ff.conf

ifconfig ff0 down
ifconfig ff0 up

killall dhclient
dhclient ff0
