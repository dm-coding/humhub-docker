# humhub-docker
Installation of humhub in a docker container. Unlike other humhub images this contains simple instructions, a useable readme, and works. It's based on Richard Harvey's Nginx/FPM container (https://hub.docker.com/r/richarvey/nginx-php-fpm) though I may repackage it later for Alpine. SSMTP has been added for a mail transport; to use it just configure ssmtp.conf before building the image.

# How to use
Useage is simple -- make a new MySQL database and link it to the container. A docker-compose has been provided for this purpose, simply type: 

$ docker-compose up -d

.. then navigate to localhost:80 to finish installation.

Humhub lives in /var/www/html, which is a docker volume. But if you want to link it to the host filesystem thigns are a little more complicated. In that case, I suggest you bring the container up, find the location where the volume is held, copy it to the current working directory, then ammend the docker-compose file to overlay the new copy of the humhub files into the container's /var/www/html volume.

You can edit nginx's vhost settings by changing the vhost/default.conf file; this mounts directly into the container's /etc/nginx filesystem.

# To Do
Make the build quicker and more automated by copying the configuration data directly into the image at build and providing an SQL script to run.