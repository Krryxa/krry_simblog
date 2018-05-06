package com.krry.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.krry.dao.IBlogDao;
import com.krry.entity.Blog;
import com.krry.entity.PageTag;

/**
 * 博客实现类
 * @author asusaad
 *
 */
@Repository
public class BlogDaoImpl implements IBlogDao{

	@Autowired
    private MongoTemplate mongoTemplate;
	
	public void addBlog(Blog blog) {
		//1.如果没有指定集合，则默认添加到和对象名称相同的集合中，没有则创建一个
        //2.也可以指定集合 mongoTemplate.save(User, "User_db");
        mongoTemplate.save(blog);
	}
	
	/**
     * 若是修改，则传入当前id，调用save方法，就会自动修改，而不是新增，
     * 就是要传入全部字段，否则只保存当前传入的字段，没有设置的字段将会删除
     * 如果没有id，就是新增数据
     */
	public void saveOrUpdateBlog(Blog blog) {
		mongoTemplate.save(blog);
	}
	
	/**
     * 根据Id修改数据，没有传入的字段不会删除，只修改传入的字段
     */
    public void updateBlogById(Blog blog){
    	//创建查询
    	Query query = new Query(Criteria.where("id").is(blog.getId()));
    	Update update = new Update();
    	if(blog.getUserId() != null) update.set("user_id", blog.getUserId());
    	if(blog.getUsername() != null) update.set("username", blog.getUsername());
    	if(blog.getUsername() != null) update.set("title", blog.getTitle());
    	if(blog.getContent() != null) update.set("content", blog.getContent());
    	
    	mongoTemplate.updateFirst(query, update, Blog.class);
    }

	public void removeBlog(String id) {
		Blog blog = findById(id);
        mongoTemplate.remove(blog);
	}

	public Blog findById(String id) {
		return mongoTemplate.findById(id, Blog.class);
	}
	
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
	
	/**
	 * 查询博客总数
	 */
	public long count(){
		Query query = new Query();
		return mongoTemplate.count(query, Blog.class);
	}
	

}
