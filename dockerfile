FROM jorged104/apache-php


WORKDIR /var/www/html
ADD . /var/www/html
COPY . /var/www/html

WORKDIR /var/www/app/

EXPOSE 80 

# Levanta Apache
CMD ["/sbin/entrypoint.sh"]

