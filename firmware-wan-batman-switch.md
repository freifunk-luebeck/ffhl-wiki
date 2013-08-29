`/etc/udhcpc.user`

  #!/bin/sh
  
  IF=br-wan

  test "$interface" == "$IF" || exit 0
  
  case "$1" in
  	deconfig)
  		batctl if add $IF
  	;;
  	renew|bound)
  		batctl if del $IF
  	;;
  esac
