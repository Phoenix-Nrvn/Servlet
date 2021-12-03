# Ming

# 简介

一个部署在Eclipse上的关于利用JDBC技术连接数据库的小项目，包括前端界面。

> 注：JDBC是一种用于SQL语句的Java API，由一组类和接口组成，通过调用这些类和接口所提供的方法，可已使用标准的SQL语言来存取数据库中的数据。

# 包括

Servlet + jsp + MySQL

实现数据管理的基本功能，所用数据库为db_database10 数据表是tb_account

# 使用步骤

1. 在MySQL中导入附件db_database10.sql

> 附：导入命令：
>
> `CREATE DATABASE db_database10;`
>
>  `USE db_database10;`
>
>  `SOURCE 数据库保存路径; `

2. 在Eclipse中(编程时使用的这个，IntelliJ IDEA没试过，不知道能不能成功)，点击file->import->General->Exsisting project->Broswer保存路径->finish

   > 附：若出现红叉，点击项目，右键选择Build path->Configure Build path->Libraries,双击带有(bound)字段的条目，改为自己电脑上相应配置即可。

3. 更改InnoDB.java中的数据库路径和用户名和密码，保证可以连接成功

   > 附：注意根据自己的MySQL版本，选择合适的connector版本，否则可能会出错

4. 运行Rgstr.jsp，按理来说，会是非常流畅的一套体系下来

   那，报错的话，就看出错信息咯，就，互联网真强大！

那就可以咯，祝运行顺利！

# 对自己说

第一次导出数据库为.sql文件的时候，还不知道应该在Windows里的命令行操作，跑到MySQL命令行里，照着命令mysqldump -uroot -p --databases db_database10 >db_database10.sql;(还记得了加分号，的说.....)”啪啪啪“一顿输入，结果报了几次错，不知悔改，搜遍互联网，将近一个小时过去了，全无所获。后来，试着用了命令行，“啪”地一下，很快啊，就按照预定流程导出来了(依旧是上述命令，即**mysqldump -uroot -p --databases 数据库名称 >保存路径\数据库名.sql (* 千万别加分号!!! * **) )，emmm

就，一定要看清楚教程怎么说.....

