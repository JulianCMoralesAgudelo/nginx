# Pull the minimal Ubuntu image
FROM ubuntu

# Install nginx vim curl
RUN apt-get -y update && apt-get -y install nginx

# Create directories
RUN mkdir /var/www/siteone/ /var/www/sitetwo/

# Copy the Nginx config files
COPY default /etc/nginx/sites-available/default
COPY siteone /etc/nginx/sites-enabled/siteone.com
COPY sitetwo /etc/nginx/sites-enabled/sitetwo.com

# Create the index files
RUN echo "Hola desde el primer sitio" >> /var/www/siteone/index.html
RUN echo "Hola desde el segundo sitio" >> /var/www/sitetwo/index.html

# Expose the port for access
EXPOSE 80/tcp

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]