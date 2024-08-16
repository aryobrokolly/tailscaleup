#!/bin/ash
# Installation script by ARYO.

D1=/usr/sbin
D2=/usr/share
D3=/etc/tailscale
D4=/www/luci-static/resources/view/tailscale



finish(){
	echo ""
    echo "INSTALL SUCCESSFULLY ;)"
    echo ""
    echo ""
    echo ""
    echo "Next Car Loss, etc !"
    echo ""
}

download_files()
{
    	touch $DIR/logtailscale.txt
  	echo "Downloading files from repo..."
   	rm -f $D1/tailscale && wget -O $DIR/tailscale https://raw.githubusercontent.com/aryobrokolly/tailscale/main/usr/bin/tailscale && chmod +x $DIR/tailscale
 	rm -f $D1/ &&wget -O $DIR/tailscaled https://raw.githubusercontent.com/aryobrokolly/tailscale/main/usr/bin/tailscaled && chmod +x $DIR/tailscaled
  	rm -f $D1/ &&wget -O $DIR2/tailscale https://raw.githubusercontent.com/aryobrokolly/tailscale/main/etc/init.d/tailscale && chmod +x $DIR2/tailscale
    	finish
}

echo ""
echo "Aryo Install Script code from repo."

while true; do
    read -p "This will download the files into $DIR and $DIR2. Do you want to continue (y/n)? " yn
    case $yn in
        [Yy]* ) download_files; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer 'y' or 'n'.";;
    esac
done
