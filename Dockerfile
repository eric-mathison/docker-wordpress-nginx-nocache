FROM nginx:1.19

ENV NGINX_ENVSUBST_OUTPUT_DIR=/etc/nginx/global

COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY conf/7g-firewall.conf /etc/nginx/conf.d/7g-firewall.conf
COPY global/locations.conf.template /etc/nginx/templates/
COPY global/7g.conf.template /etc/nginx/templates/
COPY global/proxy.conf.template /etc/nginx/templates/

RUN mkdir /etc/nginx/global

RUN sed -i 's/user  nginx/user  www-data/' /etc/nginx/nginx.conf
RUN sed -i 's/worker_processes  1;/worker_processes  auto;/' /etc/nginx/nginx.conf
RUN sed -i 's/keepalive_timeout  65;/#keepalive_timeout  65;/' /etc/nginx/nginx.conf