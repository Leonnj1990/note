# 创建一个自己的 Composer/Packagist 包

#### 在github上创建一个项目，这里取名 composer-car，又欢快的将它克隆到本地：

	git clone https://github.com/GeHou/composer-car.git
  
    cd composer-car

#### 编写composer.json，你可以根据composer文档生成并编辑它，当然composer贴心的为我们准备了命令行，look：

	-> composer init
  
	Welcome to the Composer config generator
  
	This command will guide you through creating your composer.json config.


	Package name (<vendor>/<name>) [hou/composer-car]: 这里填写<包提供者>/<包名>的信息
	Description []: 包的描述
	Author [GeHou <***@gmail.com>]: 作者信息
	Minimum Stability []: 最低稳定版本
	License []: 授权协议
  
	Define your dependencies.
  
	Would you like to define your dependencies (require) interactively [yes]? no
	Would you like to define your dev dependencies (require-dev) interactively [yes]? no
  
	{
	    "name": "hou/composer-car",
	    "description": "In order to study composer",
	    "license": "MIT",
	    "authors": [
	        {
	            "name": "GeHou",
	            "email": "***@gmail.com"
	        }
	    ],
	    "minimum-stability": "dev",
	    "require": {
	  
	    }
	}
	  
	Do you confirm generation [yes]? yes
	Would you like the vendor directory added to your .gitignore [yes]? yes

#### 虽然经过以上的一番挣扎生成了composer.json文件，不过我们还得往里面加点东西。使用你熟悉的编辑器打开composer.json文件修改至如下：

		{
		    "name": "hou/composer-car",
		    "description": "In order to study composer",
		    "license": "MIT",
		    "authors": [
		        {
		            "name": "GeHou",
		            "email": "***@gmail.com"
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

#### 根据上面的命名空间和目录的映射关系，包的结构现在应该是下面这个样子：

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

#### 在https://packagist.org/上递交自己的包

	pacagist开放递交，你可以任意递交自己的包，当然，要符合一定规则。
	
	packagist右上角有一个submit package的按钮，点击会跳转到递交页面

#### 设置github的hook

	**你可能需要在github上面发布几个release，这样packagist才会认定你的包是稳定的，否则只能required开发包**

	git tag       打标签