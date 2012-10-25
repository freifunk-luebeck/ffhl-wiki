#!/bin/sh

ADRESSES="10.130.10.1 10.130.14.1 10.130.15.1 10.130.16.1"
TIMEOUT=30
INTERFACE="ff0"

ebtables_start() {
	ebtables -t nat -I OUTPUT --logical-out "$INTERFACE" --protocol IPv4 --ip-protocol udp --ip-destination-port 67 --ip-source-port 68 --ip-destination 10.130.10.1 --ip-source 0.0.0.0 --destination ff:ff:ff:ff:ff:ff -j dnat --to-destination de:ad:ca:fe:46:1d
	ebtables -t nat -I OUTPUT --logical-out "$INTERFACE" --protocol IPv4 --ip-protocol udp --ip-destination-port 67 --ip-source-port 68 --ip-destination 10.130.14.1 --ip-source 0.0.0.0 --destination ff:ff:ff:ff:ff:ff -j dnat --to-destination 52:54:00:ee:5c:d5
	ebtables -t nat -I OUTPUT --logical-out "$INTERFACE" --protocol IPv4 --ip-protocol udp --ip-destination-port 67 --ip-source-port 68 --ip-destination 10.130.15.1 --ip-source 0.0.0.0 --destination ff:ff:ff:ff:ff:ff -j dnat --to-destination 52:54:00:0c:bb:eb
}

ebtables_stop() {
	ebtables -t nat -I OUTPUT --logical-out "$INTERFACE" --protocol IPv4 --ip-protocol udp --ip-destination-port 67 --ip-source-port 68 --ip-destination 10.130.15.1 --ip-source 0.0.0.0 --destination ff:ff:ff:ff:ff:ff -j dnat --to-destination 52:54:00:0c:bb:eb
	ebtables -t nat -I OUTPUT --logical-out "$INTERFACE" --protocol IPv4 --ip-protocol udp --ip-destination-port 67 --ip-source-port 68 --ip-destination 10.130.14.1 --ip-source 0.0.0.0 --destination ff:ff:ff:ff:ff:ff -j dnat --to-destination 52:54:00:ee:5c:d5
	ebtables -t nat -I OUTPUT --logical-out "$INTERFACE" --protocol IPv4 --ip-protocol udp --ip-destination-port 67 --ip-source-port 68 --ip-destination 10.130.10.1 --ip-source 0.0.0.0 --destination ff:ff:ff:ff:ff:ff -j dnat --to-destination de:ad:ca:fe:46:1d
}

[ $# -eq 1 ] && [ "$1" = "ebtables_start" ] && {
	echo "Setting ebtables rules"
	ebtables_start
	exit 0
}

[ $# -eq 1 ] && [ "$1" = "ebtables_stop" ] && {
	echo "Removing ebtables rules"
	ebtables_stop
	exit 0
}


echo "Starting Gateway checks"

curtime() {
	awk -F '.' '{ print $1 }' /proc/uptime
}

timeout_reached() {
	local starttime=$1
	local curtime=`curtime`
	local timediff=$(($curtime - $starttime))

	[ $timediff -ge $TIMEOUT ] && return 0

	return 1
}

check_response() {
	local addr="$1"
	starttime=`curtime`

	while read line; do
		if echo "$line" | grep -q "^DHCPACK from $addr"; then
			echo "Got ACK from $addr!"
			pkill -TERM -P $$ 2> /dev/null
			return 0
		fi

		timeout_reached $starttime && {
			echo "No ACK found within $TIMEOUT seconds for $addr"
			return 1
		}
	done
}

check_addr() {
	local addr="$1"

	dhclient "$INTERFACE" -s $addr -1 -v -n -d -sf /dev/null 2>&1 | check_response $addr
}

for addr in $ADRESSES; do
	check_addr "$addr"
done
