FROM jorged104/apache-php

ADD . /var/www/app/
COPY . /var/www/app/

WORKDIR /var/www/app/

EXPOSE 80

ENV APICONSULTA 172.18.0.4
ENV APIINSERT 172.18.0.5
ENV DB 172.18.0.2  

# Levanta Apache
CMD ["/sbin/entrypoint.sh"]

