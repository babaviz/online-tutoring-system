package com.tutoring.biz;

import com.tutoring.entity.User;

public interface NotificationBiz {
	public void acceptApplication(int courseid,int studentid, int noticeid);
	public void refuseApplication(int courseid,int studentid, int noticeid);
	public void handleNotification(int id);
	public void applyForFriend(int a_id,int b_id);
	public void refuseFriend(User u , int id);
}
