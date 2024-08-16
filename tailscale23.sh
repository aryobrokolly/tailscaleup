#!/bin/ash
# Installation script by ARYO.

D1=/usr/sbin
D2=/usr/share
D3=/etc/tailscale
D4=/www/luci-static/resources/view/tailscale
D5=/etc


finish(){
	echo ""
    echo "INSTALL TAILSCALE SUCCESSFULLY ;)"
    echo ""
    sleep 2
    clear
    /etc/init.d/tailscale enable
    /etc/init.d/tailscale start
    clear
    echo ""
    echo "  1 Logout and Login again"
    echo "  2 Configure: "
    echo "     Services -> Tailscale"
    echo "  3 Tutorial:"
    echo "     https://bit.ly/aryochannel"
    echo ""
    echo ""
    echo "Sertakan Sumber jika mau di kembangkan"
    echo ""
}

download_files()
{
    	touch $DIR/logtailscale.txt
  	echo "Downloading files...."
        sleep 2
        /etc/init.d/tailscale disable
        /etc/init.d/tailscale stop
        clear
  	echo "Downloading file sbin..."
        echo ""
        sleep 2
   	rm -f $D1/tailscale && wget -O $D1/tailscale https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D1/tailscale && chmod +x $D1/tailscale
        clear
        sleep 1
 	rm -f $D1/tailscaled && wget --no-check-certificate -r 'https://docs.google.com/uc?export=download&id=1hK3iwNCvb0Hgp8r7QUh7Av0hrYrfZj6r' -O $D1/tailscaled && chmod +x $D1/tailscaled
  	clear
        echo "Downloading file share..."
	echo ""
	sleep 2
   	rm -f $D2/luci/menu.d/luci-app-tailscale.json && wget -O $D2/luci/menu.d/luci-app-tailscale.json https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D2/luci/menu.d/luci-app-tailscale.json && chmod +x $D2/luci/menu.d/luci-app-tailscale.json
        clear
 	rm -f $D2/rpcd/acl.d/luci-app-tailscale.json && wget -O $D2/rpcd/acl.d/luci-app-tailscale.json https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D2/rpcd/acl.d/luci-app-tailscale.json && chmod +x $D2/rpcd/acl.d/luci-app-tailscale.json
   	clear
        echo "Mkdir $D3 & $D4..."
	echo ""
	sleep 2
        mkdir -p $D3
	mkdir -p $D4
 	echo ""
        clear
 	echo "Downloading file etc..."
        echo ""
	echo ""
        sleep 2
   	rm -f $D5/config/tailscale && wget -O $D5/config/tailscale https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D5/config/tailscale && chmod +x $D5/config/tailscale
        clear
 	rm -f $D5/hotplug.d/iface/40-tailscale && wget -O $D5/tailscale https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D5/hotplug.d/iface/40-tailscale && chmod +x $D5/hotplug.d/iface/40-tailscale
        clear
 	rm -f $D5/init.d/tailscale && wget -O $D5/init.d/tailscale https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D5/init.d/tailscale && chmod +x $D5/init.d/tailscale
        clear
 	rm -f $D5/rc.d/S90tailscale && wget -O $D5/rc.d/S90tailscale https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D5/rc.d/S90tailscale && chmod +x $D5/rc.d/S90tailscale
        clear
 	rm -f $D3/derpmap.cached.json && wget -O $D3/derpmap.cached.json https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D3/derpmap.cached.json && chmod +x $D3/derpmap.cached.json
        clear
   	rm -f $D3/tailscaled.state && wget -O $D3/tailscaled.state https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D3/tailscaled.state && chmod +x $D3/tailscaled.state
  	clear
 	echo "Downloading file www..."
        echo ""
	echo ""
        sleep 2
   	rm -f $D4/interface.js && wget -O $D4/interface.js https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D4/interface.js && chmod +x $D4/interface.js
        clear
   	rm -f $D4/setting.js && wget -O $D4/setting.js https://raw.githubusercontent.com/aryobrokolly/tailscaleup/main/$D4/setting.js && chmod +x $D4/setting.js
        clear
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
