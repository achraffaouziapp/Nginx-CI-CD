# Image de base
FROM nginx:latest

# Copie de la configuration Nginx
COPY default.conf /etc/nginx/conf.d/default.conf

# Copie du site
COPY index.html /usr/share/nginx/html/

# Copie du endpoint health
COPY health.html /usr/share/nginx/html/health

# Expose port 80
EXPOSE 80