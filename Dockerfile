FROM alpine:3.4

RUN apk --update add nginx php5-fpm git && \
    mkdir -p /var/log/nginx && \
    touch /var/log/nginx/access.log && \
    mkdir -p /run/nginx
    
ADD www /www
ADD nginx.conf /etc/nginx/
ADD php-fpm.conf /etc/php5/php-fpm.conf

RUN git clone https://docker:dockerdocker@timothywoo.git.beanstalkapp.com/docker.git /www/docker

EXPOSE 80
CMD php-fpm -d variables_order="EGPCS" && (tail -F /var/log/nginx/access.log &) && exec nginx -g "daemon off;"