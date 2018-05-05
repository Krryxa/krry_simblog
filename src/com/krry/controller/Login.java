package com.krry.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.krry.dao.IUserDao;
import com.krry.entity.User;
import com.krry.util.TmStringUtils;

/**
 * Controller层，作为请求转发
 * 页面所有路径的访问方法:控制层的命名空间+@RequestMapping的value
 * */
@Controller
@RequestMapping("/login")
public class Login {

	@Autowired
	private IUserDao userDao;
	
	/**
	 * 进入登录界面
	 * @return
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("user");
		//如果已经登录，直接跳转到博客首页，这里使用重定向，到博客首页的方法，查询数据后跳转
		if(user!=null) return "redirect:/blog/index";
		//否则跳转到登录页面
		return "login/login";   //默认是转发，不会显示转发路径
	}
	
	
	
	/**
	 * 点击登录
	 * com.krry.controller.login 
	 * 方法名：login
	 * @author krry 
	 * @param request
	 * @return String
	 * @exception 
	 * @since  1.0.0
	 */
	@RequestMapping(method=RequestMethod.POST,value="/logined")
	public String login(HttpServletRequest request){
		//获取用户和密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		//如果邮箱和密码为null,那么就返回已null标识
		if(TmStringUtils.isEmpty(username)) return "login/allError";
		if(TmStringUtils.isEmpty(password)) return "login/allError";
		
		//根据邮箱或昵称查询，用户是否存在
		User user = userDao.findByUsername(username);
		
		//如果存在
		if(user!=null){
			
			if(password.equals(user.getPassword())){
				//如果密码正确
				//将用户信息放入到会话中...
				request.getSession().setAttribute("user", user);
				
				//这里使用重定向 ,重定向到命名空间是blog下@RequestMapping是index的方法
				return "redirect:../blog/index";
			}else{
				//如果密码错误
				request.setAttribute("msg", "密码错误");
				return "login/allError";
			}
		}else{
			//如果不存在，代码邮箱和密码输入有误
			request.setAttribute("msg", "用户不存在");
			return "login/allError";
		}
	}
	
	/**
	 * 退出登录控制层
	 * com.krry.controller.login 
	 * 方法名：logout
	 * @author krry 
	 * @param request
	 * @return String
	 * @exception 
	 * @since  1.0.0
	 */
	@RequestMapping(method=RequestMethod.GET,value="/logout")
	public String logout(HttpServletRequest request){
		request.getSession().invalidate(); //清空session值
		return "login/login";
	}
	
	/**
	 * 打开注册界面层
	 * @return
	 */
	@RequestMapping("/rege")
	public String rege(HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("user");
		//如果已经登录，直接跳转到博客首页
		if(user!=null) return "blog/index";
		//否则跳转到登录页面
		return "login/resgi";
	}
	
	/**
	 * 注册控制层
	 * com.krry.controller.login 
	 * 方法名：resig
	 * @author krry 
	 * @param request
	 * @return String
	 * @exception 
	 * @since  1.0.0
	 */
	@RequestMapping(method=RequestMethod.POST,value="/resig")
	public String resig(HttpServletRequest request){
		//获取用户和密码和联系方式
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");

		//如果邮箱和密码为null,那么就返回已null标识
		if(TmStringUtils.isEmpty(username) )return "login/allError";
		if(TmStringUtils.isEmail(password))return "login/allError";
		if(TmStringUtils.isEmail(phone))return "login/allError";
		
		//根据昵称查询，用户是否存在
		User user = userDao.findByUsername(username);
		
		//若用户名已存在
		if(user != null){ //昵称重复
			request.setAttribute("msg", "用户名已被注册");
			return "login/allError";
		}

		//格式化时间类型
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowTime = sdf.format(new Date());
		
		//执行到这里，说明可以注册
		User newUser = new User(username, password, phone, nowTime);
		//调用注册方法
		userDao.saveOrUpdateUser(newUser);
		
		//获取刚注册的用户(里面包括用户Id)
		User Bloguser = userDao.findByUsername(username);
	
		//将信息设置session作用域
		request.getSession().setAttribute("user", Bloguser);

		return "redirect:../blog/index";
	}
	
	
}



