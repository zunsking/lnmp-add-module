#!/bin/bash
############### Debian install lnmp and add ngx_http_substitutions_filter_module ###############
#Author:https://github.com/zunsking
####################### END #######################
apt-get install wget zip unzip git -y
cd /usr/local
git clone git://github.com/FRiCKLE/ngx_cache_purge.git
git clone git://github.com/yaoweibin/ngx_http_substitutions_filter_module
cd
wget http://soft.vpser.net/lnmp/lnmp1.7.tar.gz -cO lnmp1.7.tar.gz
tar zxf lnmp1.7.tar.gz
cd lnmp1.7
sed -i "s:Nginx_Modules_Options='':Nginx_Modules_Options='--add-module=/usr/local/ngx_http_substitutions_filter_module --add-module=/usr/local/ngx_cache_purge':" lnmp.conf
./install.sh lnmp
