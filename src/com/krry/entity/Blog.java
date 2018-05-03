package com.krry.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

/**
 * 博客类
 * @author asusaad
 *
 */
@Document(collection = "blog")
public class Blog {

	@Id
	private String id;
	@Field("user_id")
	private String userId;
	private String username;
	private String title;
	private String content;
	private String createTime;
	
	public Blog() {

	}

	public Blog(String userId, String username, String title, String content, String createTime) {
		this.userId = userId;
		this.username = username;
		this.title = title;
		this.content = content;
		this.createTime = createTime;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	

}



