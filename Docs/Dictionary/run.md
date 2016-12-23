#git

###git clone "项目地址"

* git status 
* git branch dev 创建dev分支
* git checkout dev  切换dev分支

###cd 项目  启动项目

* ./smart start  
* ./smart composer 
* 添加 config.php（复制configtest.php即可）
* 修改 config.php 数据库名，去掉_text
* 添加Compile文件到 View/Smarty   mkdir Compile
* 设置权限 chmod  o+w Compile 
* 创建数据库（对照database文件）

###每次查看最新代码  启动项目  

* git pull 拉取代码到本地  
* 执行

####部署到服务器

* git checkout master
* git merge dev
* git push origin master 

###后端服务层

* docker-compose up -d  安装+启动
* docker-compose ps  查看编排工具容器状态
* docker exec -it [company.api.qixinyun.com-phpfpm] /bin/bash  执行
* ls
* composer install  安装composer
* exit  退出容器
* docker-compose stop  停止
* php marmot.php autoCreate 自动创建文件
* php marmot.php clearCache 清理缓存
* smart 检测代码
* .git/hooks/pre-commit 加钩子
* docker ps  查看服务




