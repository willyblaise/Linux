# Doing the same with NetworkManager.

nmcli con add \
	type wifi \
	ifname "wlan0" \
	ssid "eduroam" \
	wifi-sec.key-mgmt "wpa-eap" \
	802-1x.identity "example@washington.edu" \
	802-1x.password "flutterdash" \
	802-1x.system-ca-certs "yes" \
	802-1x.domain-suffix-match "washington.edu" \
	802-1x.eap "peap" \
	802-1x.phase2-auth "mschapv2" \
	;
