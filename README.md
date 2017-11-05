# Build
This repository is exists the files for building and testing for docker.  
To build a disposable environment that middleware is included in the cloud and on-premises environment you can run the test. This repository and [DockerHub repository](https://hub.docker.com/u/webstream/) is in cooperation "Automated Build".

## Usage for build
```shell
$> sudo docker build -t webstream/php-apache .
```

or

```shell
$> sudo docker pull webstream/php-apache
```

Other docker images can be executed with the same command.

## Usage for run
memcached
```shell
$> sudo docker run --name memcached -p 21211:11211 -d webstream/memcached
```

redis
```shell
$> sudo docker run --name redis -p 16379:6379 -d webstream/redis
```

mysql
```shell
$> sudo docker run --name mysql -p 3307:3307 -e MYSQL_DATABASE=sandbox -e MYSQL_USER=mysql -e MYSQL_PASSWORD=mysql -e MYSQL_ROOT_PASSWORD=root -d webstream/mysql
```

postgres
```shell
$> sudo docker run --name postgres -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -d webstream/postgres
```

php-apache
```shell
$> sudo docker run -itd -p 80:80 --link memcached:memcached --link redis:redis --link mysql:mysql --link postgres:postgres --name php-apache webstream/php-apache
```

## Dockerfile URL
* [Dockerfile(memcached)](https://github.com/webstream-framework/Build/blob/master/memcached/Dockerfile)
* [Dockerfile(redis)](https://github.com/webstream-framework/Build/blob/master/redis/Dockerfile)
* [Dockerfile(mysql)](https://github.com/webstream-framework/Build/blob/master/mysql/Dockerfile)
* [Dockerfile(postgres)](https://github.com/webstream-framework/Build/blob/master/postgres/Dockerfile)
* [Dockerfile(php-apache)](https://github.com/webstream-framework/Build/tree/master/php-apache)

## License
Licensed under the MIT
http://www.opensource.org/licenses/mit-license.php
