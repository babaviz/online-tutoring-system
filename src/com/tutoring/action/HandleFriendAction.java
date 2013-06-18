package com.tutoring.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.tutoring.biz.FriendBiz;
import com.tutoring.biz.NotificationBiz;
import com.tutoring.biz.SessionMaintainBiz;
import com.tutoring.entity.User;

public class HandleFriendAction {
	
	FriendBiz friendBiz;
	NotificationBiz notificationBiz;
	SessionMaintainBiz sessionMaintainBiz;
	
	public void setSessionMaintainBiz(SessionMaintainBiz sessionMaintainBiz) {
		this.sessionMaintainBiz = sessionMaintainBiz;
	}
	public void setNotificationBiz(NotificationBiz notificationBiz) {
		this.notificationBiz = notificationBiz;
	}
	public void setFriendBiz(FriendBiz friendBiz) {
		this.friendBiz = friendBiz;
	}
	public String acceptFriend(int requestuserid,int noticeid){
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		User user = (User) session.get("user");
		friendBiz.addFriend(user.getId(), requestuserid);
		notificationBiz.handleNotification(noticeid);
		sessionMaintainBiz.updateUser();
		return "ok";
	}
	public String refuseFriend(int requestuserid){
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		User user = (User) session.get("user");
		notificationBiz.refuseFriend(user, requestuserid);
		return "ok";
	}
	
	public String applyForFriend(int id){
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		User user = (User) session.get("user");
		
		notificationBiz.applyForFriend(user.getId(),id);
		return "ok";
	}
}
