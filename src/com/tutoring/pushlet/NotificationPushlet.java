package com.tutoring.pushlet;

import java.io.Serializable;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionContext;
import com.tutoring.biz.UserBiz;
import com.tutoring.dao.NotificationDAO;
import com.tutoring.entity.User;

import nl.justobjects.pushlet.core.Event;
import nl.justobjects.pushlet.core.EventPullSource;

public class NotificationPushlet extends EventPullSource implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ApplicationContext context =new ClassPathXmlApplicationContext("applicationContext.xml");
	User user;

	@Override
	protected long getSleepTime() {
		// TODO Auto-generated method stub
		return 5000;
	}

	@Override
	protected Event pullEvent() {
		// TODO Auto-generated method stub
		Event event = Event.createDataEvent("/tutoring/numberofnotice");
		
		
//		NotificationDAO notificationDAO = (NotificationDAO) context.getBean("NotificationDAO");
//		UserBiz userBiz = (UserBiz)context.getBean("UserBiz");
//		User user = userBiz.getMyUserInfo();
//		if(user!=null)
//		{
//		System.out.println("user is not null");
//		int number = notificationDAO.getNumberOfNotice(user);
//		System.out.println(user.getLastName());
//		event.setField("numberofnotice", number);
//		}
		event.setField("numberofnotice", 0);
		return event;
	}

}
