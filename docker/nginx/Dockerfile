FROM nginx:alpine
COPY ./conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY ./conf.d/nginx.conf /etc/nginx/nginx.conf
RUN apk update \
    && apk add --no-cache curl
WORKDIR /var/www

CMD ["nginx", "-g", "daemon off;"]