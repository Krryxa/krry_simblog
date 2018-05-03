
# krry论坛博客系统
> krry博客是一个日记分享平台，我们致力于让用户发表自己的心情，聆听你我的声音
- 学校课程任务，开发文档，这里就记录一下吧


## 技术栈
- 前端 div + css + js + jquery
- 后台 spring + springmvc + mongodb数据库

## 开发工具
- sublime
- MyEclipse jdk1.7

## 目录结构
src	源代码目录，未编译
  com.krry	包目录
    controller	控制层，请求转发
    core	核心包，包含登录拦截器、模拟的核心类和接口类
    dao	持久层，负责与数据库进行联络的一些任务的封装
      impl	映射，dao接口的实现类
    entity	实体类，每个对象作为一个实体类
    util		工具包，包含所用到的一些工具类
  config	配置文件都放在这里<br>
WebRoot	存放jsp、图片等资源文件，还有src编译.java后的class文件
  resource	存放静态资源文件
    js	存放js文件
     images	存放图片文件
  WEB-INF	在web中最安全的目录，无法直接访问，只能在xml中配置访问
    lib	项目所需要的jar包
    pages	web页面，jsp文件
       admin	个人中心页面
       blog	首页、博客详细页面
       common	公用、通用页面
       login	登录页面
    web.xml	初始化配置信息
  README.MD	项目readme

## 开发流程
- 确定项目主题，博客论坛系统
- 设计页面 - 注册登录、首页、博客详细页、个人中心、发表页、修改页
- 确定开发框架 spring + springmvc，数据库使用MongoDB
- 搭建后台框架，使用java web三层架构
- 配置applicationContext.xml、mongodb.properties、springmvc.xml、web.xml
- 确定项目入口地址以及欢迎页：<welcome-file>login/index</welcome-file>
- 测试连接MongoDB，测试数据
- 实体类编写（Blog.java、User.java）
- 注册登录、博客首页、个人中心页面的编写，公有页面编写common，确定项目地址basePath
- 注册登录的验证
- 登录注册页面逻辑代码编写，控制层（Login.java）
- dao层IUserDao接口及其实现类UserDaoImpl，使用MongoTemplate模板进行数据操作
- 登录拦截器LoginInterceptor.java
- springmvc中的mvc:interceptor拦截器的编写
- 控制博客首页拦截、个人中心登录后才可以进入，设置拦截器进入的类LoginInterceptor，以及对静态资源resource放行
- 博客首页、详细页逻辑代码编写，控制层（Blogs.java）
- 基于promise的ajax异步刷新、分页查询数据并显示
- dao层IBlogDao接口及其实现类BlogDaoImpl，使用MongoTemplate模板进行数据操作
- 使用EL表达式，在前台页面读取，jstl循环标签读取作用域中的数据
- 修改个人信息逻辑代码编写，控制层（Admin.java）
- 添加博客，插入数据逻辑代码编写，使用MongoTemplate模板进行数据操作
- 打一个war包，上线服务器：https://www.ainyi.com
- 项目地址：https://www.ainyi.com/krry_simblog

## 温馨提醒
- 学校的课程小项目，拿来练练MongoDB的手
- 项目开源，github地址：https://github.com/Krryxa
- 项目地址：https://www.ainyi.com/krry_simblog
- 本论坛也有bug，需求是不断满足的，虚心请教...

## 项目截图
![]()




