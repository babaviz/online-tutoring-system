package com.tutoring.action;

import java.sql.Timestamp;
import java.util.Date;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.biz.UserBiz;
import com.tutoring.entity.User;

public class UserInfoAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	UserBiz userBiz;
	private int userid;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public UserBiz getUserBiz() {
		return userBiz;
	}
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}
	public String execute() throws Exception{
		ActionContext ac = ActionContext.getContext();
		User user = userBiz.getUserInfoById(userid);
		if(user.getType()=='1')
			return "student";
		else if(user.getType()=='2')
			return "tutor";
		else
			return null;
	}
}
