FROM debian:stable

RUN apt-get update && apt-get install -y nginx openssl

COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf
RUN rm -rf /etc/nginx/sites-enabled/* && \
	ln -sf /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

RUN openssl req -new \
	-newkey rsa:2048 \
	-x509 \
	-sha256 \
	-days 3560 \
	-nodes \
	-out /etc/ssl/certs/localhost.crt \
	-keyout /etc/ssl/private/localhost.key \
	-subj "/C=$COUNTRY_CODE/ST=$STATE/L=$LOCALITY_NAME/O=$ORGANIZATION/OU=$ORGANIZATION_UNIT/CN=$COMMON_NAME"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
