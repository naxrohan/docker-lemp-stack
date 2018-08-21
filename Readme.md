## This is a simple LEMP stack Tutorial for docker-compose.

*NOTE: This tutorial is for Linux users.*

If you have already installed docker & docker-compose, you can ignore the below step.

`$ sudo apt-get update`
`$ sudo apt-get install docker-ce`

else follow instructions [here](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce-1)


This LEMP stack uses:
NGINX latest alpine
MYSQL 5.6.40
PHP 7.1-fpm-alpine
mailhog (local mailing service)
adminer (database admin)
traefik (load balancer)
portainer (to debug docker)

We are using alpine image for this tutorial as they are small & compact in size.
Alternatively you can also use PHP 5.6-fpm-alpine image.

Assuming that you have cloned this repository. Now navigate to the repository directory,  and run below listed commands.

`$  sudo docker build .`

> On first executing the build command it will down load all the specified docker images.
> Then it will execute commands specified in the Dockerfile, for each image.

`$  sudo docker-compose up -d`

> The docker-compose up command will start all the containers mentioned in the docker compose file in the detached mode, hence the -d.
> If all goes well, all the containers should be running now. You can verify this usin the below command.

`$  sudo docker-compose ps`

> This will display status of all the container either in up OR exit state.

`$  sudo docker exec -it lampdock_nginx /bin/sh`

> Above command can be used to attach to a running container (like a local bash).
> Alternatively you can change container name, to connect to other running containers.


//ToDo : add folder structure.


### Further Reading & References links:
 - [how-to-install-more-php-extensions](https://docs.docker.com/samples/library/php/#how-to-install-more-php-extensions).
 - [tips-for-deploying-nginx-official-image-with-docker](https://blog.docker.com/2015/04/tips-for-deploying-nginx-official-image-with-docker/).
 - [dockerise-your-php-application-with-nginx-and-php7-fpm](http://geekyplatypus.com/dockerise-your-php-application-with-nginx-and-php7-fpm/).
 - [common mysql error](https://stackoverflow.com/questions/49427530/fatal-error-uncaught-error-call-to-undefined-function-mysqli-connect).
 - [setup custom php ini file](https://serverfault.com/questions/840046/why-is-there-no-php-ini-file-when-i-install-php-in-a-docker-container).
 - [laravel-docker-part-1-setup-for-development](https://medium.com/@shakyShane/laravel-docker-part-1-setup-for-development-e3daaefaf3c).
