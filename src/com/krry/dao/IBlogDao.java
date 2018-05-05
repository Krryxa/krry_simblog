package com.krry.dao;

import java.util.List;

import com.krry.entity.Blog;
import com.krry.entity.PageTag;

/**
 * 博客接口类
 * @author asusaad
 *
 */
public interface IBlogDao {
	
	/**
	 * 添加博客
	 * @param blog
	 */
	public void addBlog(Blog blog);
	
	/**
     * 保存或修改
     * @param blog
     */
    public void saveOrUpdateBlog(Blog blog);
    
    /**
     * 根据Id修改数据
     * @param blog
     */
    public void updateBlogById(Blog blog);
    
    
    /**
     * 删除
     * @param id
     */
    public void removeBlog(String id);


    /**
     * 根据id查询单个
     * @param id
     * @return
     */
    public Blog findById(String id);


    /**
     * 查询所有
     * @return
     */
    public List<Blog> findAll(PageTag page);
    
    /**
     * 查询总数
     * @return
     */
    public long count();

}



