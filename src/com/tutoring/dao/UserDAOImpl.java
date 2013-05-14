package com.tutoring.dao;

import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.tutoring.entity.User;
import org.hibernate.SessionFactory;
public class UserDAOImpl extends HibernateDaoSupport implements UserDAO{

	@Override
	public String getPasswordByUsername(String username) {
		// TODO Auto-generated method stub
		List<User> userList = this.getHibernateTemplate().find("from User where username='"+username+"'");
		User user = userList.get(0);
		return user.getPassword();
	}

}
