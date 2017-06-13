# docker-compose.yml

### mysql/phpmyadmin
	mysql:
	  image: "registry.cn-hangzhou.aliyuncs.com/marmot/mysql-5.6:1.0"
	  volumes:
	  - ~/data/mysql/:/var/lib/mysql
	  environment:
	   - MYSQL_ROOT_PASSWORD=123456
	  container_name: mysql-master
	  ports:
	   - "10082:3306"
	
	phpmyadmin:
	  image: "registry.aliyuncs.com/marmot/phpmyadmin"
	  links:
	    - "mysql:mysql"
	  ports:
	   - "10081:80"
	  environment:
	   - UPLOAD_SIZE=1G
	  container_name: phpmyadmin

### phpfpm 
	phpfpm:
	  image: "registry.cn-hangzhou.aliyuncs.com/marmot/phpfpm-7.0-front"
	  volumes:
	   - ./:/var/www/html/
	  container_name: front-apitest-phpfpm






