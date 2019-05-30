# 02_02\_Linux操作系统及常用命令

---

## 常用命令

### date

时间管理: 用来**显示或设定**系统的日期与时间

* 选项
	* -d "字符串": **显示**字符串所指的日期与时间, **字符串前后必须加上双引号**
	* -s "字符串": 根据字符串来**设置**日期与时间, **字符串前后必须加上双引号**
* 日期格式字符串列表
	* %Y: 年份(以四位数来表示) 
	* %m: 月份(以01-12来表示) 
	* %d: 日期(以01-31来表示)
	* %H: 小时(以00-23来表示) 
	* %M: 分钟(以00-59来表示) 
	* %S: 秒(以本地的惯用法来表示) 
	* %F: 年-月-日
	* %T: 时:分:秒
	* %s: 时间戳, 从`1970-01-01 00:00:00 UTC`开始的秒数

```
root@4685ea5dbd9a:/var/www/html# date
Wed May 15 14:45:39 CST 2019
	
root@4685ea5dbd9a:/var/www/html# date +"%Y-%m-%d" | date +%F
2019-05-15	//格式化   	
	
root@4685ea5dbd9a:/var/www/html# date -d "1 day ago" +"%Y-%m-%d"
2019-05-14	//昨天的日期
	
root@4685ea5dbd9a:/var/www/html# date -d "2 hour" +"%Y-%m-%d %H:%M:%S" 
2019-05-15 16:51:07	//2小时后

root@4685ea5dbd9a:/var/www/html# date +"%F %T"
2019-05-25 22:50:47

root@4685ea5dbd9a:/var/www/html# date +"%s"
1558795881
```

> Linux时间系统之RTC时间

* 系统时钟(sys): 由Linux系统软件维持的时间, 可用 `date` 查看
* 硬件时钟(hc): 可用 `clock` 查看

### hwclock

* 选项
	* -w: 将系统时钟写入到硬件时钟(systohc)
	* -s: 将硬件时钟写入到系统时间(hctosys)

### cal`calendar`

日历

### bc

计算器

### echo

将参数写入标准输出

```
root@4685ea5dbd9a:/var/www/html# echo "This year is 2019, This month is 12."
This year is 2019, This month is 12.

root@4685ea5dbd9a:/var/www/html# echo -e "This year is 2019, \nThis month is 12."
This year is 2019,
This month is 12.
```

### printf

```
root@4685ea5dbd9a:/var/www/html# printf "This year is 2019, This month is 12."
This year is 2019, This month is 12.%                                                                  

root@4685ea5dbd9a:/var/www/html# printf "This year is 2019, This month is 12.\n"
This year is 2019, This month is 12.

root@4685ea5dbd9a:/var/www/html# printf "This year is 2019, \nThis month is 12.\n"
This year is 2019,
This month is 12.
```

## 帮助命令

### 内部命令

```
help COMMAND
```

### 外部命令

```
COMMAND --help
```
	
### 命令手册`manual`

```
man COMMAND
```

#### 章节说明

* 1. 用户命令(/bin, /usr/bin, /usr/local/bin)
* 2. 系统调用
* 3. 库用户, 库调用
* 4. 特殊文件(设备文件: **块设备和字符设备**)
* 5. 文件格式(配置文件的语法)
* 6. 游戏
* 7. Misellaneous(杂项)
* 8. 管理命令(/sbin, /usr/sbin, /usr/local/sbin): 管理员使用

#### 符号说明

* `<>`: 必选
* `[]`: 可选
* `...`: 可以出现多次
* `|`: 多选一
* `{}`: 分组

#### MAN

* NAME: 命令名称及功能简要说明
* SYNOPSIS: 用法说明, 包括可用的选项
* DESCRIPTION: 命令功能的详尽说明, 可能包括每一个选项的意义
* OPTIONS: 说明每一个选项的意义
* FILES: 此命令相关的配置文件
* BUGS:
* EXAMPLES: 使用示例
* SEE ALSO: 另外参照

#### 翻屏

* 向后翻一屏: SPACE
* 向前翻一屏: b
* 向后翻一行: ENTER
* 向前翻一行: k

#### 查看命令出现在哪个章节

```
whatis COMMAND
```

#### 查找

* `/KEYWORD`: 向后
	* n: 下一个
	* N: 前一个
* `?KEYWORD`: 向前
	* n: 下一个
	* N: 前一个
* q: 退出

### 在线文档

```
info COMMAND
```

### 文档

```
cd /usr/share/doc
```