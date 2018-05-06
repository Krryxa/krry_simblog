
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
  * META-INF	信息包，用来配置应用程序、扩展程序、类加载器和服务manifest.mf文件，在用jar打包时自动生成。
  * resource	存放静态资源文件
    * js	存放js文件
    * css	存放css文件
    * images	存放图片文件
       * cutImg	项目截图
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

### MongoDB集合（表）
- user：		用户集合（表）
>> id：			主键<br>
>> username：	用户名<br>
>> phone：		手机号码<br>
>> password：	密码<br>
>> createTime:	创建时间<br>
- blog：		博客集合（表）<br>
>> id：			主键<br>
>> userId：		用户作者Id<br>
>> title：		博客标题<br>
>> content：		博客内容<br>
>> createTime：	创建时间<br>

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
- 10.注册登录的验证、提交（阻止表单请求重复提交）
- 11.登录注册页面逻辑代码编写，控制层（Login.java）
- 12.dao层IUserDao接口及其实现类UserDaoImpl，使用MongoTemplate模板进行数据操作
- 13.登录拦截器LoginInterceptor.java
- 14.springmvc中的mvc:interceptor拦截器的编写
- 15.控制博客首页拦截、个人中心拦截，登录后才可以进入。
- 16.设置拦截器进入的类LoginInterceptor，以及对静态资源resource放行不拦截
- 17.添加博客，插入数据逻辑代码编写，使用MongoTemplate模板进行数据操作
- 18.博客首页、详细页逻辑代码编写，控制层（Blogs.java）
- 19.使用EL表达式，在前台页面读取，jstl循环标签读取作用域中的数据
- 20.基于promise的ajax异步刷新、分页查询数据并显示，使用MongoTemplate模板进行数据操作
- 21.dao层IBlogDao接口及其实现类BlogDaoImpl，使用MongoTemplate模板进行数据操作
- 22.修改个人信息逻辑代码编写，控制层（Admin.java）
- 23.打一个war包，上线服务器：https://www.ainyi.com
- 24.项目地址：https://www.ainyi.com/krry_simblog

## 操作提示
- 需登录后方可进入首页
- 用户名长度（0-10）
- 手机号长度（11）
- 密码长度（6-12）
- 注册（填写用户名、手机号、密码、确认密码）
- 登录（填写用户名、密码）
- 查看（显示标题、作者、发表时间、详细内容）
- 发表（填写标题、内容）
- 修改信息（填写用户名(可不修改)、手机号(可不修改)、原密码、新密码、确认新密码）
- 注册时，后台验证用户名和手机号是否已被注册，从而返回提示
- 登录时，后台验证用户名是否存在，密码是否正确，从而返回提示
- 修改时，除了自己原本的用户名和手机号之外，后台验证用户名和手机号是否已被注册，从而返回提示


## 技术难点要点

### 手机号码的表单输入
- 控制只能输入数字并且能限制长度11，number类型的表单不支持maxlength
```html
<input type="text" maxlength="11" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"/>
```

### 避免表单重复提交
- form表单设置
```javascript
var form = document.getElementById("formsw");
//设置初始值，已提交属性：false
form.submitted = false;
form.onsubmit = function(){
	$(".c_button").val("修改中...");
	//已提交属性：true，所以提交后，一直返回false，从而阻止重复提交
	if(form.submitted){
		return false;
	}
	form.submitted = true;
	return true;
};
```

### 谈谈java中MongoDB的分页查询
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

### MongoDB的数据查询
- MongoDB默认是把最新数据插入到最后面，所以全部查询的时候，需要把最新数据放在前面，这就需要查询条件是按照创建时间的降序排列查询
```java
Query query = new Query();
query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "createTime")));
mongoTemplate.find(query, Blog.class);
```

### MongoDB不进行关联查询的解决
- 查询出来的博客字段有用户作者id，还需要查询用户名，这里还要根据用户id查询用户名
- 如果写入博客时直接把作者用户名也写入，若用户表修改用户名后，博客表的用户名还是原本用户名
- 但是MongoDB不进行关联查询，就要做多一次查询了
```java
page.setCurrentPage(1);
page.setPageSize(5); //一开始查询5条

//查询博客总数
long count = blogDao.count(); 
//查询所有博客
List<Blog> blogList = blogDao.findAll(page);
int len = blogList.size();

//根据查询出来的list集合中的用户ID查询用户名（MongoDB不支持关联查询）
//使用for循环遍历查询出来的博客
//对list循环遍历的三种效率 for > Iterator > forEach，for循环最快
for(int i=0;i<len;i++) {
	//依次获取list集合的元素blog
	Blog blog = blogList.get(i);
	//获取用户id
	String userId = blog.getUserId();
	//根据用户id查询出博客的作者信息（用户信息）
	User user = userDao.findById(userId);
	//获取用户名
	String username = user.getUsername();
	//设置进blog中
	blog.setUsername(username);
	//重新设置进blogList中
	blogList.set(i, blog);
}
ModelAndView modelAndView = new ModelAndView();
//将查询出来的所有博客放到作用域中
modelAndView.addObject("blogList", blogList);
modelAndView.addObject("count", count);
modelAndView.setViewName("blog/index"); //跳到此页面，首页
```

### MongoDB的修改数据
- 两种方法：
> 调用保存方法saveOrUpdateUser，不过需要注意的是：
>> 若是修改，则必须传入当前数据id，调用saveOrUpdateUser方法，就会自动修改，而不是新增，不过需要传入全部字段，否则只保存当前传入的字段，没有设置的字段将会删除。
>> 如果没有id，就是新增数据
- 自己写通过id更新数据的方法
```java
/**
 * 根据Id修改数据
 */
public void updateUserById(User user){
	//创建查询
	Query query = new Query(Criteria.where("id").is(user.getId()));
	Update update = new Update();
	if(user.getUsername() != null) update.set("username", user.getUsername());
	if(user.getPassword() != null) update.set("password", user.getPassword());
	if(user.getPhone() != null) update.set("phone", user.getPhone());
	
	mongoTemplate.updateFirst(query, update, User.class);
}
```


## 温馨提醒
- 学校的课程小项目，拿来练练MongoDB，也在不断学习中
- 项目是spring + springmvc + MongoDB架构的，欢迎参考本项目
- 本论坛也有bug，需求是不断满足的，虚心请教...

## 项目截图
![](https://github.com/Krryxa/krry_simblog/blob/master/WebRoot/resource/images/cutImg/1.jpg)
![](https://github.com/Krryxa/krry_simblog/blob/master/WebRoot/resource/images/cutImg/2.jpg)


## 相关链接
- 项目开源，github地址：https://github.com/Krryxa/krry_simblog
- 项目地址：https://www.ainyi.com/krry_simblog
- 乐诗博客：https://www.ainyi.com



