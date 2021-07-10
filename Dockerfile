FROM nginx:latest
RUN sed -i 's/nginx/khadija/g' /usr/share/nginx/html/index.html
EXPOSE 80
