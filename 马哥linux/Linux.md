# linux

---

### 目录

* [linux操作系统基础](#linux操作系统基础)
	* 操作系统
	* [内核管理](#内核管理)
	* [库](#库)
	* [命令](#命令)
* [操作系统及常用命令](#操作系统及常用命令)
	* [切换用户](#切换用户)
    * [目录管理](#目录管理)
    * [文件系统](#文件系统)
    * [文件管理](#文件管理)
    * [时间管理](#时间管理)
    * [其他](#其他)
* [bash特性](#bash特性)

---

> ### [linux操作系统基础](id:linux操作系统基础)

##### 操作系统: **系统调用**

  * 应用程序(启动: 自启动、按需启动)
  * **内核**: kernel space  [http://www.kernel.org](http://www.kernel.org "获取Linux当前按最新的内核版本号")
  * **库**: library(lib)可执行，但无执行入口
  * **shell**: 接受用户命令，转换用户命令为计算机可理解的二进制形式，并将其发送给内核(按需启动)
      * GUI: **图形用户界面**(Graphical User Interface)
      * CLI: **命令行界面**(Command Line Interface)

---
   
##### GNU: **革奴计划**

   * GPL:**反版权**

---
  
##### [内核管理](id:内核管理)

   * 进程管理
   * 内存管理
   * 文件系统
   * 驱动程序
   * 网络接口

---
  
##### [库](id:库)

   * Windows: `dll(Dynamic Link Library)动态链接库`
   * Linux: 
      * `so(shared object)共享对象`
      * `dso(Dynamic shared object)动态共享对象`

---
      
##### [命令](id:命令)

 * **man: 获取命令手册(manual)**
    * man COMMAND 

###### 内部命令
###### 外部命令

   * 命令 选项 参数 
     * 用户类型
     
         	root #
            普通用户 $
    * 选项: 修改命令执行特性
    
      		短选项 - 可组合 -a -b =-ab
      		长选项 -- 通常不可组合
    * 参数
    
    		命令的作用对象 

---

> ### [操作系统及常用命令](id:操作系统及常用命令)

   * 虚拟终端: `terminal(Ctrl+Alt+F1-F6)`
   * 使用凭证: `root redhat  区分大小写`
   * 切换用户: `su(switch user)`
   * 文件列表: `ls(list) `

---
   
##### [切换用户](id:切换用户)

缩写: `su (switch user)`

 **su [-l] USERNAME**

   * su USERNAME `半切换`
   * su -l USERNAME `全切换`
  
 **passwd** 修改密码(密码复杂性规则)

 **exit**  退出

---

##### [目录管理](id:目录管理)

  * 目录: 文件，路径映射  **`/`**
   
	    Working Directory,Current Directory
	    **pwd**: Printing Working Directory 当前目录
  * 路径: **从指定起始点到目的地所经过的位置**
  * **ls: 文件列表**
  	* 选项
  	
		    * -l: 长格式
		       * 文件类型
		          * -: 普通文件(f)
		          * d: 目录文件
		          * b: 块设备文件(block)
		          * c: 字符设备文件(character)
		          * l: 符号链接文件(symbolic link file)
		          * p: 命令管道文件(pipe)
		          * s: 套接字文件(socket)
		        * 文件权限
		          * 9位，每三位一组，每一组: rwx(读，写，执行)，r--
		          * u: **user**
		          * g: **group**
		          * o: **other**
		          * a: **all** 代表以上三种
		          * r: 4
		          * w: 2
		          * x: 1
		        * 文件硬链接的次数
		        * 文件的属主(owner)
		        * 文件的属组(group)
		        * 文件大小(size),单位: 字节
		        * 时间戳(timestamp) `modify`
		          * 最近一次被**访问**的时间: access
		          * 最近一次被**修改**的时间: modify，文件内容发生了改变
		          * 最近一次被**改变**的时间: change，metadata，元数据
		    * -h: 做单位转换，将文件 **字节** 转化为 **k**
		    * -a: 显示所有隐藏文件(包含**.**和**..**)
		       * **.** 表示当前目录
		       * **..** 表示父目录
		    * -A: 显示以 **.** 开头的隐藏文件
		    * -d: 显示目录自身属性
		    * -i: 显示文件的索引节点号 index node，inode
		    * -r: 逆序显示(默认升序显示)
		    * -R: 递归(recursive)显示
    * 示例: 
    
		    [root@localhost ~]# ls -lha
			total 104K
			dr-xr-x---. 21 root root 4.0K Dec 15 11:57 .
			dr-xr-xr-x. 17 root root 4.0K Dec 15 11:52 ..
			-rw-------.  1 root root 1.4K Nov  9 19:53 anaconda-ks.cfg
			-rw-------.  1 root root  19K Dec 15 10:08 .bash_history
			-rw-r--r--.  1 root root   18 Dec 29  2013 .bash_logout
			-rw-r--r--   1 root root  195 Nov 24 10:20 .bash_profile
			-rw-r--r--.  1 root root  176 Dec 29  2013 .bashrc
			drwxr-xr-x. 19 root root 4.0K Dec  7 11:08 .cache
 * **mkdir: 创建空目录**
 	* 选项
 	
		 	-p:  创建多级目录
		 	-v:  verbose 创建过程
 	* 示例
 	
			[root@localhost ~]# mkdir -pv /root/m/n/q
   			mkdir: created directory ‘/root/m’
    		mkdir: created directory ‘/root/m/n’
    		mkdir: created directory ‘/root/m/n/q’
	
	* 命令行展开**`{}`**
	
			[root@localhost m]# mkdir /mnt/test/{x/m,y} -pv
    		mkdir: created directory ‘/mnt/test’
    		mkdir: created directory ‘/mnt/test/x’
    		mkdir: created directory ‘/mnt/test/x/m’
    		mkdir: created directory ‘/mnt/test/y’		

    		[root@localhost m]# mkdir /mnt/test/{a,d}_{b,c} -pv
    		mkdir: created directory ‘/mnt/test/a_b’
    		mkdir: created directory ‘/mnt/test/a_c’
    		mkdir: created directory ‘/mnt/test/d_b’
    		mkdir: created directory ‘/mnt/test/d_c’
 * **rmdir: 删除空目录**
 * **tree: 查看文件树**
 	* 示例
 	
		    [root@localhost ~]# tree m
			m
			└── n
			    └── q
			
			2 directories, 0 files

 * **cd**: change directory 切换目录
    * 家目录，主目录，Home directory **cd ~**或者**cd**  
    
   	  		cd ~USERNAME:进入指定用户的家目录
   	  		cd -: 在当前目录和前一次所在的目录之间来回切换  

---

#### [文件系统](id:文件系统) `File System`

    rootfs:根文件系统  `ls /`

**FHS**

    Filesystem Hierarchy Standard（文件系统层次化标准）的缩写，多数Linux版本采用这种文件组织形式，
	类似于Windows操作系统中c盘的文件目录，FHS采用树形结构组织文件。FHS定义了系统中每个区域的用途、所
    需要的最小构成的文件和目录，同时还给出了例外处理与矛盾处理.

 * /boot
 
 		系统启动的相关文件，如`内核，initrd，以及grub(bootloader)`
 * /dev:设备文件
 
	 	* 块设备: 随机访问，数据块
	 	* 字符设备: 线性访问，按字符为单位
	 	* 设备号:  主设备号（major）和次设备号（minor）
 * /etc
 
 		配置文件
 * /home
 
 		用户的家目录，每一个用户的家目录通常默认为`/home/USERNAME`
 * /root
 
 		管理员的家目录
 * /lib **库文件**
 
	 	* 静态库: `.a`
	 	* 动态库: `.dll(windows),  .so(shared object)`
	 	* /lib/modules:内核模块文件
 * /media
 
 		挂载点目录，移动设备
 * /mnt
 
 		挂载点目录，额外的临时目录
 * /opt
 
 		可选目录，第三方程序的安装目录
 * /proc
 
 		伪文件系统，内核映射文件 
 * /sys
 
 		伪文件系统，跟硬件设备相关的属性映射文件
 * /tmp
 
 		临时文件，`/var/tmp`
 * /var
 
 		可变化文件
 * /bin **系统**指令，**必备的**
 
 		可执行文件，**系统**指令，**必备的**二进制文件
 * /sbin
 
 		管理目录，超级用户命令
 * /usr  `shared, read-only 只读文件` **不是系统必备的文件**
 
 		/usr/bin
 		/usr/sbin 
 		/usr/lib
 * /usr/local  **第三方应用程序**
 
 		/usr/local/bin 
 		/usr/local/sbin
 		/usr/local/lib	
 * 命名规则
 
 		长度不能超过255个字符
		不能使用 **`/`** 当文件名
		严格区分大小写
	
---

##### [文件管理](id:文件管理)

 * **touch: 改变文件的`时间戳`（文件不存在时，创建）**
 
	    最近一次被**访问**的时间: access
        最近一次被**修改**的时间: modify，文件内容发生了改变
        最近一次被**改变**的时间: change，metadata，元数据	
	* 选项

		    -a: 访问时间
		 	-m: 修改时间
		 	-t: 自定义时间 [[CC]YY]MMDDhhmm[.ss]
		 	-c: 不创建文件  
 * **stat: 查看文件的时间戳**	
 * **rm: 删除文件**
 	* 选项
 	
		    -i: 每次删除前提示
			-f: 强制删除，不提示
		    -r: 递归地删除目录及其内容
 * **\: 命令自身的意思，而非别名**  
 	* 示例
 	
			[root@localhost ~]# ls
			anaconda-ks.cfg  data  Desktop  Documents  Downloads  log  Music  php  Pictures  Public  Templates  test  Videos
			[root@localhost ~]# \ls
			anaconda-ks.cfg  data  Desktop	Documents  Downloads  log  Music  php  Pictures  Public  Templates  test  Videos
			[root@localhost ~]# type ls
			ls is aliased to `ls --color=auto' 
 * **cp: 复制文件**
 
		一个文件到一个文件 cp file file1
		多个文件到一个目录 cp mnt/{file1,file2,a/b}  /tmp	
	* 选项
	
			-a : 保留文件的所有属性，归档存放，`常用于备份`  -dR -preserve=all
			-d : 若来源文件为链接文件的属性(link file)，则复制链接文件属性而非档案本身；
			-f : 为强制 (force) 的意思，若有重复或其它疑问时，不会询问使用者，而强制复制；
			-i : 若已经存在时，每次复制前提示
			-l : 进行硬式链接 (hard link) 的连结档建立，而非复制档案本身；
			-p : 连同档案的属性一起复制过去，而非使用预设属性，保留文件的`权限、属主、数组、时间戳`
			-r/-R: 递归地复制目录及其内容
			-s : 复制成为符号连结文件 (symbolic link)，亦即『快捷方式』档案；
			-u : 若 destination 比 source 旧才更新 destination ！ 
    		-preserve: 保存

 * **mv: 移动文件**
 	* 重命名、覆盖或移动文件

			mv [options] existing-file new-filename
			mv [options] existing-file-list directory
			mv [options] existing-directory new-directory
	* 参数

			第一种形式: existing-file 是需要重命名的文件路径; new-filename 是文件的新路径名，用于重命名或覆盖
			第二种形式: existing-file 是需要移动的文件路径列表; directory 是文件需要移动到的新目录，用于移动
			第三种形式: existing-file 是需要重命名的目录路径; new-directory 是目录的新路径名，用于重命名或覆盖
	* 选项

			-b  如果已存在相同文件名，则覆盖前进行备份			
			-f  如果已存在相同文件名，而用户不具有写的权限，则强制覆盖			
			-i  如果已存在相同文件名，覆盖前提示用户进行确认			
			-u  比较原文件与目标文件修改时间，如果目标文件较新则不覆盖			
			-v  列出所有被移动或重命名的文件
 * **install: 复制文件并且设置其属性**
 	* 选项
 
	    	-d: 创建目录
	 		-m: MODE 权限
 * **file: 判断文件类型**
 * **编译:将源代码转换成可以再cpu上执行的二进制格式的过程**
 * **nano: 文本编辑器**
 * **文件通配符**
 	* `*`: `任意长度(没有长度也可以)`的任意字符
 	
			[root@localhost ~]# ls a*
			a123 ab123 abc 
			[root@localhost ~]# ls a*3
			a123 ab123
			[root@localhost ~]# ls *y*
			helloy123 y123 xyz xyz123
 	* **?**: 任意`单个字符`
 	
			[root@localhost ~]# ls ?y*
			xyz xyz123
 	* **[]**: 匹配指定范围内的任意单个字符
 		* [abc], [a-m], [a-z], [A-Z], [a-zA-Z], [0-9a-zA-Z]
 		* [:space:]  表示所有的空白字符
 		* [:punct:]  表示所有的标点符号
 		* [:lower:]	 表示所有的小写字母
 		* [:upper:]  表示所有的大写字母
 		* [:alpha:]  表示所有的大小写字母
 		* [:digit:]  表示所有的数字
 		* [:alnum:]  表示所有的数字和大小写字母
 		* **man 7 glob** 查看字符
 		
				[root@localhost ~]# ls *y[a-z] 任意字符开头 以y以及a-z的字母结尾
				xyz
				[root@localhost ~]# ls [[:alpha:]]*[[:alpha:]] 字母开头 字母结尾
				a b abc xyz 
				[root@localhost ~]# ls [[:alpha:]]*[[:space:]]*[[:alpha:]] 字母开头 中间空白 字母结尾
				a b
 	* **[^]**: 匹配指定范围之外的任意单个字符
 		* [^abc], [^a-m], [^a-z], [^A-Z], [^a-zA-Z], [^0-9]
 		
				[root@localhost ~]# ls *y[a-z]
				xyz
				[root@localhost ~]# ls [^[:digit:]]*[[:alpha:]] 非数字开头 字母结尾


---

##### [时间管理](id:时间管理) 
 * `Linux: rtc ??`
 * **date: 系统时间**
 * **cal: 显示日历**
 	* 格式 
 	
			cal [选项][月份][年份]
    * 选项
    
    		-1 显示一个月的月历
			-3 显示系统前一个月，当前月，下一个月的月历
			-s  显示星期天为一个星期的第一天，默认的格式
			-m 显示星期一为一个星期的第一天
			-j  显示在当年中的第几天（一年日期按天算，从1月1号算起，默认显示当前月在一年中的天数）
			-y  显示当前年份的日历
    
 * **`clock` or `hwclock` 硬件时间**
    
        -w  将系统时间写入到硬件时钟
        -s  将硬件时钟写入到系统时钟

---

##### [查看文本](id:查看文本)
 * **cat: 连接并显示**
 	* 格式

		    cat [选项] [文件]...
	* 选项
	
			-A, --show-all 等价于 -vET
			-b, --number-nonblank 对非空输出行编号
			-e 等价于 -vE
			-E, --show-ends 在每行结束处显示  **$ 行结束符**
			-n, --number 对输出的所有行编号
			-s, --squeeze-blank 不输出多行空行
			-t 与 -vT 等价
			-T, --show-tabs 将跳 字符显示为 ^I
			-u (被忽略)
			-v, --show-nonprinting 使用 ^ 和 M- 引用，除了 LFD 和 TAB 之外
			--help 显示此帮助信息并离开
	* shift+pageUp/pageDown 翻页
 * **tac: 与cat相反**
 * **more: 向后翻 ** &&  **less **
 
	 	b键: 向前翻
	 	space: 向后翻 
 * **head: 查看前num行**
 	* 格式 
 	
 			head [选项] 文件  `默认显示10行`
 	* 选项
 	     
		    -n num: 文件的前num行  等价于 **-num**
 * **tail: 查看后num行**
 	* 格式 
 	
 			tail [选项] 文件
 	* 选项
 	     
		    -n num: 文件的前num行  等价于 **-num**
			-f:查看文件并不退出，等待显示后续追加至此文件的新内容

---

##### [文本处理](id:文本处理)
* **cut**

	    cut是一个选取命令，将一段数据经过分析，取出我们想要的。选取信息通常是针对“行”来进行分析的，并不是整篇信息分析的。

    * 语法
    
			cut  [-bn] [file] 或 cut [-c] [file]  或  cut [-df] [file] 
	* 选项
	
			-d: 指定字段分隔符，默认是 `空格`
			-f: 指定要显示的字段(显示区域)，与-d一起使用
				* -f1,3  指第一个和第三个字段 `离散表示法`
				* -f1-3  指第一个到第三个字段 `连续表示法`
			-b : 以字节为单位进行分割。这些字节位置将忽略多字节字符边界，除非也指定了 -n 标志
			-c : 以字符为单位进行分割
	* 示例

			[root@localhost ~]# cut -d : -f1 /etc/passwd
			root
			bin
			daemon
			adm
			lp
			sync
			shutdown
* **join**		
 
---

##### [文本处理](id:文本处理)
* **sort** 文本排序 
		
		默认从左向右根据字符的ASCII值来判断（升序）
	* 语法
		
			sort [选项] 文件
	* 选项
		
			-n 按照数值排序
			-r 降序
			-t 字段分隔符
			-k 以那个字段为关键字进行排序
			-u 排序后相同的行只显示一次
			-f 排序不区分大小写
	* 示例
		
			根据数值排序，并且按照 : 分隔 以第三个字段为关键字，进行降序排列
			[root@localhost ~]# sort -t: -k3 -n -r /etc/passwd
			halt:x:7:0:halt:/sbin:/sbin/halt
			shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
			sync:x:5:0:sync:/sbin:/bin/sync
			lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
			adm:x:3:4:adm:/var/adm:/sbin/nologin
			daemon:x:2:2:daemon:/sbin:/sbin/nologin
			bin:x:1:1:bin:/bin:/sbin/nologin
			root:x:0:0:root:/root:/bin/bash

* **uniq**
	
		只有相邻行一模一样，才算重复
	* 选项
	
			-c 显示文件中行重复的次数
			-d 只显示重复的行

* **wc** 文本统计 (word count)
		 
	* 选项
			
			-l 行数
			-c 字节(bytes)数
			-m 字符(chars)数
			-w 单词数
			-L 最长行的长度(包含字符数)

* **tr** 字符处理命令 翻译或删除字符
	* 选项
		
			-d 删除出现在字符集中的所有字符
	
	* 示例
	
			[root@localhost ~]# tr 'a-z' 'A-Z' < /etc/passwd
			ROOT:X:0:0:ROOT:/ROOT:/BIN/BASH
			BIN:X:1:1:BIN:/BIN:/SBIN/NOLOGIN
			DAEMON:X:2:2:DAEMON:/SBIN:/SBIN/NOLOGIN	

			[root@localhost pingxiang]# tr -d 'ad'
			abcde
			bce
			ssqwa
			ssqw
		  

---

##### [其他](id:其他)
 * **clear**: `清屏`
 * **hash**: 缓存(哈希: 键值对)，**`o(1)`**，实现系统加速

		## 算法 ##

		推导大O阶:
        	* 用常数1取代运行时间中的所有假发常数
        	* 在修改后的运行次数函数中，只保留最高阶项
        	* 如果最高阶项存在且不是1，则去除与这个项相乘的常数
   
		常见的时间复杂度:
			* 常数阶  O(1)
			* 线性阶  O(n)
			* 平方阶  O(n^2)
			* 对数阶  O(logn)
			* nlogn阶 O(nlogn)
			* 立方阶  O(n^3)
			* 指数阶  O(2^n)
			* 阶乘阶  O(n!)
			
		常见的时间复杂度所耗费的时间从小到大依次是:
			O(1)<O(logn)<O(n)<O(nlogn)<O(n^2)<O(n^3)<O(2^n)<O(n^n)

 * **printev**: 环境变量
 * **type**: 显示指定属于哪种类型
	* 命令类型
	
			内置命令(shell内置)，内部，内建
			外部命令: 在文件系统的某个路径下有一个与命令名称相应的可执行文件
	* 环境变量: 定义当前用户的环境
	
		   	变量即**命名的内存空间**
		   	变量赋值
		   	堆栈？
		   	PATH: 使用**: **分隔的路径

 * **help**: 获得命令使用帮助 `内部命令`
 
    	help COMMAND 
 * **--help** `外部命令`

   		COMMAND --help
 * **whatis**: 什么
 
    	whatis COMMAND

//tar -cvf backend-company-unitTest.tar backend-company-unitTest/

---

> ### [bash特性](id:bash特性)

   * **pstree** 查看
   * shell 子shell 
   	  * GUI
   	  * GLI 
   * 程序
   	  * 进程: 在每个进程看来，当前主机上只存在内核和当前进程
   	  * 进程是程序的副本，进程是程序执行的实例
   	  * 线程是程序执行的最小单位
   * bash 
   	  * 命令历史、命令补全
   	  * 管道、重定向
   	  * 命令别名
   	  * 命令行编辑
   	  * 命令行展开
   	  * 文件名通配
   	  * 变量
   	  * 编程
   * bash支持的引号:
   
		``: 命令替换
		"": 弱引用，可以实现变量替换
		'': 强引用，不完成变量替换 

---

##### [命令行编辑](id:命令行编辑)

 * **光标跳转**
 
      	Ctrl+a 跳到命令行首
	  	Ctrl+e 跳到命令行尾
		Ctrl+u 删除光标至命令行首的内容
		Ctrl+k 删除光标至命令行尾的内容
		Ctrl+l 清屏 
 * **history**
 	* 选项
 
			-c 清除历史
			-d offset [num] 删除指定位置的命令 
			-w 保存命令历史至历史文件中 `.bash_history`
 * 环境变量
    * PATH 命令搜索路径
    * HISTSIZE 命令历史缓冲区大小
    * `echo $ 输出变量的值`
    * 示例
    
 			[root@localhost ~]# echo $HISTSIZE
			1000
 * 命令历史的使用技巧
	
		!num 执行命令历中的第num条命令
		!-num 执行命令历史中的倒数第num条命令
		!! 执行上一条命令
		!string 执行命令历史中最后一个以指定字符串开头的命令
		!$ / Esc . / Alt+.  引用前一个命令的最后一个参数
 * 命令补全  在命令搜索路径(PATH)中查找  `Tab`
 * 路径补全  `Tab`	
 * 命令别名  
 	* alias CMDALIAS='COMMAND [options] [arguments]'  设置命令别名
 	* ualias CMDALIAS  撤销命令别名
  
 		在shell中定义的别名仅在当前的shell生命周期中有效: 别名的有效范围仅为当前shell进程
 * 命令替换  $(COMMAND), 反引号: `COMMAND`
 
 		把命令中某个子命令替换为其执行结果的过程

		[root@localhost ~]# touch ./file-$(date +%F-%H-%M-%S).txt[root@localhost ~]# ls
		file-2017-08-02-20-47-55.txt

