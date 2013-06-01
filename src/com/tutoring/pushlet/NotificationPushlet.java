package com.tutoring.pushlet;

import java.io.Serializable;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tutoring.dao.NotificationDAO;

import nl.justobjects.pushlet.core.Event;
import nl.justobjects.pushlet.core.EventPullSource;

public class NotificationPushlet extends EventPullSource implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ApplicationContext context =new ClassPathXmlApplicationContext("applicationContext.xml");
	@Override
	protected long getSleepTime() {
		// TODO Auto-generated method stub
		return 5000;
	}

	@Override
	protected Event pullEvent() {
		// TODO Auto-generated method stub
		Event event = Event.createDataEvent("/tutoring/numberofnotice");
		
		
		NotificationDAO notificationDAO = (NotificationDAO) context.getBean("NotificationDAO");
		
		int number = notificationDAO.getNumberOfNotice();
		event.setField("numberofnotice", number);
		//event.setField("notice", "hello");
		return event;
	}

}
