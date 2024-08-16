#!/bin/ash
# Installation script by ARYO.

D1=/usr/sbin
D2=/usr/share
D3=/etc/tailscale
D4=/www/luci-static/resources/view/tailscale
D5=/etc


finish(){
	echo ""
    echo "DOWNLOAD FILE SUCCESSFULLY ;)"
    echo ""
    echo ""
    echo ""
    echo "Next Download File depend tailscale, etc !"
    echo ""
    echo ""
}

download_files()
{
    	touch $DIR/logtailscale.txt
  	echo "Downloading files from repo..."
  	echo "Downloading file sbin..."
   	rm -f $D1/tailscale && wget -O $D1/tailscale https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D1/tailscale && chmod +x $D1/tailscale
 	rm -f $D1/tailscaled && wget -O $D1/tailscale https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D1/tailscaled && chmod +x $D1/tailscaled
  	echo "Downloading file share..."
   	rm -f $D2/luci/menu.d/luci-app-tailscale.json && wget -O $D1/luci/menu.d/luci-app-tailscale.json https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D2/luci/menu.d/luci-app-tailscale.json && chmod +x $D2/luci/menu.d/luci-app-tailscale.json
 	rm -f $D2/rpcd/acl.d/luci-app-tailscale.json && wget -O $D1/rpcd/acl.d/luci-app-tailscale.json https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D2/rpcd/acl.d/luci-app-tailscale.json && chmod +x $D2/rpcd/acl.d/luci-app-tailscale.json
   	echo "Downloading file etc..."
        mkdir -p /etc/tailscale
   	rm -f $D5/config/tailscale && wget -O $D5/config/tailscale https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D5/config/tailscale && chmod +x $D5/config/tailscale
 	rm -f $D5/hotplug.d/iface/40-tailscale && wget -O $D5/tailscale https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D5/hotplug.d/iface/40-tailscale && chmod +x $D5/hotplug.d/iface/40-tailscale
 	rm -f $D5/init.d/tailscale && wget -O $D5/init.d/tailscale https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D5/init.d/tailscale && chmod +x $D5/init.d/tailscale
 	rm -f $D5/rc.d/S90tailscale && wget -O $D5/rc.d/S90tailscale https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D5/rc.d/S90tailscale && chmod +x $D5/rc.d/S90tailscale
 	rm -f $D3/derpmap.cached.json && wget -O $D3/derpmap.cached.json https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D3/derpmap.cached.json && chmod +x $D3/derpmap.cached.json
   	rm -f $D3/tailscaled.state && wget -O $D3/tailscaled.state https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D3/tailscaled.state && chmod +x $D3/tailscaled.state
  
    	finish
}

echo ""
echo "Install luci-app-tailscale from repo Aryo Brokolly"

while true; do
    read -p "This will download the files repo. Do you want to continue (y/n)? " yn
    case $yn in
        [Yy]* ) download_files; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer 'y' or 'n'.";;
    esac
done
