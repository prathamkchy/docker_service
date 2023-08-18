# Use an official Ubuntu 18.04 image as the base image
FROM ubuntu:18.04

# Set non-interactive mode during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install necessary packages
RUN apt-get update && \
    apt-get install -y apache2 mysql-server php libapache2-mod-php php-mysql libnet-libidn-perl php-all-dev php-cgi php-cli php-common php-curl php-dev php-gd php-gmp php-mbstring php-gettext php-xdebug

# Enable Apache modules
RUN a2enmod rewrite

# Install phpMyAdmin from the official repository
RUN apt-get install -y phpmyadmin

# Add file location
ADD ./app /var/www/html

# Expose ports for Apache
EXPOSE 80

# Start Apache service when the container starts
CMD ["apachectl", "-D", "FOREGROUND"]
