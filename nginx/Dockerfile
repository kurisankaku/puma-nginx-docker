FROM alpine:latest
ENV NGINX_VERSION 1.15.1
RUN apk --update add pcre-dev openssl-dev zlib-dev gcc curl gd-dev libxml2-dev libxslt-dev \
  && apk add --virtual build-dependencies build-base curl \
  && curl -SLO http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz \
  && tar xzvf nginx-${NGINX_VERSION}.tar.gz \
  && cd nginx-${NGINX_VERSION} \
  && ./configure \
        --prefix=/usr/share/nginx \
        --conf-path=/etc/nginx/conf/nginx.conf \
        --sbin-path=/usr/local/sbin/nginx \
        --http-log-path=/var/log/nginx/access.log \
        --error-log-path=/var/log/nginx/error.log \
        --lock-path=/var/lock/nginx.lock \
        --pid-path=/var/run/nginx.pid \
        --http-client-body-temp-path=/var/lib/nginx/body \
        --http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
        --http-proxy-temp-path=/var/lib/nginx/proxy \
        --http-scgi-temp-path=/var/lib/nginx/scgi \
        --http-uwsgi-temp-path=/var/lib/nginx/uwsgi \
        --with-debug \
        --with-pcre-jit \
        --with-http_dav_module \
        --with-http_ssl_module \
        --with-http_stub_status_module \
        --with-http_realip_module \
        --with-http_gunzip_module \
        --with-http_gzip_static_module \
        --with-http_image_filter_module \
        --with-http_v2_module \
        --with-http_xslt_module \
        --with-stream \
        --with-stream_ssl_module \
        --with-mail \
        --with-mail_ssl_module \
        --with-threads \
  && make \
  && make install \
  && ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log \
  && mkdir /var/lib/nginx \
  && cd / \
  && apk del build-dependencies \
  && rm -rf \
       nginx-${NGINX_VERSION} \
       nginx-${NGINX_VERSION}.tar.gz \
       /var/cache/apk/* \
  && mkdir -p /var/www/front
COPY ./nginx* /etc/nginx/conf/
COPY ./health.txt /usr/share/nginx/html/
COPY ./front /var/www/front/
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
