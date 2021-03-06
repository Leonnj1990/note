# 01_04\_Linux操作系统基础

---

**Linux严格区分大小写**

## Linux的基本原则

* 由**目的单一小程序**组成, 组合小程序完成复杂任务
* **一切皆文件**
* 尽量**避免捕获用户接口**: 不跟用户交互
* 配置文件保存为**纯文本**
* 能**简写**绝不全写

## shell, 应用程序接口(Application Program Interface)

### GUI接口(Graphie User Interface)

图形用户界面.

* Gnome: C
* KDE: C++

### CLI接口(Command Line Interface)

命令行界面. 命令提示符

* sh: Docker很多镜像默认是sh(待了解)
* **bash**(常用)
* csh
* zsh(Mac): SHELL=/bin/zsh
* ksh
* tcsh

#### 提示字符

* **#**: root权限
* **$**: 普通用户

## 命令格式

	命令 [选项] 参数
	
### 选项

* 短选项: **-**, 多个短选项可组合, 如 `ls -a -l` 等于 `ls -al`
* 长选项: **--**, 多个长选项不能组合

### 参数

命令的作用对象, 多个参数用**空格**隔开

## 使用凭证

用户

### su(switch user)

切换用户

账号管理: **/etc/passwd**

### passwd

修改密码, 注意密码复杂度

密码管理: **/etc/shadow**

