package com.tutoring.dao;

import java.util.List;

import com.tutoring.entity.Notification;
import com.tutoring.entity.User;

public interface NotificationDAO {
	public void addNotice(int noticeid, int type, User user,User fromuser);
	public int getNumberOfNotice(int userid);
	public int getNumberOfCourseNotice(int userid);
	public int getNumberOfFriendNotice(int userid);
	public int getNumberOfChatNotice(int userid);
	public void setNoticeStatus(Notification n, int status);
	public Notification getNotificationById(int id);
	public List<Notification> getNotificationListByQuery(String condition);
	public void save(Notification n);
}
