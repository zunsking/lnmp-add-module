# lnmp一键安装包增加ngx_http_substitutions_filter_module模块/ngx_cache_purge模块

添加额外的模块到LNMP中。

<b>源码 / 模块:</b><br>
1. lnmp一键安装包：https://github.com/licess/lnmp
2. ngx_http_substitutions_filter_module模块：https://github.com/yaoweibin/ngx_http_substitutions_filter_module
3. ngx_cache_purge模块：https://github.com/FRiCKLE/ngx_cache_purge</br></br>
4. headers-more-nginx-module模块：https://github.com/openresty/headers-more-nginx-module

<h2>1.全新安装</h2>
<hr>
一键全新安装带ngx_http_substitutions_filter_module和ngx_cache_purge模块的lnmp环境。</br></br>

<b>提示:</b><br>
1. lnmp版本已更新至lnmp1.7
2. CentOS请将<code>lnmp-sub.sh</code>中对应的<code>apt-get</code>改为<code>yum</code>后再执行安装
3. 建议在<code>screen</code>中安装：<code>apt-get install screen -y</code>，然后<code>screen -S lnmp</code>，再执行安装脚本。</br></br>

<b>安装:</b>
<pre>
wget https://raw.githubusercontent.com/zunsking/lnmp-ngx_http_substitutions_filter_module/master/lnmp-sub.sh
chmod +x lnmp-sub.sh
./lnmp-sub.sh
</pre>

<b>例子</b>
<pre>
server {
    listen 80;
    server_name www.xxx.com;
    location / {
        proxy_pass http://localhost:8080;
        subs_filter 'www.xxx.com' 'www.yyy.com';
    }
}
</pre>
替换中文可能需要将域名配置文件编码为UTF-8

<h2>2.现有安装增加模块</h2>
<hr>
已经安装好的lnmp上增加模块。</br></br>
根目录下逐步执行：
<pre>
cd /usr/local
git clone git://github.com/FRiCKLE/ngx_cache_purge.git
git clone git://github.com/yaoweibin/ngx_http_substitutions_filter_module
cd /root/lnmp1.7
sed -i "s:Nginx_Modules_Options='':Nginx_Modules_Options='--add-module=/usr/local/ngx_http_substitutions_filter_module --add-module=/usr/local/ngx_cache_purge':" lnmp.conf
./upgrade.sh nginx
#输入一个最新的或者目前的Nginx版本号后回车执行
</pre>
<br><br>

<b>其它</b><br>
如需增加其它模块，方法类似，官方模块和第三方模块格式稍有差别。<br>
参考链接：https://lnmp.org/faq/lnmp1-2-upgrade.html#nginx
