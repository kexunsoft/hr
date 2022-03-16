**科讯人力资源管理系统**

项目演示地址:[http://demo.kexunsoftware.com/login](http://demo.kexunsoftware.com/login)
账号:lidong 密码:123
**注:若访问报错或者无法访问,可与我联系修复**
微信:kexunsoftware QQ:3275208135


**项目使用到的技术及项目运行环境**

**主要技术:**
java spring mybatis mysql jsp layui ajax

**运行环境:**
java8 maven3 mysql5.x

**项目启动步骤:**

1. 将项目导入到开发工具 这里推荐使用idea (eclipse也可以)
2. 配置好idea maven本地仓库及配置文件(入已配置略过此步骤)
3. 配置好maven后 找到hr-parent父项目 先执行clear操作 
4. 导入sql脚本 使用记事本打开复制到可视化工具或者使用可视化工具直接导入 接下来创建数据库名为hr 执行sql脚本
5. 找到hr-dao>src>main>resources>jdbc.properties 将username,password 修改为自己数据库的用户名和密码
6. 找到启动按钮>Edit Configurations...>点击左上角+找到Tomcat Server 选择Local
   添加成功后在点击Deployment 点击右边的+ 选择第一个Artifact >选择hr-web:war exploded 点击ok>点击右下角的apply>点击ok
7. 点击启动按钮启动项目

sql获取地址:http://demo.kexunsoftware.com/page/sql.html

> 注意:如启动不了可能是端口占用,可到启动配置里面修改端口

启动视频教程: [视频教程](https://v.douyin.com/LW1pbj7/)








