package com.tutoring.action;

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
	
	UserBiz userBiz;
	
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public String execute() throws Exception{
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
	
}
