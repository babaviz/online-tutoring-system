package com.tutoring.action;

import nl.justobjects.pushlet.core.Dispatcher;
import nl.justobjects.pushlet.core.Event;

import com.tutoring.biz.NotificationBiz;
import com.tutoring.biz.SessionMaintainBiz;

public class HandleApplicationAction {
	SessionMaintainBiz sessionMaintainBiz;
	NotificationBiz notificationBiz; 
	
	public void setNotificationBiz(NotificationBiz notificationBiz) {
		this.notificationBiz = notificationBiz;
	}

	public void setSessionMaintainBiz(
			SessionMaintainBiz sessionMaintainBiz) {
		this.sessionMaintainBiz = sessionMaintainBiz;
	}
	
	public String acceptApplication(int studentid,int courseid,int notificationid){
		//System.out.println(studentid+";"+courseid+";"+notificationid);
		notificationBiz.acceptApplication(courseid, studentid, notificationid);
		sessionMaintainBiz.updateUser();
		Event event = Event.createDataEvent("/tutoring/numberofnotice");
		event.setField("application"+studentid, courseid);
		Dispatcher.getInstance().unicast(event, studentid+"");
		return "ok";
	}
	public String refuseApplication(int studentid,int courseid,int notificationid){
		notificationBiz.refuseApplication(courseid, studentid, notificationid);
		sessionMaintainBiz.updateUser();
		return "ok";
	}
	
	public String updateUser()
	{
		sessionMaintainBiz.updateUser();
		sessionMaintainBiz.updateCourse();
		return "ok";
	}
}
