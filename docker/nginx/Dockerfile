FROM nginx:latest

COPY nginx/nginx.conf /etc/nginx/nginx.conf

WORKDIR /app

COPY scripts /app/scripts

CMD ["nginx", "-g", "daemon off;"]