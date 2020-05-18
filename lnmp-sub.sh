#!/bin/bash
############### Debian install lnmp and add ngx_http_substitutions_filter_module ###############
#Author:https://github.com/zunsking
####################### END #######################
apt-get install wget zip unzip -y
cd /usr/local
wget https://github.com/yaoweibin/ngx_http_substitutions_filter_module/archive/master.zip
unzip master.zip
cd
wget http://soft.vpser.net/lnmp/lnmp1.6.tar.gz -cO lnmp1.6.tar.gz
tar zxf lnmp1.6.tar.gz
cd lnmp1.6
sed -i "s:Nginx_Modules_Options='':Nginx_Modules_Options='--add-module=/usr/local/ngx_http_substitutions_filter_module-master':" lnmp.conf
./install.sh lnmp
