# lnmp一键安装包增加ngx_http_substitutions_filter_module模块/ngx_cache_purge模块

添加<code>ngx_http_substitutions_filter_module</code>/<code>ngx_cache_purge</code>模块到lnmp一键安装包的<code>/lnmp1.6/lnmp.conf</code>文件的<pre>Nginx_Modules_Options=''</pre>配置中，并执行lnmp一键安装。以便实现Nginx反向代理替换和缓存清除功能。

<b>源码:</b><br>
1. lnmp一键安装包：https://github.com/licess/lnmp
2. ngx_http_substitutions_filter_module模块：https://github.com/yaoweibin/ngx_http_substitutions_filter_module
3. ngx_cache_purge模块：https://github.com/FRiCKLE/ngx_cache_purge</br></br>

<h2>1.全新安装</h2>
<hr>
一键全新安装带ngx_http_substitutions_filter_module和ngx_cache_purge模块的lnmp环境。</br></br>

<b>提示:</b><br>
1. 如lnmp版本已更新至lnmp1.7
2. CentOS请将<code>lnmp-sub.sh</code>中对应的<code>apt-get</code>改为<code>yum</code>后再执行安装
3. 如果只需要安装Nginx，请将<code>lnmp-sub.sh</code>中最后一行<code>./install.sh lnmp</code>替换为<code>./install.sh nginx</code>

<b>安装:</b>
<pre>
wget https://raw.githubusercontent.com/zunsking/lnmp-ngx_http_substitutions_filter_module-/master/lnmp-sub.sh
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
wget https://github.com/yaoweibin/ngx_http_substitutions_filter_module/archive/master.zip
unzip master.zip
cd /root/lnmp1.6
sed -i "s:Nginx_Modules_Options='':Nginx_Modules_Options='--add-module=/usr/local/ngx_http_substitutions_filter_module-master':" lnmp.conf
./upgrade.sh nginx
#输入一个最新的或者目前的Nginx版本号后回车执行
</pre>
如果<code>unzip master.zip</code>解压失败，执行<code>apt-get install zip unzip</code>后再进行解压。<br><br>

<b>其它</b><br>
如需增加其它模块，方法类似，官方模块和第三方模块格式稍有差别。<br>
参考链接：https://lnmp.org/faq/lnmp1-2-upgrade.html#nginx
