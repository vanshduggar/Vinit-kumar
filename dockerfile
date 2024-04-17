# Use the official PHP image
FROM php:7.4-apache

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the PHP files from your local machine to the container
COPY . /var/www/html

# Install any dependencies your PHP application might have
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Expose the port your PHP application will run on
EXPOSE 80

# Start the Apache web server
CMD ["apache2-foreground"]
