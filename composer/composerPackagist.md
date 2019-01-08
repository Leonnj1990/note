# 创建一个自己的 Composer/Packagist 包

---

### 在github上创建一个项目, 这里取名 `composer-car`,初始化项目：

	git clone https://github.com/leonnj/composer-car.git
	
	cd composer-car

### 编写 `composer.json` 文件如下：
	
	{
	    "name": "leonnj/composer-car",
	    "description": "In order to study composer",
	    "type": "library",
	    "license": "MIT",
	    "authors": [
	        {
	            "name": "leonnj",
	            "email": "***@qq.com"
	        }
	    ],
	    "minimum-stability": "dev",
	    "require": {
	        "php": ">=5.3.0"
	    },
	    "autoload": {
	        "psr-4": {
	            "Ford\\Escape\\": "src/Ford/Escape",
	            "Ford\\Fusion\\": "src/Ford/Fusion",
	            "Ford\\Focus\\": "src/Ford/Focus",
	            "Ford\\Fiesta\\": "src/Ford/Fiesta"
	        }
	    }   
	}

### 根据上面的命名空间和目录的映射关系，包的结构现在应该是下面这个样子：

	composer-car
	- src
	- - Ford
	- - - Escape
	- - - - Escape2013.php
	- - - Fiesta
	- - - - Fiesta2013.php
	- - - Focus
	- - - - Focus2013.php
	- - - Fusion
	- - - - Fusion2013.php
	- .gitignore
	- composer.json
	- README.md

### 在 `packagist` 上递交自己的包

[packagist地址](https://packagist.org/ 'packagist地址')
	
pacagist开放递交, 可以 **任意递交自己的包**
	
packagist右上角有一个 **submit** 按钮, 点击会跳转到递交页面

### 在设置github的 `hook`

可以在github发布 **release** 来定义版本

	打标签:
	git tag -a v0.1.0 -m "release 0.1.0 version"
	
	提交代码并提交标签:
	git push origin master --tags
	
### 下载包

* 直接通过命令行下载:

		composer require leonnj/composer-car
	
* 通过composer.json文件引用

		{
		    "require": {
		        "php-di/php-di": "5.4.6",
		        "leonnj/composer-car": "0.1.0"
		    },
		    "require-dev": {
		        "phpunit/phpunit": "6.4.4",
		        "phploc/phploc": "4.0.1"
		    },
		    "repositories": {
		        "packagist": {
		            "type": "composer",
		            "url": "https://packagist.laravel-china.org/"
		        }
		    }
		}
