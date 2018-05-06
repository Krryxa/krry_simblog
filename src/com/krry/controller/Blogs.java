package com.krry.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.krry.dao.IBlogDao;
import com.krry.dao.IUserDao;
import com.krry.entity.PageTag;
import com.krry.entity.User;
import com.krry.entity.Blog;

@Controller
@RequestMapping("/blog")
public class Blogs {

	@Autowired
	private IBlogDao blogDao;
	
	@Autowired
	private IUserDao userDao;
	
	/**
	 * 进入博客首页
	 * @return
	 */
	@RequestMapping("/index")
	public ModelAndView index(PageTag page){
		
		page.setCurrentPage(1);
		page.setPageSize(5); //一开始查询5条
		
		long count = blogDao.count(); //查询博客总数
		
		
		//查询所有博客
		List<Blog> blogList = blogDao.findAll(page);
		int len = blogList.size();
		
		//根据查询出来的list集合中的用户ID查询用户名（MongoDB不支持关联查询）
		//使用for循环遍历查询出来的博客
		//对list循环遍历的三种效率 for>Iterator>forEach，for循环最快
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
		
		return modelAndView;
	}
	
	/**
	 * 分页查询
	 * @param page
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/loadData")
	public HashMap<String, Object> loadData(PageTag page){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		//查询博客
		List<Blog> blogList = blogDao.findAll(page);
		int len = blogList.size();
		
		//根据查询出来的list集合中的用户ID查询用户名（MongoDB不支持关联查询）
		//使用for循环遍历查询出来的博客
		//对list循环遍历的三种效率 for>Iterator>forEach，for循环最快
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

		map.put("blogs", blogList);
		
		return map;
	}
	
	/**
	 * 进入博客详细页面
	 * @param request
	 * @return
	 */
	@RequestMapping(method=RequestMethod.GET,value="detail")
	public String detail(HttpServletRequest request){
		//获取博客id
		String id = request.getParameter("id");
		//查询当前id的博客信息
		Blog blog = blogDao.findById(id);
		//获取用户id
		String userId = blog.getUserId();
		//根据用户id查询出博客的作者信息（用户信息）
		User user = userDao.findById(userId);
		//获取用户名
		String username = user.getUsername();
		//设置进blog中
		blog.setUsername(username);
		//放入作用域
		request.setAttribute("blog", blog);
		
		return "blog/detail";
	}
	
	/**
	 * 进入添加博客页面
	 * @return
	 */
	@RequestMapping("/addBlog")
	public String addBlog(){
		return "blog/add";
	}
	
	/**
	 * 保存并发表博客
	 * @return
	 */
	@RequestMapping(method=RequestMethod.POST,value="/saveBlog")
	public String saveBlog(HttpServletRequest request){
		
		//获取博客标题和内容
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//获取当前登录的用户
		User user = (User) request.getSession().getAttribute("user");
		//获取用户Id
		String userId = user.getId();
		
		//格式化时间类型
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowTime = sdf.format(new Date());
		
		Blog blog = new Blog(userId, title, content, nowTime);
		
		//保存博客
		blogDao.saveOrUpdateBlog(blog);
		
		// 应该使用重定向，到当前命名空间下的index，重新获取所有博客
		return "redirect:index";
	}
	
}




