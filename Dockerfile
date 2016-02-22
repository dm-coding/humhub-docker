FROM richarvey/nginx-php-fpm 
RUN apt-get update && \
    apt-get install -y -q --no-install-recommends php5-ldap ssmtp curl && \
    apt-get clean &&  \
    rm -rf /var/lib/apt/lists && \
    rm -rf /var/www/html && \
    git clone https://github.com/humhub/humhub.git /var/www/html && \
    mkdir -p /root/.composer && \
    cd /var/www/html && \
    curl -sS https://getcomposer.org/installer | php
COPY config.json /root/.composer/config.json
COPY ssmtp.conf /etc/ssmtp
COPY post-install.sh /usr/local/bin/post-install.sh
RUN git config --global url."https://".insteadOf "git://" && \
    cd /var/www/html && \
    ./composer.phar config --global github-protocols https && \
    ./composer.phar global require "fxp/composer-asset-plugin:~1.1.0" && \
    ./composer.phar update && \
    /usr/local/bin/post-install.sh
VOLUME ["/var/www/html"]
