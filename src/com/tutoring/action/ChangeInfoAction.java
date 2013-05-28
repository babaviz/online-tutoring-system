package com.tutoring.action;

import java.util.Date;

import com.tutoring.biz.UserBiz;

public class ChangeInfoAction {
	UserBiz userBiz;
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}
	@SuppressWarnings("deprecation")
	public void changeBasicInfo(String FirstName, String LastName, String phone, String birthstr, String school){
		Date birth = new Date();
		String[] dates = birthstr.split("-");
		birth.setYear(Integer.parseInt(dates[0]));
		birth.setMonth(Integer.parseInt(dates[1]));
		birth.setDate(Integer.parseInt(dates[2]));
		userBiz.changeUserInfo(FirstName, LastName, phone, birth, school);
	}
}
