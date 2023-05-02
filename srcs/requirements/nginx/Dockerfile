FROM debian:stable

# ssl

RUN apt-get update && apt-get install -y nginx

COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf
RUN rm -rf /etc/nginx/sites-enabled/* && \
	ln -sf /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf
EXPOSE 443
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
