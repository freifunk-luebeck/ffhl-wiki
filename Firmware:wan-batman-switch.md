`/etc/udhcpc.user`

    #!/bin/sh

    my_interface=wan

    . /usr/share/libubox/jshn.sh

    json_load "$(ubus call network.interface.${my_interface} status)"
    json_get_var my_device device

    test "$interface" == "$my_device" || exit 0

    case "$1" in                        
            deconfig)
                    batctl if add $interface
            ;;                       
            renew|bound)             
                    batctl if del $interface
            ;;                       
    esac
