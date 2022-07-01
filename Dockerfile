FROM dockerhub/library/php:7.4.29-cli

RUN apt update && apt upgrade -y
COPY app /var/www/html
WORKDIR /var/www/html
EXPOSE 80
CMD ["php", "-S", "0.0.0.0:80"]
