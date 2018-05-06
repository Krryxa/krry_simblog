package com.krry.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.krry.dao.IUserDao;
import com.krry.entity.User;
import com.krry.util.TmStringUtils;

/**
 * 个人中心
 * @author asusaad
 *
 */
@Controller
@RequestMapping("/admin")
public class Admin {

	@Autowired
	private IUserDao userDao;
	
	/**
	 * 进入修改个人信息页面
	 * @return
	 */
	@RequestMapping("/index")
	public String modify(){
	
		return "admin/modify";
	}
	
	/**
	 * 确认修改，保存到数据库
	 * @param request
	 * @return
	 */
	@RequestMapping(method=RequestMethod.POST,value="/modify")
	public String confirm(HttpServletRequest request){
		
		//获取当前登录id
		User curuser = (User) request.getSession().getAttribute("user");
		String id = curuser.getId();
		//原密码
		String orpass = curuser.getPassword();
		
		//获取用户和密码和联系方式
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		//获取原密码
		String orpassword = request.getParameter("orpassword");
		
		//如果邮箱和密码为null,那么就返回已null标识
		if(TmStringUtils.isEmpty(username) )return "login/allError";
		if(TmStringUtils.isEmail(password))return "login/allError";
		if(TmStringUtils.isEmail(phone))return "login/allError";
		
		//根据昵称查询，用户是否存在
		User user = userDao.findByUsername(username);
		
		//若用户名已存在 并且不是自己原本的用户名
		if(user != null && !username.equals(curuser.getUsername())){
			//用户名重复
			request.setAttribute("msg", "用户名已存在");
			return "login/allError";
		}
		
		//根据手机号码查询，用户是否已存在
		user = userDao.findByPhone(phone);
		if(user != null && !phone.equals(curuser.getPhone())){
			//用户名重复
			request.setAttribute("msg", "手机号已被注册");
			return "login/allError";
		}
		
		//查询原密码是否正确
		if(!orpass.equals(orpassword)){
			request.setAttribute("msg", "原密码不正确");
			return "login/allError";
		}
		
		//执行到这里，说明可以修改
		User modeUser = new User();
		modeUser.setUsername(username);
		modeUser.setPassword(password);
		modeUser.setPhone(phone);

		//传入id，就会根据这个id修改
		modeUser.setId(id);
		
		//调用更据id修改数据的方法
		userDao.updateUserById(modeUser);
//		userDao.saveOrUpdateUser(modeUser); //此方法的修改会全部字段修改，除了id
		
		//获取刚修改的用户(里面包括用户Id)
		User Bloguser = userDao.findById(id);
	
		//将信息设置session作用域
		request.getSession().setAttribute("user", Bloguser);

		return "redirect:../blog/index";
	}
	
	
	
}




