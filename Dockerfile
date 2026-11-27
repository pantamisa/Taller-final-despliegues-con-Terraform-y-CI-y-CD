# Imagen base con servidor web Nginx
FROM nginx:alpine
# Copiar los archivos de la aplicación
# al directorio del servidor web
COPY . /usr/share/nginx/html
# Puerto utilizado por Nginx
EXPOSE 80