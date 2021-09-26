#!/usr/bin/env bash

wget 'https://github.com/openresty/set-misc-nginx-module/archive/refs/tags/v0.33.tar.gz' -O 'set-misc-nginx-module-0.33.tar.gz'
tar -xzf 'set-misc-nginx-module-0.33.tar.gz'

wget 'https://github.com/vision5/ngx_devel_kit/archive/refs/tags/v0.3.1.tar.gz' -O 'ngx_devel_kit-0.3.1.tar.gz'
tar -xzf 'ngx_devel_kit-0.3.1.tar.gz'


wget 'http://nginx.org/download/nginx-1.13.6.tar.gz'
tar -xzf nginx-1.13.6.tar.gz
cd nginx-1.13.6/

./configure --prefix=/opt/nginx \
    --with-http_ssl_module \
    --add-module=../ngx_devel_kit-0.3.1 \
    --add-module=../set-misc-nginx-module-0.33  \
    --with-cc-opt="-Wno-error=cast-function-type"

make
make install

cd ../
rm -rf set-misc-nginx-module-*
rm -rf ngx_devel_kit-*
rm -rf nginx-*