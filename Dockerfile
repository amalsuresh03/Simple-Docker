FROM nginx
COPY html/* /usr/share/nginx/html/
EXPOSE 9000:80