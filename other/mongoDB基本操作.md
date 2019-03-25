# mongoDB基本操作

---

	dbname: resourceCatalog
	collectionname: xzxk

## 基本命令

### 显示当前数据库服务器上的数据库

	show dbs;

### 切换到指定数据库

	use resourceCatalog;

### 显示数据库中所有的集合

	show collections;

### 查看数据库服务器的状态

	db.serverStatus()  

## 查

### 根据id获取数据
	
	db.xzxk.find({"_id":ObjectId("5c132ebd4f30650079506872")});

## 改

### 根据id更新数据

	db.xzxk.update({"_id":ObjectId("5ab78cdc623ade000b468742")},{$set:{"evaluationTime":"2018-03-26","goodType":"goodTypetes"}});