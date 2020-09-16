FROM nginx:1.19.2


RUN rm -f /etc/nginx/conf.d/*


ADD nginx.conf /etc/nginx/conf.d/chefs_office_working.conf


CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf