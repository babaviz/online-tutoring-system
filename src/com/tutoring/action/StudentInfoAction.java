package com.tutoring.action;

import java.sql.Timestamp;
import java.util.Date;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.biz.UserBiz;
import com.tutoring.entity.User;

public class StudentInfoAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int userid;
	private Timestamp time;
	
	UserBiz userBiz;
	
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public String execute() throws Exception{
		setTime(new Timestamp((new Date()).getTime()));
		User user = userBiz.getUserInfoById(userid);
		ActionContext ac = ActionContext.getContext();
		ac.getValueStack().push(user);
		return SUCCESS;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}
	
}
