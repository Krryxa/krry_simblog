
# 乐诗论坛博客系统
> 乐诗论坛是一个日记分享平台，我们致力于让用户发表自己的心情，聆听你我的声音
- 学校课程任务，开发文档，这里就记录一下吧


## 技术栈
- 前端 html5 + css3 + jQuery + javaScript
- 后台 java --jdk1.7
- 框架 spring + springmvc
- 数据库 mongodb

## 开发工具
- sublime
- MyEclipse

## 目录结构
* src	源代码目录，未编译
  * com.krry	包目录
    * controller	控制层，请求转发
    * core	核心包，包含登录拦截器、模拟的核心类和接口类
    * dao	持久层，负责与数据库进行联络的一些任务的封装
      * impl	映射，dao接口的实现类
    * entity	实体类，每个对象作为一个实体类
    * util		工具包，包含所用到的一些工具类
  * config	配置文件都放在这里
* WebRoot	存放jsp、图片等资源文件，还有src编译.java后的class文件
  * resource	存放静态资源文件
    * js	存放js文件
    * css	存放css文件
    * images	存放图片文件
    * font	存放字体文件
  * WEB-INF	在web中最安全的目录，无法直接访问，只能在xml中配置访问
    * lib	项目所需要的jar包
    * pages	web页面，jsp文件
       * admin	个人中心页面
       * blog	首页、博客详细页面
       * common	公用、通用页面
       * login	登录页面
    * web.xml	初始化配置信息
  * README.MD	项目readme

## 开发流程
- 1.确定项目主题，博客论坛系统
- 2.设计页面 - 注册登录、首页、博客详细页、个人中心、发表页、修改页、错误页
- 3.确定开发框架 spring + springmvc，数据库使用MongoDB
- 4.搭建后台框架，使用java web三层架构
- 5.配置applicationContext.xml、mongodb.properties、springmvc.xml、web.xml文件
- 6.确定项目入口地址以及欢迎页：<welcome-file>login/index</welcome-file>
- 7.测试连接MongoDB，测试数据
- 8.实体类编写（Blog.java、User.java、PageTag.java）
- 9.注册登录、博客首页、个人中心页面的编写，公有页面编写common，确定项目地址basePath
- 10.注册登录的验证、提交（防止请求重复提交）
- 11.登录注册页面逻辑代码编写，控制层（Login.java）
- 12.dao层IUserDao接口及其实现类UserDaoImpl，使用MongoTemplate模板进行数据操作
- 13.登录拦截器LoginInterceptor.java
- 14.springmvc中的mvc:interceptor拦截器的编写
- 15.控制博客首页拦截、个人中心登录后才可以进入，设置拦截器进入的类LoginInterceptor，以及对静态资源resource放行
- 16.添加博客，插入数据逻辑代码编写，使用MongoTemplate模板进行数据操作
- 17.博客首页、详细页逻辑代码编写，控制层（Blogs.java）
- 18.使用EL表达式，在前台页面读取，jstl循环标签读取作用域中的数据
- 19.基于promise的ajax异步刷新、分页查询数据并显示，使用MongoTemplate模板进行数据操作
- 20.dao层IBlogDao接口及其实现类BlogDaoImpl，使用MongoTemplate模板进行数据操作
- 21.修改个人信息逻辑代码编写，控制层（Admin.java）
- 22.打一个war包，上线服务器：https://www.ainyi.com
- 23.项目地址：https://www.ainyi.com/krry_simblog

## 谈谈java中MongoDB的分页查询
- 两个关键方法skip(num)和limit(num)方法
- skip：控制跳过多少条数据
- limit：控制查询多少条数据
```java
/**
 * 查询所有博客 分页查询
 */
public List<Blog> findAll(PageTag page) {
	Query query = new Query();
	//降序排列查询
	query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "createTime")));
	//需要跳过的数目 = 上一页数*每页显示的数目
    int skip = (page.getCurrentPage()-1) * page.getPageSize();
    query.skip(skip);// 从那条记录开始
    //查询限制在5条
    query.limit(page.getPageSize());// 取多少条记录
    return mongoTemplate.find(query, Blog.class);
}
```

## MongoDB的数据查询
- MongoDB默认是把最新数据插入到最后面，所以全部查询的时候，需要把最新数据放在前面，这就需要查询条件是按照创建时间的降序排列查询
```java
Query query = new Query();
query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "createTime")));
mongoTemplate.find(query, Blog.class);
```


## 温馨提醒
- 学校的课程小项目，拿来练练MongoDB，也在不断学习中
- 项目是spring + springmvc + MongoDB架构的，欢迎参考本项目
- 本论坛也有bug，需求是不断满足的，虚心请教...

## 项目截图
![](https://github.com/Krryxa/krry_simblog/blob/master/WebRoot/resource/images/cutImg/1.jpg)
![](https://github.com/Krryxa/krry_simblog/blob/master/WebRoot/resource/images/cutImg/2.jpg)


## 相关链接
- 项目开源，github地址：https://github.com/Krryxa/krry_shop
- 项目地址：https://www.ainyi.com/krry_simblog
- 乐诗博客：https://www.ainyi.com



