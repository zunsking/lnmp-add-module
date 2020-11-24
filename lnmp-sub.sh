#!/bin/bash
############### Debian install lnmp and add ngx_http_substitutions_filter_module ###############
#Author:https://github.com/zunsking
####################### END #######################
apt-get install wget zip unzip git -y
cd /usr/local
git clone git://github.com/FRiCKLE/ngx_cache_purge.git
git clone git://github.com/yaoweibin/ngx_http_substitutions_filter_module
git clone git://github.com/openresty/headers-more-nginx-module.git
cd
wget https://raw.githubusercontent.com/zunsking/lnmp-add-module/master/bakup/backup.sh
wget http://soft.vpser.net/lnmp/lnmp1.7.tar.gz -cO lnmp1.7.tar.gz && tar zxf lnmp1.7.tar.gz
cd lnmp1.7
sed -i "s:Nginx_Modules_Options='':Nginx_Modules_Options='--add-module=/usr/local/ngx_http_substitutions_filter_module --add-module=/usr/local/ngx_cache_purge --add-module=/usr/local/headers-more-nginx-module':" lnmp.conf
#./install.sh lnmp
chmod +x *.sh
echo "Choose install:"
echo ""
echo " 1: Install full LNMP"
echo " 2: Install full LAMP"
echo " 3: Install full LNMPA"
echo " 4: Only install Nginx"
echo " 5: Only install DB"
echo ""
read -p "(Directly Enter to cancel), Enter 1 or 2,3,4,5:" install
if [[ '1' = "$install" ]]; then
    eval "./install.sh lnmp"
elif [[ '2' = "$install" ]]; then
    eval "./install.sh lamp"
elif [[ '3' = "$install" ]]; then
    eval "./install.sh lnmpa"
elif [[ '4' = "$install" ]]; then
    eval "./install.sh nginx"
elif [[ '5' = "$install" ]]; then
    eval "./install.sh db"
else
    echo "Install canceled."
    exit
fi
