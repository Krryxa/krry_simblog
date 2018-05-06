package com.krry.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.krry.dao.IUserDao;
import com.krry.entity.User;

import java.util.List;

/**
 * @author
 */
@Repository
public class UserDaoImpl implements IUserDao {

    @Autowired
    private MongoTemplate mongoTemplate;

    public void addUser(User user) {
        //1.如果没有指定集合，则默认添加到和对象名称相同的集合中，没有则创建一个
        //2.也可以指定集合 mongoTemplate.save(user, "user_db");
        mongoTemplate.save(user);
    }

    public void removeUser(String id) {
    	
        User user = findById(id);
        mongoTemplate.remove(user);
    }

    /**
     * 若是修改，则传入当前id，调用save方法，就会自动修改，而不是新增，
     * 就是要传入全部字段，否则只保存当前传入的字段，没有设置的字段将会删除
     * 如果没有id，就是新增数据
     */
    public void saveOrUpdateUser(User user) {
    	
        mongoTemplate.save(user);
    }
    
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
    

    public User findById(String id) {
    	
        return mongoTemplate.findById(id, User.class);
    }

    public List<User> findAll() {
    	
        return mongoTemplate.findAll(User.class);
    }

	public User findByUsername(String username) {
		//根据username查询
		Query sql = new Query(Criteria.where("username").is(username));
		
		return mongoTemplate.findOne(sql,User.class);
	}
	
	public User findByPhone(String phone) {
		//根据phone查询
		Query sql = new Query(Criteria.where("phone").is(phone));
		
		return mongoTemplate.findOne(sql,User.class);
	}
}




