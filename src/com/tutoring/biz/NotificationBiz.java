package com.tutoring.biz;

public interface NotificationBiz {
	public void acceptApplication(int courseid,int studentid, int noticeid);
	public void refuseApplication(int courseid,int studentid, int noticeid);
}
