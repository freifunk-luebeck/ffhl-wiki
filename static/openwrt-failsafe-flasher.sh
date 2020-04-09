#!/bin/sh

IMGNAME=openwrt-combined-image.bin
REMOTE_IPADDR="192.168.1.1"
LOCAL_IPADDR="192.168.1.5"
PORT="23"

NC_PORT="8561"
IMG="$1"

print_usage() {
	echo "Usage: $0 <image-file>"
}

check_arguments() {
	[ -z "$IMG" ] && {
		echo "No image file specified"
		print_usage
		exit
	}

	[ ! -f "$IMG" ] && {
		echo "Specified image file does not exist"
		print_usage
		exit
	}
}

check_ip() {
	RET=0
	for i in `seq 1 2`; do
		ping -q -c 1 "$REMOTE_IPADDR" > /dev/null
		[ "$?" = "0" ] && {
			RET="1"
			break
		}
	done

	[ "$RET" = "1" ] && return

	echo "Couldn't reach the router on \"$REMOTE_IPADDR\""
	echo "Maybe your router is not in OpenWRT's failsafe mode?"
	echo "Maybe your computer is not set to $LOCAL_IPADDR/24?"

	exit
}

transfer_image() {
	echo "Uploading image file..."
	nc -l -p $NC_PORT -q 10 < "$IMG" &

	RET="`echo "nc $LOCAL_IPADDR $NC_PORT > /tmp/$IMGNAME; exit" | \
				nc $REMOTE_IPADDR $PORT`"

	echo "$RET" | grep -q "BusyBox" || {
		echo "Invalid device (no BusyBox available?)"
		exit
	}
	echo "$RET" | grep -q "Backfire" || {
		echo "Invalid device (not an OpenWRT _Backfire_ router?)"
		exit
	}

	LINES=$((`echo "$RET" | wc -l` + 1))
#	echo "Prompt has `echo "$RET" | wc -l` lines"
}

check_image() {
	echo -n "Verifying uploaded image file... "
	MD5_REMOTE="`echo "md5sum /tmp/$IMGNAME; exit" | \
				nc $REMOTE_IPADDR $PORT | \
				tail -n1 | cut -d' ' -f1`"
	MD5_LOCAL="`md5sum $IMG | tail -n 1 | cut -d' ' -f1`"

	echo -n "$MD5_REMOTE - "
	if [ "$MD5_REMOTE" = "$MD5_LOCAL" ]; then
		echo "Ok!"
	else
		echo "Failed!"
		exit
	fi
}

check_free_ram() {
	RAM=`echo "free; exit" | nc $REMOTE_IPADDR $PORT | tail -n +$LINES | \
					grep 'Mem:' | sed 's/^[ ]*//' | \
					sed 's/[ ]\+/ /g' | cut -d' ' -f4`
	FILESIZE=$((`ls -la "$IMG" | sed 's/[ ]\+/ /g' | cut -d' ' -f5` / 1024 + 250))

	echo -n "Checking available RAM... ${RAM}KB - "
	if [ $FILESIZE -ge $RAM ]; then
		echo "Failed!"
		exit
	else
		echo "Ok!"
	fi
}

flash_image() {
	echo "Flashing image..."
#	trap "" INT TERM EXIT
	echo "!!! Warning, do not turn off the device until the \"Upgrade completed\" message (might take 15min.)!!!"
	SAFE="mount_root; [ ! -f /lib/upgrade/keep.d/tinc ] && echo '/etc/tinc/' > /lib/upgrade/keep.d/tinc"

#	echo "sysupgrade -n -v /tmp/$IMGNAME" | nc $REMOTE_IPADDR $PORT | tail -n +$LINES | sed "s/^/  /"
#	echo "sysupgrade -d 5 -n -v /tmp/$IMGNAME; echo \"Success!\"; exit" | nc $REMOTE_IPADDR $PORT | tail -n +$LINES | sed "s/^/  /"

#	echo "sysupgrade -d 5 -n -v /tmp/$IMGNAME; echo \"Success!\"; exit" | nc $REMOTE_IPADDR $PORT
	echo "$SAFE; sysupgrade -d 5 -v /tmp/$IMGNAME; echo \"Success!\"; exit" | nc $REMOTE_IPADDR $PORT
#	trap - INT TERM EXIT
}

check_arguments
check_ip
transfer_image
check_image
check_free_ram
flash_image

