package com.tutoring.dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tutoring.entity.User;

public class FriendDAOImpl extends HibernateDaoSupport implements FriendDAO{

	@Override
	public void addFriend(User user, User other) {
		// TODO Auto-generated method stub
		user.getFriendsIHave().add(other);
		user.getFriendsHaveMe().add(other);
		other.getFriendsIHave().add(user);
		other.getFriendsHaveMe().add(user);
		this.getHibernateTemplate().merge(user);
		this.getHibernateTemplate().merge(other);
	}

}
