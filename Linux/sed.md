# sed

---

以 `importTest` 文件为例.

### 参数说明:

* `-i` 可以直接修改文件内容.
* `-n` 打印输出查找的内容.

### 动作说明:

* a: **新增**, a 的后面可以接字符串，这些字符串会在 **新的一行(目前的下一行)** 出现;
* i: **插入**, i 的后面可以接字符串，这些字符串会在 **新的一行(目前的上一行)** 出现;
* c: **取代**, c 的后面可以接字符串，这些字符串可以取代 n1,n2 之间的行, **用新的文本取代选定行的文本**;
* d: **删除**, d 后面通常**不接任何字符串**;
* s: **替换**, s 的动作**可以搭配正规表示法**, 例如 `1,20s/old/new/g`.

## 新增

在 114行 新增 `var_dump(114);exit();`

```
sed -i '113a var_dump(114);exit();' importTest

sed -i '114i var_dump(114);exit();' importTest

sed -i '114 s/^/var_dump(114);exit();\n/' importTest
```

## 以行为单位的取代

将 113-116行之间 的内容 取代为 `No 113-116 number`

```
sed -i '113,116c No 113-116 number' importTest
```

## 查找并显示

查找 `exit` 并显示该行内容

```
sed -n '/exit/p' importTest

root@76107d3f6d4b:/var/www/html# sed -n '/exit/p' importTest
        1111exit();*/
var_dump(114);exit();
var_dump(115);exit();
var_dump(113);exit();
var_dump(115);exit();
```

查找 `exit` 并显示该行内容以及**行号**

```
nl importTest | sed -n '/exit/p'

root@76107d3f6d4b:/var/www/html# nl importTest | sed -n '/exit/p'
    46	        1111exit();*/
    93	var_dump(114);exit();
    94	var_dump(115);exit();
    95	var_dump(113);exit();
    96	var_dump(115);exit();

```

## 查找并删除

删除 114行 内容

```
sed -i '114d' importTest 
```

删除 113-115行 内容

```
sed -i '113,115d' importTest 
```

## 查找并替换

将 `old` 替换为 `new`

```
sed -i 's/old/new/g' importTest
```

在 114行 **行首**新增 `var_dump(114);exit();` 并**换行**

```
sed -i '114 s/^/var_dump(114);exit();\n/' importTest
``` 