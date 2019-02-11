## 接口平台SDK演示例子
[![Maven central](https://maven-badges.herokuapp.com/maven-central/com.rnkrsoft.platform/interface-platform-standalone/badge.svg)](http://search.maven.org/#search|ga|1|g%3A%22com.rnkrsoft.platform%22%20AND%20a%3A%22interface-platform-standalone%22)

```xml
<dependency>
    <groupId>com.rnkrsoft.platform</groupId>
    <artifactId>interface-platform-standalone</artifactId>
    <version>最新版本号</version>
</dependency>
```
## 使用MySQL数据库
### 1.安装MySQL数据库，如果安装了跳过，直接第二步
### 2.执行script/init.sql脚本，创建数据库interface_platform
### 3.修改src/main/resource/jdbc.properties中的数据库地址，用户名和密码
### 4.安装Redis，如果安装了跳过，直接第5步
### 5.修改src/main/resource/cache.properties中的redis地址，密码和index（Redis数据库序号）
### 6.运行maven命令 mvn org.apache.tomcat.maven:tomcat7-maven-plugin:2.2:run 或者在idea中运行tomcat7->tomcat7:run启动项目，如果实在不会则编译成war放入tomcat中启动
### 7.启动后可以用post方式访问http://localhost:80/api，发送请求报文





## 使用H2数据库

### 1.安装Redis，如果安装了跳过，直接第5步
### 2.修改src/main/resource/cache.properties中的redis地址，密码和index（Redis数据库序号）
### 3.运行maven命令 mvn org.apache.tomcat.maven:tomcat7-maven-plugin:2.2:run 或者在idea中运行tomcat7->tomcat7:run启动项目，如果实在不会则编译成war放入tomcat中启动
### 4.启动后可以用post方式访问http://localhost:80/api，发送请求报文
### 5.使用interface-platform-client4j-demo项目或者interface-platform-client4j-spring-demo

值得注意的是H2方式启动需要xml如下节点配置。

```xml
    <!-- 初始化数据表结构 -->
    <jdbc:initialize-database data-source="defaultDataSource" ignore-failures="ALL">
        <jdbc:script location="classpath:sql/h2/schema.sql" encoding="UTF-8" />
        <jdbc:script location="classpath:sql/h2/data.sql" encoding="UTF-8"/>
    </jdbc:initialize-database>
```

```json
{
	"channel": "public",//通道号
	"txNo": "000", //交易码
	"version": "1",//版本号
	"sessionId": "1234567890", //会话号
	"uid": null,   //用户号
	"uic": null,   //用户设备识别码
	"deviceManufacturer":"xiaomi",
	"deviceModel":"S2",
	"deviceType":"Android",
	"osVersion":"6.1.2",
	"appVersion":"1.0.0",
	"timestamp": "20180724155700743", //发送请求的时间戳
	"token": "", //TOKEN令牌
	"sign": "", //data对应的签字信息
	"lng": 0.0, //经度
	"lat": 0.0 //纬度
	"data": "{}", //业务对象序列化的JSON字符串  例如:LoginRequest
}
```

### 8.将会收到应答

```json
{
	"data": "{}", //业务对象序列化的JSON字符串  例如:LoginResponse
	"sign":  "",   //data对应的签字信息
	"code": "000", //通信层应答代码
	"desc": "通信成功" //通信层应答描述
}
```

### 9.获取客户端调用，比实现报文调用更方便，更安全
```
java原生调用
https://github.com/rnkrsoft/interface-platform-client4j-demo

spring集成调用
https://github.com/rnkrsoft/interface-platform-client4j-spring-demo
```


