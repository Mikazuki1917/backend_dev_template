FROM nginx:alpine
COPY ./conf.d/default.conf /etc/nginx/conf.d/default.conf
RUN apk update
WORKDIR /var/www

CMD ["nginx","-g","daemon"]