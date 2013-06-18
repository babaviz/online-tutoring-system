package com.tutoring.pushlet;

import java.io.Serializable;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tutoring.dao.NotificationDAO;
import com.tutoring.entity.User;

import nl.justobjects.pushlet.core.Event;
import nl.justobjects.pushlet.core.EventPullSource;
import nl.justobjects.pushlet.core.Session;
import nl.justobjects.pushlet.core.SessionManager;

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
		int userid = 0;
		Session[] sessions = SessionManager.getInstance().getSessions();
		NotificationDAO notificationDAO = (NotificationDAO) context.getBean("NotificationDAO");
		if(sessions.length>0){
			//StringBuilder str = new StringBuilder("");
			for(int i = 0;i<sessions.length;i++)
			{
				//System.out.println(i+":"+sessions[i].getId());
				
			
			userid = Integer.parseInt(sessions[i].getId());
			event.setField("numberofnotice"+userid, notificationDAO.getNumberOfNotice(userid));
			event.setField("numberofcoursenotice"+userid, notificationDAO.getNumberOfCourseNotice(userid));
			event.setField("numberoffriendnotice"+userid, notificationDAO.getNumberOfFriendNotice(userid));
			event.setField("numberofchatnotice"+userid, notificationDAO.getNumberOfChatNotice(userid));
			}
		}
		//System.out.println("lastid:"+userid);
		
		
		
//		if(SessionManager.getInstance().hasSession("0"))
//		{
//			System.out.println("yes");
//		}
//		else
//		{
//			System.out.println("no");
//		}
		
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
		
		return event;
	}

}
