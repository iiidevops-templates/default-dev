FROM dockerhub/library/php:7.1-cli

COPY app /var/www/html
WORKDIR /var/www/html
EXPOSE 80
CMD ["php", "-S", "0.0.0.0:80"]
