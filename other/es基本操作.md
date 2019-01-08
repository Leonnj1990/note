# es基本操作

---

	host: http://elasticsearch:9200
	index: document
	type: resourceCatalog
	
## 查

### 查看索引状态
	
	curl http://elasticsearch:9200/_cat/indices?v

### 根据条件搜索数据

	curl -XPOST http://elasticsearch:9200/document/resourceCatalog/_search?q=status:0\&pretty

### 根据id获取数据
	
	curl  -XGET http://elasticsearch:9200/document/resourceCatalog/AWerlcQ0lTzQpbLB2YJZ

## 删

### 删除索引

	curl -XDELETE http://elasticsearch:9200/document
	
### 根据id删除数据
	
	curl -XDELETE http://elasticsearch:9200/document/resourceCatalog/AWerlcQ0lTzQpbLB2YJZ
	