package com.tutoring.action;

import java.util.Date;

import com.tutoring.biz.UserBiz;

public class ChangeInfoAction {
	UserBiz userBiz;
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}
	public void changeBasicInfo(String FirstName, String LastName, char Sex, String phone, Date birth, String school){
		userBiz.changeUserInfo(FirstName, LastName, Sex, phone, birth, school);
	}
}
