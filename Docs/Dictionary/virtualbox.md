#Virtualbox

---

###目录

* [Virtualbox鼠标移入移出Linux时自动切换](#Virtualbox鼠标移入移出Linux时自动切换)
* [yum 安装 tree](#yum 安装 tree)

---

###[Virtualbox鼠标移入移出Linux时自动切换](id:Virtualbox鼠标移入移出Linux时自动切换)

####1、背景：

    未安装增强功能时，鼠标移入移出Virtualbox时，需要使用Right Ctrl键来进行切换，比较麻烦。

####2、开始：
    环境是 Virtualbox4.2.24/CentOS-6.6-x86_64-bin-DVD1.iso，操作过程为：
		1.进入X窗口后，VirtualBox的菜单“设备”--“安装增强功能”。在桌面上出现一个光驱符号，表明光驱加载成功。
		2.打开终端，cd /media文件夹，看到名字为VBOXADDITIONS***的目录，进入。
		3.超级用户(建议su -切换到root用户)运行 sh VBoxLinuxAdditions.run 安装成功。然后reboot，就可以了。

**如果安装的过程中，出现building the main guestadditions module failed**

####3、解决办法：

#####(1).安装增强功能需要kernel-devel包，必须保证kernel-devel和kernel版本的一致。
      查看软件源中kernel-devel的版本，
      # yum update kernel 
#####(2).安装kernel-devel和gcc等，
      # yum install kernel-devel gcc gcc-c++  
#####升级完后必须重启系统，新的kernel才能被使用。

#####然后重做上述第3步安装增强功能，成功后reboot。到这里，鼠标已经可以自动切换了。

---

###[yum 安装 tree](id:yum 安装 tree)

####1、开始：
	# yum install tree -y


