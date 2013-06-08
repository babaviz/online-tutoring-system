package com.tutoring.dao;

import com.tutoring.entity.User;

public interface NotificationDAO {
	public void addNotice(int noticeid, int type, User user);
	public int getNumberOfNotice(User user);
}
