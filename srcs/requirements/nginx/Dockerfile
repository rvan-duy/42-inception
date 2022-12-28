FROM alpine:latest

RUN apk --no-cache add nginx

# Replace the default NGINX configuration file with a custom one
# that enables only TLSv1.2 and TLSv1.3
COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
