# 查看 SELinux状态及关闭SELinux

---

### 查看SELinux状态：

1、**/usr/sbin/sestatus -v**   
   
	SELinux status: enabled   开启状态

2、**getenforce** 也可以用这个命令检查


### 关闭SELinux：

1、临时关闭（不用重启机器）：

	setenforce 0 设置SELinux 成为permissive模式
    setenforce 1 设置SELinux 成为enforcing模式

2、修改配置文件需要重启机器：

	修改/etc/selinux/config 文件
	将SELINUX=enforcing改为SELINUX=disabled

3、重启机器即可