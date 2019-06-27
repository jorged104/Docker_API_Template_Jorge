FROM jorged104/apache-php

ADD . /var/www/app/
COPY . /var/www/app/

WORKDIR /var/www/app/

EXPOSE 80 

# Levanta Apache
CMD ["/sbin/entrypoint.sh"]

