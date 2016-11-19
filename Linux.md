#linux

---

###目录

* [linux操作系统基础](#linux操作系统基础)
* [操作系统及常用命令](#操作系统及常用命令)
* 
###[linux操作系统基础](id:linux操作系统基础)

  * 操作系统：**系统调用**
     * 应用程序（启动：自启动、按需启动）
     * **[内核](#内核管理)**：kernel space
     * **[库](#库)**：library（lib）可执行，但无执行入口
     * **shell**：接受用户命令，转换用户命令为计算机可理解的二进制形式，并将其发送给内核（按需启动）
        * GUI:**图形用户界面**（Graphical User Interface）
        * CLI：**命令行界面**（Command Line Interface）
  * GUN：**革奴计划**
	* GPL:**反版权**
  * [内核管理](id:内核管理)
    * 进程管理
    * 内存管理
    * 文件系统
    * 驱动程序
    * 网络接口
    * 进程间通信 
  * [库](id:库)
    * Windows：dll(Dynamic Link Library)动态链接库
    * Linux：
        * so(shared object)共享对象
        * dso(Dynamic shared object)动态共享对象
  * 命令 选项 参数 
    * 用户类型
      * root **#**
      * 普通用户 **$**
    * 选项：修改命令执行特性
      * 短选项 **-** 可组合 -a -b =-ab
      * 长选项 **--** 通常不可组合
    * 参数：命令的作用对象 

###[操作系统及常用命令](id:操作系统及常用命令)

   * 虚拟终端：terminal(Ctrl+Alt+F1-F6)
   * 使用凭证：root redhat  区分大小写
   * [切换用户](#切换用户)：su(switch user)
   * [文件列表](#文件列表)：ls(list) 
   
####[切换用户](id:切换用户)：su 
####[文件列表](id:文件列表)：ls
 
  * 目录：文件，路径映射  **/**
    * Working Directory,Current Directory
    * **pwd**：Printing Working Directory 当前目录
  * 路径：从指定起始点到目的地所经过的位置
  * 文件系统 File System
  * **ls**
    * -l：长格式
       * 文件类型
          * -：普通文件(f)
          * d：目录文件
          * b：块设备文件(block)
          * c：字符设备文件(character)
          * l：符号链接文件(symbolic link file)
          * p：命令管道文件(pipe)
          * s：套接字文件(socket)
        * 文件权限
          * 9位，每三位一组，每一组：rwx(读，写，执行)，r--
          * u：**user**
          * g：**group**
          * o：**other**
          * a：**all** 代表以上三种
          * r：4
          * w：2
          * x：1
        * 文件硬链接的次数
        * 文件的属主(owner)
        * 文件的属组(group)
        * 文件大小(size),单位：字节
        * 时间戳(timestamp)
          * 最近一次被**访问**的时间：access
          * 最近一次被**修改**的时间：modify，文件内容发生了改变
          * 最近一次被**改变**的时间：change，metadata，元数据
    * -h：做单位转换，将文件 **字节** 转化为 **k**
    * -a：显示以 **.** 开头的隐藏文件
       * **.** 表示当前目录
       * **..** 表示父目录
    * -A：显示所有隐藏文件(包含**.**和**..**)
    * -d：显示目录自身属性
    * -i：显示文件的索引节点号 index node，inode
    * -r：逆序显示(默认升序显示)
    * -R：递归(recursive)显示
* **cd**：change directory 切换目录
   * 家目录，主目录，Home directory **cd ~**或者**cd**  
   		* cd ~USERNAME:进入指定用户的家目录
   		* cd -：在当前目录和前一次所在的目录之间来回切换
* **clear**：清屏
* **hash**：缓存(哈希：键值对)，**o(1)**，实现系统加速
* **printev**：环境变量
* **type**：显示指定属于哪种类型
	* 命令类型：
		* 内置命令(shell内置)，内部，内建
		* 外部命令：在文件系统的某个路径下有一个与命令名称相应的可执行文件
	* 环境变量：定义当前用户的环境
		* 变量即**命名的内存空间**
		* 变量赋值
		* 堆栈？
		* PATH：使用**：**分隔的路径
		* 