# mysql索引说明

---

### 选择索引的数据类型

MySQL支持很多数据类型, 选择**合适的数据类型**存储数据对性能有很大的影响. 通常来说, 可以遵循以下一些指导原则:

1. **越小的数据类型**通常更好:
	越小的数据类型通常在磁盘、内存和CPU缓存中都需要更少的空间, 处理起来更快. 
2. **简单的数据类型**更好:
	1. 整型数据比起字符, 处理开销更小, 因为字符串的比较更复杂;
	2. 在MySQL中, 应该用内置的日期和时间数据类型, 而不是用字符串来存储时间;
	3. 用整型数据类型存储IP地址.
3. 尽量**避免NULL**:
	1. 应该指定列为NOT NULL, 除非你想存储NULL;
	2. 在MySQL中, 含有空值的列很难进行查询优化, 因为它们使得索引、索引的统计信息以及比较运算更加复杂;
	3. 你应该用0、一个特殊的值或者一个空串代替空值.

### 索引的类型

索引是在**存储引擎**中实现的. 所以, 每种存储引擎的索引都不一定完全相同, 并不是所有的存储引擎都支持所有的索引类型. 

假设有如下一个用户表:

	CREATE TABLE `user` (
  	   `user_id`     int(10)         NOT NULL COMMENT '用户id',
	   `last_name`   varchar(50)     NOT NULL,
	   `first_name`  varchar(50)     NOT NULL,
	   `birthday`    date      	     NOT NULL COMMENT '出生日期',
	   `gender`      enum('m', 'f')  NOT NULL COMMENT '性别',
	   `update_time` int(10)         NOT NULL COMMENT '更新时间'
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

	ALTER TABLE `user`
	  ADD PRIMARY KEY (`user_id`),
	  ADD KEY `idx_last_first_name_birthday` (`last_name`,`first_name`,`birthday`);

	ALTER TABLE `user`
  	  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id';

#### 1. B-Tree索引

索引存储的值按索引列中的顺序排列. 可以利用B-Tree索引进行**全关键字**、 **关键字范围** 和 **关键字前缀**查询, 当然, 如果想使用索引, 你必须保证按索引的**最左边前缀**来进行查询. 

1. **匹配全值**: 对索引中的所有列都指定具体的值. 例如, 索引可以帮助你查找出生于1990-01-01的Cuba Allen. 
2. **匹配最左前缀**: 可以利用索引**查找last_name**为Allen的人, 仅仅使用索引中的第1列. 
3. **匹配列前缀**: 可以利用索引**查找last_name**以J开始的人, 这仅仅使用索引中的第1列. 
4. **匹配值的范围查询**: 可以利用索引**查找last_name**在Allen和Barrymore之间的人, 仅仅使用索引中第1列. 
5. **匹配部分精确而其它部分进行范围匹配**: 可以利用索引**查找last\_name**为Allen, **而first_name**以字母K开始的人. 
6. **仅对索引进行查询**: 如果查询的列都位于索引中, 则不需要读取元组的值. 

由于B-树中的节点都是顺序存储的, 所以可以利用索引进行查找(找某些值), 也可以对查询结果进行ORDER BY. 当然, 使用B-tree索引有以下一些**限制**:

1. **必须符合最左原则**. 例如你不能利用索引查找在某一天出生的人. 
2. **不能跳过某一索引列**. 例如, 你不能利用索引**查找last_name**为Smith且出生于某一天的人. 
3. 存储引擎**不能使用索引中范围条件右边的列**. 如果你的查询语句为 WHERE last\_name='Smith' AND first\_name LIKE 'J%' AND birthday='1976-12-23', 则该查询只会使用索引中的前两列**last\_name、first_name**, 因为LIKE是范围查询. 

#### 2. Hash索引

MySQL中, 只有Memory存储引擎显示支持hash索引, 是Memory表的默认索引类型, 尽管Memory表也可以使用B-Tree索引. Memory存储引擎支持非唯一hash索引, 这在数据库领域是罕见的, 如果多个值有相同的hash code, 索引把它们的行指针用链表保存到同一个hash表项中.

Hash索引有以下一些**限制**:

1. 由于索引仅包含hash code和记录指针, 所以, MySQL不能通过使用索引避免读取记录. 但是访问内存中的记录是非常迅速的, 不会对性造成太大的影响. 
2. 不能使用hash索引排序. 
3. Hash索引不支持键的部分匹配, 因为是通过整个索引值来计算hash值的. 
4. Hash索引只支持等值比较, 例如使用=, IN( )和<=>. 对于WHERE price>100并不能加速查询. 

#### 3. 空间(R-Tree)索引

MyISAM支持空间索引, 主要用于地理空间数据类型, 例如GEOMETRY.

#### 4. 全文(Full-text)索引

全文索引是MyISAM的一个特殊索引类型, 主要用于全文检索.

### 覆盖索引

如果索引包含满足查询的所有数据, 就称为覆盖索引. 覆盖索引是一种非常强大的工具, 能大大提高查询性能. 只需要读取索引而不用读取数据有以下一些优点:

1. 索引项通常比记录要小, 所以MySQL访问更少的数据;
2. 索引都按值的大小顺序存储, 相对于随机访问记录, 需要更少的I/O;
3. 大多数据引擎能更好的缓存索引. 比如MyISAM只缓存索引;
4. 覆盖索引对于InnoDB表尤其有用, 因为InnoDB使用聚集索引组织数据, 如果二级索引中包含查询所需的数据, 就不再需要在聚集索引中查找了. 

覆盖索引不能是任何索引, 只有B-TREE索引存储相应的值. 而且不同的存储引擎实现覆盖索引的方式都不同, 并不是所有存储引擎都支持覆盖索引(Memory和Falcon就不支持). 

对于索引覆盖查询(index-covered query), 使用**EXPLAIN**时, 可以在Extra一列中看到'Using index'. 例如, 在user表中, 有一个组合索引(last\_name,first_name,birthday), 对于只需要访问这两列的查询, MySQL就可以使用索引, 如下:

	mysql> EXPLAIN SELECT `last_name`,`first_name`,`birthday` FROM user\G;
	
	*************************** 1. row ***************************
	
	           id: 1

	 select_type: SIMPLE
	
	        table: user
	
	         type: index
	
	possible_keys: NULL
	
	          key: idx_last_first_name_birthday
	
	      key_len: 307
	
	          ref: NULL
	
	         rows: 1
	
	        Extra: Using index

### MySql在建立索引时需要注意的问题

#### 1、过度索引

不是什么情况都非得建索引不可, 比如性别可能就**只有两个值**, 建索引不仅没什么优势, 还会影响到更新速度, 这被称为**过度**索引.

#### 2、复合索引

比如有一条语句是这样的: select * from user where last_name='Smith' and first_name='1976-12-23'.

如果我们是在last_name和first_nam上**分别创建**单个索引的话, 由于mysql查询每次只能使用**一个索引**, 所以虽然这样已经相对不做索引时全表扫描提高了很多效.

如果我们创建了(last_name, first_name, birthday)的复合索引, 那么其实相当于创建了(last_name, first_name, birthday)、(last_name,first_name)、(last_name)三个索引, 这被称为最佳左前缀特性.

因此我们在创建复合索引时应该将**最常用**作限制条件的列放在**最左边**, 依次递减.

#### 3、索引不会包含有NULL值的列

只要列中包含有NULL值都将不会被包含在索引中, 复合索引中只要有**一列**含有**NULL值**, 那么这一列对于此复合索引就是**无效**的. 所以我们在数据库设计时不要让字段的默认值为NULL.

#### 4、排序的索引问题

mysql查询只使用一个索引, 因此如果where子句中已经使用了索引的话, 那么order by中的列是不会使用索引的. 因此数据库默认排序可以符合要求的情况下不要使用排序操作；尽量不要包含**多个列的排序**, 如果需要最好给这些列创建**复合索引**

#### 5、like语句操作

一般情况下不鼓励使用like操作, 如果非使用不可, 如何使用也是一个问题. like '%aaa%' 不会使用索引而**like 'aaa%'**可以使用索引. 

#### 6、不要在列上进行运算

select * from user where YEAR(birthday);

### 使用mysql的limit进行分页时出现重复问题

#### Q1: 使用mysql的limit进行分页时, 例如 select * from user where 1=1 limit 1,2, 这样后面的页可能会出现重复数据.

A: 可以通过加入order by field_1子句来解决这种情况 
	
		对应的sql语句是
		select * from user  where 1=1 order by update_time limit 1,2


#### Q2: 可以加入order by field子句来解决问题一, 但是如果field_1字段有相同值的情况下, 后面的页还是会出现重复数据.

A: 1.可以加入第二个排序字段(值唯一), 可以选主键user_id 

	对应的sql语句是
		select * from user  where 1=1 order by update_time, user_id limit 1,2
   2.可以给field_1创建索引

但是最好保证**field_1在表中的值是唯一的**, 这样就可以少写一个排序字段, 增加查询效率.