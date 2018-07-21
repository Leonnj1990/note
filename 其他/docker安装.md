# docker 安装

--

## CentOS7下安装docker

1、建议首先输入 **yum check-update** 更新包数据库

2、输入 **yum install docker** 并按回车键确定

3、输入 **systemctl start docker** 启动docker服务

	如果启动失败, 修改配置文件需要重启机器：
	修改/etc/selinux/config 文件
	将SELINUX=enforcing改为SELINUX=disabled
	重启机器即可
4、输入 **systemctl status docker** 查看docker状态

5、如需开机自动启动docker服务则输入**systemctl enable docker**

--

## CentOS7下安装python-pip

### 在使用Docker的时候，有一个工具叫做  docker-compose，安装它的前提是要安装pip工具.

1、首先检查Linux有没有安装Python-pip包，直接执行 **yum install python-pip**

	见image/img1.png

2、没有python-pip包就执行命令 **yum -y install epel-release**

	见image/img2.png

3、执行成功之后，再次执行 **yum install python-pip**

	见image/img3.png

4、对安装好的pip进行升级 **pip install --upgrade pip**

	见image/img5.png


至此，pip工具就安装好了。

---

## CentOS7下安装Docker-Compose

Docker-Compose是一个部署多个容器的简单但是非常必要的工具.
**安装docker-Compose之前，请先安装 Python-pip**
安装好pip之后，就可以安装Docker-Compose了.

1、在linunx终端执行：pip install docker-compose.
执行完之后，输入docker-compse，报如下错误：

	[root@localhost ~]# docker-compose  
	Traceback (most recent call last):  
	  File "/usr/bin/docker-compose", line 5, in <module>  
	    from pkg_resources import load_entry_point  
	  File "/usr/lib/python2.7/site-packages/pkg_resources.py", line 3011, in <module>  
	    parse_requirements(__requires__), Environment()  
	  File "/usr/lib/python2.7/site-packages/pkg_resources.py", line 626, in resolve  
	    raise DistributionNotFound(req)  
	pkg_resources.DistributionNotFound: backports.ssl-match-hostname>=3.5 

解决方法：在终端输入命令
2、pip install --upgrade backports.ssl_match_hostname

	见image/img4.png

3、执行成功之后：docker-compose  --version 查看版本信息.

	见image/img6.png
	[root@localhost ~]# docker-compose -version  
	docker-compose version 1.8.1, build 878cff1  