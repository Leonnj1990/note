# Shell字符串_3

---

字符串是shell编程中最常用最有用的数据类型 (除了数字和字符串, 也没啥其它类型好用了), 字符串可以用单引号, 也可以用双引号, 也可以不用引号. **单双引号的区别跟PHP类似**. 

## 单引号

	#!/bin/bash

	str='this is a string'
	echo $str

运行结果: 

	[root@localhost yichang]# ./test 
	this is a string

**单引号字符串的限制**: 

* 单引号里的任何字符都会**原样输出**, 单引号字符串中的**变量是无效**的；
* 单引号字串中不能出现单引号 (对单引号使用转义符后也不行). 

## 双引号

	#!/bin/bash

	your_name='leon'
	str="Hello, I know your are \"$your_name\"!\n"

运行结果: 

	[root@localhost yichang]# ./test 
	Hello, I know your are "leon"!

**双引号的优点**: 

* 双引号里可以有变量
* 双引号里可以出现转义字符

## 拼接字符串

	#!/bin/bash

	your_name="leon"
	greeting="hello, "$your_name" !"
	greeting_1="hello, ${your_name} !"
	echo $greeting $greeting_1

运行结果: 

	[root@localhost yichang]# ./test 
	hello, leon ! hello, leon !

## 获取字符串长度

	#!/bin/bash

	string="abcd"
	echo ${#string}

运行结果: 

	[root@localhost yichang]# ./test 
	4

## 提取子字符串

以下实例从字符串**第 2 个字符开始**截取 **4 个字符**: 

	#!/bin/bash

	string="baidu is a great site"
	echo ${string:1:4}

运行结果: 

	[root@localhost yichang]# ./test 
	aidu

## 查找子字符串

查找字符 "i 或 s" 的位置: 

	#!/bin/bash

	string="baidu is a great company"
	echo `expr index "$string" is`  

运行结果: 

	[root@localhost yichang]# ./test 
	3

注意: 以上脚本中 **\`** 是反引号, 而不是单引号 **'**. 

## Shell 注释

以 `#` 开头的行就是注释, 会被解释器忽略. 

sh里**没有多行注释**, 只能每一行加一个 `#` 号. 如: 

	#--------------------------------------------
	# 这是一个注释
	# author: leon
	# version: 1.0.0
	# date: 2018-04-24
	#--------------------------------------------

如果在开发过程中, 遇到大段的代码需要临时注释起来, 过一会儿又取消注释, 怎么办呢？

每一行加个**#**符号太费力了, 可以把这一段要注释的代码用一对花括号括起来, **定义成一个函数**, 没有地方调用这个函数, 这块代码就不会执行, 达到了和注释一样的效果. 