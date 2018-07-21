一、已有数据库，自动生成 E-R 图：

①、首先在你的MySQL workbench里选中Database——> reverse engineering

②、然后选择你建立的连接（也就是数据库）

③、接下来一路next，直到最后选择导出的数据库

④、接下来，见证奇迹的时刻，自动生成的 E-R 图大概长相如图：



二、先画 E-R 图，然后自动生成数据库：

http://jingyan.baidu.com/article/8065f87fe856242331249888.html

①、启动软件过后，注意不需要连接数据库（很多人就直接连接数据库了所以找不到设计ER模型的地方）

②、点击"+" ,进入模型设计界面

③、双击 Add Diagram 进入如下设计界面

④、点击工具栏表格，并在设计区域点击，就会出现一个table1 并双击它

⑤、最后 执行 “File”->"Export" 按钮，选择 Forward Engineer SQL CREATE Script (ctrl+shift+G). 这样就可以把模型导出为SQL脚本文件。现在执行这个SQL文件就OK了。 后面的就简单。呵呵

⑥、其他的功能自己测试玩玩 就好了，怎么设置外键连接关系，工具栏里面都有！