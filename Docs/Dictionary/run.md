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