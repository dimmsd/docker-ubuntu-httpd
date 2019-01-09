[![Build Status](https://travis-ci.org/dimmsd/docker-ubuntu-httpd.svg?branch=master)](https://travis-ci.org/dimmsd/docker-ubuntu-httpd)

## Ubuntu HTTPD image

[The Docker Hub page](https://hub.docker.com/r/dimmsd/ubuntu-httpd)

Image size ~ 196 MB

Ubuntu 16.04 + Apache

Image tag 16.04

Example based on images:

[Ubuntu base image](https://github.com/dimmsd/docker-ubuntu-base)

[Ubuntu PHP-FPM image](https://github.com/dimmsd/docker-ubuntu-php-fpm)

### Using the `Makefile`

```
$ make help
config-test			Test docker-compose.yml
set-www-access			Set permissions for ./www folder : 644 for files and 755 for folders
build				Build a Dockerfile
up				Up service
down				Down service
exec-httpd			Attach to HTTPD container and start bash session
exec-as-root			Attach to PHP-FPM container and start bash session
exec-as-user			Attach to PHP-FPM container and start bash session under user $(OWN_USER)
fpm-status			Show PHP-FPM status page
fpm-exec-index			Execute /var/www/main/index.php over PHP-FPM
check-site			Execute for test curl $(MAIN_DOMAIN) (from container)
```

### Example

```
$ git clone git://github.com/dimmsd/docker-ubuntu-httpd.git
$ cd docker-ubuntu-httpd
$ cp .env.example .env
$ make build
$ make up
```

### Environment

See `.env.example` for detail

Default IP Httpd service in `.env.example` is 172.50.0.100

Default domain is example.loc

For testing example.loc from host system, add host name in `/etc/hosts` file

```
172.50.0.100 example.loc www.example.loc
```

### Run Docker commands without sudo

See this [section](https://github.com/dimmsd/docker-ubuntu-base#run-docker-commands-without-sudo).

