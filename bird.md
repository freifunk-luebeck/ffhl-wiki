# Auf den Knoten

## bird6.conf

    router id 1.2.3.4; ÄNDERN

    protocol static {
            route PREFIXÄNDERN::/64 reject;
    }

    protocol kernel {
            scan time 20;
            import none;
            export where source != RTS_STATIC;
    }

    protocol device {
            scan time 10;
    }

    protocol ospf ospf_freifunk {
            import all;
            export where source = RTS_STATIC;

            area 0 {
                    interface "br-freifunk" {
                            type nonbroadcast;
                            neighbors {
                                    fe80::dcad:caff:fefe:461d eligible; # muehlentor
                                    fe80::5054:ff:feee:5cd5 eligible; # burgtor
                                    fe80::5054:ff:fe0c:bbeb eligible; # holstentor
                            };
                            priority 0;
                    };
            };
    }
