# Build
This repository is exists the files for building and testing for docker.  
To build a disposable environment that middleware is included in the cloud and on-premises environment you can run the test. This repository and DockerHub repository is in cooperation "Automated Build".

## Usage for build
```shell
$> sudo docker build --tag=webstream/mysql .
$> sudo docker build --tag=webstream/postgres .
$> sudo docker build --tag=webstream/php-apache .
```

or

```shell
$> sudo docker pull webstream/mysql
$> sudo docker pull webstream/postgres
$> sudo docker pull webstream/php-apache
```

## Usage for run
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
$> sudo docker run -itd -p 80:80 --link mysql:mysql --link postgres:postgres --name php-apache webstream/php-apache
```

Prepare testing
```shell
$> sudo docker exec php-apache sh -c "cd /var/www/html && git clone https://github.com/webstream-framework/Test.git && cd Test && composer install && cd TestApp && composer install && touch log/webstream.test.log && chmod -R 777 log"
```

## Dockerfile URL
* [Dockerfile(mysql)](https://github.com/webstream-framework/Build/blob/master/mysql/Dockerfile)
* [Dockerfile(postgres)](https://github.com/webstream-framework/Build/blob/master/postgres/Dockerfile)
* [Dockerfile(php-apache)](https://github.com/webstream-framework/Build/tree/master/php-apache)

## License
Licensed under the MIT
http://www.opensource.org/licenses/mit-license.php
