package com.tutoring.dao;

import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.tutoring.entity.User;
public class UserDAOImpl extends HibernateDaoSupport implements UserDAO{

	@Override
	public String getPasswordByUsername(String username) {
		// TODO Auto-generated method stub
		List<User> userList = this.getHibernateTemplate().find("from User where username='"+username+"'");
		User user = userList.get(0);
		return user.getPassword();
	}

	public void addUser(String username, String password)
	{
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		
		this.getHibernateTemplate().save(user);
	}

	@Override
	public List<?> getUserByUsername(String username) {
		// TODO Auto-generated method stub
		List<User> list = this.getHibernateTemplate().find("from User where username = '"+username+"'");
		return list;
	}
	
}
