#!/bin/bash
#skript který periodicky zkouší, že vpnka je stále připojena. pokud spadne, nebo se odpojí, vypíše notifikaci

VPN_NAME="LesekMin"
CHECK_INTERVAL=30

sleep $CHECK_INTERVAL

while true; do
    # Get the VPN session details
    VPN_STATUS=$(openvpn3 sessions-list)

    # Check if the session with the specified config name exists and is connected
    if echo "$VPN_STATUS" | grep -q "Config name: $VPN_NAME" && echo "$VPN_STATUS" | grep -q "Status: Connection, Client connected"; then
        VPN_CONNECTED=true
    else
        VPN_CONNECTED=false
    fi

    if [[ "$VPN_CONNECTED" == false ]]; then
        notify-send "VPN '$VPN_NAME' padla na držku."
        exit 1
    fi

    sleep $CHECK_INTERVAL
done
