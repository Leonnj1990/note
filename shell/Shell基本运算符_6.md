# Shell基本运算符_6

---

Shell 和其他编程语言一样, 支持多种运算符, 包括: 

* 算数运算符
* 关系运算符
* 布尔运算符
* 字符串运算符
* 文件测试运算符

原生bash不支持简单的数学运算, 但是可以通过其他命令来实现, 例如 awk 和 expr, expr 最常用. 

**expr 是一款表达式计算工具, 使用它能完成表达式的求值操作**. 

例如, 两个数相加(注意使用的是反引号 **\`** 而不是单引号 **'**): 

	#!/bin/bash
	
	val=`expr 2 + 2`
	echo "两数之和为 : $val"

运行结果: 
	
	[root@localhost yichang]# ./test 
	两数之和为 : 4

两点注意: 

* **表达式和运算符之间要有空格**, 例如 2+2 是不对的, 必须写成 2 + 2, 这与我们熟悉的大多数编程语言不一样. 
* 完整的表达式要被 **\`** 包含, 注意这个字符不是常用的单引号, 在 Esc 键下边. 

## 算数运算符
 
下表列出了常用的算数运算符, 假定变量 **a为10**, 变量 **b为20**: 

<table cellspacing="0">
	<tr><th>运算符</th><th>说明</th><th>举例</th></tr>
	<tr><td>+</td><td>加法</td><td>`expr $a + $b` 结果为 30. </td></tr>
	<tr><td>-</td><td>减法</td><td>`expr $a - $b` 结果为 -10. </td></tr>
	<tr><td>*</td><td>乘法</td><td>`expr $a * $b` 结果为 200. </td></tr>
	<tr><td>/</td><td>除法</td><td>`expr $b / $a` 结果为 2. </td></tr>
	<tr><td>%</td><td>取余</td><td>`expr $b % $a` 结果为 0. </td></tr>
	<tr><td>=</td><td>赋值</td><td>a=$b 将把变量 b 的值赋给 a. </td></tr>
	<tr><td>==</td><td>相等. 用于比较两个数字, 相同则返回 true. </td><td>[ $a == $b ] 返回 false. </td></tr>
	<tr><td>!=</td><td>不相等. 用于比较两个数字, 不相同则返回 true. </td><td>	[ $a != $b ] 返回 true. </td></tr>
<table>

注意: **条件表达式要放在方括号之间, 并且要有空格**, 例如: [$a==$b] 是错误的, 必须写成 **[ $a == $b ]**. 

### 实例

算术运算符实例如下: 

	#！/bin/bash

	a=10
	b=20
	
	val=`expr $a + $b`
	echo "a + b : $val"
	
	val=`expr $a - $b`
	echo "a - b : $val"
	
	val=`expr $a \* $b`
	echo "a * b : $val"
	
	val=`expr $b / $a`
	echo "b / a : $val"
	
	val=`expr $b % $a`
	echo "b % a : $val"
	
	if [ $a == $b ]
	then
	   echo "a 等于 b"
	fi
	if [ $a != $b ]
	then
	   echo "a 不等于 b"
	fi

运行结果: 

	[root@localhost yichang]# ./test 
	a + b : 30
	a - b : -10
	a * b : 200
	b / a : 2
	b % a : 0
	a 不等于 b

**注意:**

* 乘号 "\* " 前边必须加反斜杠 "\\" 才能实现乘法运算;
* 在 MAC 中 shell 的 expr 语法是:$((表达式)), 此处表达式中的 "\*" 不需要转义符号 "\\".

## 关系运算符

关系运算符**只支持数字**, 不支持字符串, 除非字符串的值是数字. 

下表列出了常用的关系运算符, 假定变量 **a为10**, 变量 **b为20**: 

<table cellspacing="0">
	<tr><th>运算符</th><th>说明</th><th>举例</th></tr>
	<tr><td>-eq</td><td>检测两个数是否相等, 相等返回 true. </td><td>[ $a -eq $b ] 返回 false. </td></tr>
	<tr><td>-ne</td><td>检测两个数是否相等, 不相等返回 true. </td><td>[ $a -ne $b ] 返回 true. </td></tr>
	<tr><td>-gt</td><td>检测左边的数是否大于右边的, 如果是, 则返回 true. </td><td>[ $a -gt $b ] 返回 false. </td></tr>
	<tr><td>-lt</td><td>检测左边的数是否小于右边的, 如果是, 则返回 true. </td><td>[ $a -lt $b ] 返回 true. </td></tr>
	<tr><td>-ge</td><td>检测左边的数是否大于等于右边的, 如果是, 则返回 true. </td><td>[ $a -ge $b ] 返回 false. </td></tr>
	<tr><td>-le</td><td>检测左边的数是否小于等于右边的, 如果是, 则返回 true. </td><td>[ $a -le $b ] 返回 true. </td></tr>
<table>

### 实例

关系运算符实例如下: 

	#!/bin/bash
	
	a=10
	b=20
	
	if [ $a -eq $b ]
	then
	   echo "$a -eq $b : a 等于 b"
	else
	   echo "$a -eq $b: a 不等于 b"
	fi
	if [ $a -ne $b ]
	then
	   echo "$a -ne $b: a 不等于 b"
	else
	   echo "$a -ne $b : a 等于 b"
	fi
	if [ $a -gt $b ]
	then
	   echo "$a -gt $b: a 大于 b"
	else
	   echo "$a -gt $b: a 不大于 b"
	fi
	if [ $a -lt $b ]
	then
	   echo "$a -lt $b: a 小于 b"
	else
	   echo "$a -lt $b: a 不小于 b"
	fi
	if [ $a -ge $b ]
	then
	   echo "$a -ge $b: a 大于或等于 b"
	else
	   echo "$a -ge $b: a 小于 b"
	fi
	if [ $a -le $b ]
	then
	   echo "$a -le $b: a 小于或等于 b"
	else
	   echo "$a -le $b: a 大于 b"
	fi

运行结果: 

	[root@localhost yichang]# ./test 
	10 -eq 20: a 不等于 b
	10 -ne 20: a 不等于 b
	10 -gt 20: a 不大于 b
	10 -lt 20: a 小于 b
	10 -ge 20: a 小于 b
	10 -le 20: a 小于或等于 b

## 布尔运算符

下表列出了常用的布尔运算符, 假定变量 **a为10**, 变量 **b为20**: 

<table cellspacing="0">
	<tr><th>运算符</th><th>说明</th><th>举例</th></tr>
	<tr><td>!</td><td>非运算, 表达式为 true 则返回 false, 否则返回 true. </td><td>[ ! false ] 返回 true. </td></tr>
	<tr><td>-o</td><td>或运算, 有一个表达式为 true 则返回 true. </td><td>[ $a -lt 20 -o $b -gt 100 ] 返回 true. </td></tr>
	<tr><td>-a</td><td>	与运算, 两个表达式都为 true 才返回 true. </td><td>[ $a -lt 20 -a $b -gt 100 ] 返回 false. </td></tr>
<table>

### 实例

布尔运算符实例如下: 

	#!/bin/bash
	
	a=10
	b=20
	
	if [ $a != $b ]
	then
	   echo "$a != $b : a 不等于 b"
	else
	   echo "$a != $b: a 等于 b"
	fi
	if [ $a -lt 100 -a $b -gt 15 ]
	then
	   echo "$a 小于 100 且 $b 大于 15 : 返回 true"
	else
	   echo "$a 小于 100 且 $b 大于 15 : 返回 false"
	fi
	if [ $a -lt 100 -o $b -gt 100 ]
	then
	   echo "$a 小于 100 或 $b 大于 100 : 返回 true"
	else
	   echo "$a 小于 100 或 $b 大于 100 : 返回 false"
	fi
	if [ $a -lt 5 -o $b -gt 100 ]
	then
	   echo "$a 小于 5 或 $b 大于 100 : 返回 true"
	else
	   echo "$a 小于 5 或 $b 大于 100 : 返回 false"
	fi

运行结果: 

	[root@localhost yichang]# ./test 
	10 != 20 : a 不等于 b
	10 小于 100 且 20 大于 15 : 返回 true
	10 小于 100 或 20 大于 100 : 返回 true
	10 小于 5 或 20 大于 100 : 返回 false

## 逻辑运算符

以下介绍逻辑运算符, 假定变量 **a为10**, 变量 **b为20**:

<table cellspacing="0">
	<tr><th>运算符</th><th>说明</th><th>举例</th></tr>
	<tr><td>&&</td><td>逻辑的 AND</td><td>[[ $a -lt 100 && $b -gt 100 ]] 返回 false</td></tr>
	<tr><td>||</td><td>逻辑的 OR</td><td>[[ $a -lt 100 || $b -gt 100 ]] 返回 true</td></tr>
<table>

### 实例

逻辑运算符实例如下: 

	#!/bin/bash
	
	a=10
	b=20
	
	if [[ $a -lt 100 && $b -gt 100 ]]
	then
	   echo "返回 true"
	else
	   echo "返回 false"
	fi
	
	if [[ $a -lt 100 || $b -gt 100 ]]
	then
	   echo "返回 true"
	else
	   echo "返回 false"
	fi

运行结果: 

	[root@localhost yichang]# ./test 
	返回 false
	返回 true

## 字符串运算符

下表列出了常用的字符串运算符, 假定变量 **a为"abc"**, 变量 **b为"efg"**: 

<table cellspacing="0">
	<tr><th>运算符</th><th>说明</th><th>举例</th></tr>
	<tr><td>=</td><td>检测两个字符串是否相等, 相等返回 true. </td><td>[ $a = $b ] 返回 false. </td></tr>
	<tr><td>!=</td><td>检测两个字符串是否相等, 不相等返回 true. </td><td>[ $a != $b ] 返回 true. </td></tr>
	<tr><td>-z</td><td>检测字符串长度是否为0, 为0返回 true. </td><td>[ -z $a ] 返回 false. </td></tr>
	<tr><td>-n</td><td>检测字符串长度是否为0, 不为0返回 true. </td><td>[ -n $a ] 返回 true. </td></tr>
	<tr><td>str</td><td>检测字符串是否为空, 不为空返回 true. </td><td>[ $a ] 返回 true. </td></tr>
<table>

### 实例

字符串运算符实例如下: 

	#!/bin/bash
	
	a="abc"
	b="efg"
	
	if [ $a = $b ]
	then
	   echo "$a = $b : a 等于 b"
	else
	   echo "$a = $b: a 不等于 b"
	fi
	if [ $a != $b ]
	then
	   echo "$a != $b : a 不等于 b"
	else
	   echo "$a != $b: a 等于 b"
	fi
	if [ -z $a ]
	then
	   echo "-z $a : 字符串长度为 0"
	else
	   echo "-z $a : 字符串长度不为 0"
	fi
	if [ -n $a ]
	then
	   echo "-n $a : 字符串长度不为 0"
	else
	   echo "-n $a : 字符串长度为 0"
	fi
	if [ $a ]
	then
	   echo "$a : 字符串不为空"
	else
	   echo "$a : 字符串为空"
	fi

运行结果: 

	[root@localhost yichang]# ./test 
	abc = efg: a 不等于 b
	abc != efg : a 不等于 b
	-z abc : 字符串长度不为 0
	-n abc : 字符串长度不为 0
	abc : 字符串不为空


