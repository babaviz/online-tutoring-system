package com.tutoring.dao;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tutoring.entity.Message;
import com.tutoring.entity.User;

public class MessageDAOImpl extends HibernateDaoSupport implements MessageDAO{

	@Override
	public void addMessage(User user, User other, String content) {
		// TODO Auto-generated method stub
		Message message = new Message();
		message.setSender(user);
		message.setReceiver(other);
		message.setContent(content);
		message.setTime(new Timestamp((new Date()).getTime()));
		user.getSends().add(message);
		this.getHibernateTemplate().merge(user);
		//this.getHibernateTemplate().merge(other);
	}
	
}
