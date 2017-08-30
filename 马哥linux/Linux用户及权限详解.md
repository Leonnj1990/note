# Linux用户及权限详解  

---

### 用户(属主) 用户组(属组) 权限

#### 权限 r, w, x

**属主属组其他**

1. 文件权限

		r：可读，可以使用类似cat等命令查看文件内容；
		w：可写，可以编辑或删除此文件；
		x: 可执行，eXacutable，可以命令提示符下当作命令提交给内核运行
2. 目录权限

		r: 可以对此目录执行ls以列出内部的所有文件；
		w: 可以在此目录创建文件；
		x: 可以使用cd切换进此目录，也可以使用ls -l查看内部文件的详细信息
3. 权限三位一体

		rwx:可读可学可执行
		r--:只读
		r-x:读和执行
		---：无权限
4. 八进制表示

		0 000 ---：无权限
		1 001 --x: 执行
		2 010 -w-: 写
		3 011 -wx: 写和执行
		4 100 r--: 只读
		5 101 r-x: 读和执行
		6 110 rw-: 读写
		7 111 rwx: 读写执行

		示例：
		755：rwxr-xr-x
		rw-r-----: 640
		660:rw-rw----
		rwxrwxr-x:775


#### 用户和用户组

1. 用户和组的文件路径

		用户：UID, /etc/passwd
		组：GID, /etc/group
2. 影子口令 **加密/etc/passwd文件之后的文件**

		用户：/etc/shadow
		组：/etc/gshadow
3. 用户类别:UID

		管理员：0
		普通用户：1-65535
			系统用户：1-499
			一般用户：500-60000
4. 用户组类别:GID

		管理员组：0
		普通组：1-65535
			系统组：1-499
			一般组：500-60000
5. 用户组类别

		私有组：创建用户时，如果没有为其指定所属的组，系统会自动为其创建一个与用户名同名的组
		基本组：用户的默认组
		附加组，额外组：默认组以外的其它组
6. 解释/etc/passwd中7段意义：

		用户名：密码：UID：GID：注释：家目录：默认SHELL

		1）.account: 登录名
		2）.password: 密码  显示为一个x，减少密文泄露
		3）.UID：用户ID
		4）.GID：基本组ID
		5）.comment: 注释
		6）.HOME DIR：家目录
		7）.SHELL：用户的默认shell
7. 解释/etc/group中4段意义： 

		组名：密码：GID：以此组为其附加组的用户列表
8. 解释/etc/shadow中8段意义：

		用户名：密码：最近一次修改密码的时间：最短使用期限：最长使用期限：警告时间：非活动时间：过期时间

		1）.account: 登录名
		2）.encrypted password: 加密的密码，$中间的为salt，有的为 ！！ 或者 * 代表用户被锁定，不能登录；要锁定用户，只需要在用户密码前后加上！
9. 加密方法：

		对称加密：加密和解密使用同一个密码
		公钥加密：每个密码都成对儿出现，一个为私钥(secret key)，一个为公钥(public key)
		单向加密，散列加密：提取数据特征码，常用于数据完整性校验
		1、雪崩效应，蝴蝶效应：初始条件的微小改变，将会引起结果巨大改变
		2、定长输出
              MD5：Message Digest, 128位定长输出
              SHA1：Secure Hash Algorithm, 160位定长输出


#### 管理命令

1. 用户管理命令：useradd, userdel, usermod, passwd, chsh, chfn, finger, id, chage

	- useradd  [options]  USERNAME 

			-u UID
			-g GID（基本组）
			-G GID,...  （附加组）
			-c "COMMENT"
			-d /path/to/directory
			-s SHELL
			-m -k
			-M
			-r: 添加系统用户
	- userdel [option] USERNAME

			-r: 同时删除用户的家目录
	- id：查看用户的帐号属性信息

			-u
			-g
			-G
			-n
	- finger: 查看用户帐号信息

			finger USERNAME
	- usermod：修改用户帐号属性

			-u UID
			-g GID
			-a -G GID：不使用-a选项，会覆盖此前的附加组；
			-c
			-d -m：
			-s
			-l
			-L：锁定帐号
			-U：解锁帐号
	- chsh: 修改用户的默认shell
	- chfn：修改注释信息
	- passwd：密码管理
	
			passwd [USERNAME]
			--stdin
			-l
			-u
			-d: 删除用户密码
	- pwck：检查用户帐号完整性 

2. 组管理命令：groupadd, groupdel, groupmod, gpasswd

	- groupadd：创建组 

		    -g GID
		    -r：添加为系统组
	- groupmod

			-g GID
			-n GRPNAME
	- groupdel
	- gpasswd：为组设定密码
	- newgrp GRPNAME <--> exit
	- chage：更改密码使用时间

			-d: 最近一次的修改时间
			-E: 过期时间
			-I：非活动时间
			-m: 最短使用期限
			-M: 最长使用期限
			-W: 警告时间
3. 权限管理：chown, chgrp, chmod, umask

	- chown: 改变文件属主(只有管理员可以使用此命令)

			格式：chown USERNAME file,...
			          chown USERNAME:GRPNAME file,...
			          chown USERNAME.GRPNAME file,...
			-R: 修改目录及其内部文件的属主
	- chgrp:改变文件属组

			格式：chgrp GRPNAME file,...
			-R：递归
			--reference=/path/to/somefile file,...改正和somefile文件一样的属组
	- chmod: 修改文件的权限

			格式：chmod MODE file,...
			-R:递归更改
			--reference=/path/to/somefile file,...改正和somefile文件一样的权限
	- 修改某类用户或某些类用户权限：u,g,o,a

			格式：chmod 用户类别=MODE file,...
	- 修改某类用户的某位或某些位权限：u,g,o,a

			格式：chmod 用户类别+|-MODE file,...


#### 特殊权限

##### 特殊权限也是一个三位的：s,s,t

1. SUID: 运行某程序时，相应进程的属主是程序文件自身的属主，而不是启动者；

		格式：chmod u+s FILE  ，chmod u-s FILE
		注意：如果FILE本身原来就有执行权限，则SUID显示为s；否则显示S；
2. SGID: 运行某程序时，相应进程的属组是程序文件自身的属组，而不是启动者所属的基本组；

		格式：chmod g+s FILE  ， chmod g-s FILE
		注意：如果FILE本身原来就有执行权限，则SUID显示为s；否则显示S
3. Sticky: 在一个公共目录，每个都可以创建文件，删除自己的文件，但不能删除别人的文件；

		格式：chmod o+t DIR  ， chmod o-t DIR
		注意：如果FILE本身原来就有执行权限，则SUID显示为t；否则显示T


#### umask：遮罩码

1. 文件默认权限：666-umask
2. 文件夹默认权限：777-umask
3. 特殊权限默认为0
4. 默认遮罩码：umask=0022
5. 更改遮罩码：umask 0023


**注意：文件默认不能具有执行权限，如果算得的结果中有执行权限，则将其权限加1**


#### 推荐阅读

Linux系统管理员不可不知的命令：sudo [http://www.linuxidc.com/Linux/2013-07/87855.htm](http://www.linuxidc.com/Linux/2013-07/87855.htm "Linux系统管理员不可不知的命令：sudo")

Ubuntu 添加管理员账号 [http://www.linuxidc.com/Linux/2012-11/74465.htm](http://www.linuxidc.com/Linux/2012-11/74465.htm "Ubuntu 添加管理员账号")

Linux下管理员强行踢出用户的命令使用方法 [http://www.linuxidc.com/Linux/2012-01/52122.htm](http://www.linuxidc.com/Linux/2012-01/52122.htm "Linux下管理员强行踢出用户的命令使用方法")

11 条Linux/Unix 管理员常用命令 [http://www.linuxidc.com/Linux/2012-01/51772.htm](http://www.linuxidc.com/Linux/2012-01/51772.htm "Linux下管理员强行踢出用户的命令使用方法")

Linux新手管理员指南 [http://www.linuxidc.com/Linux/2011-06/37561.htm](http://www.linuxidc.com/Linux/2011-06/37561.htm "Linux新手管理员指南")

Ubuntu -超级管理员root 登录 [http://www.linuxidc.com/Linux/2011-04/34073.htm](http://www.linuxidc.com/Linux/2011-04/34073.htm "Ubuntu -超级管理员root 登录")