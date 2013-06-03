package com.tutoring.action;

import java.sql.Timestamp;
import java.util.Date;



import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.biz.UserBiz;
import com.tutoring.entity.User;

public class TutorInfoAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	UserBiz userBiz;
	
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}



	private int userid;
	private Timestamp time;
	

	public Timestamp getTime() {
		return time;
	}



	public void setTime(Timestamp time) {
		this.time = time;
	}



	public int getUserid() {
		return userid;
	}



	public void setUserid(int userid) {
		this.userid = userid;
	}



	public String execute() throws Exception{
		time = new Timestamp((new Date()).getTime());
		ActionContext ac = ActionContext.getContext();
		User user = userBiz.getUserInfoById(userid);

		ac.getValueStack().push(user);
		return SUCCESS;
	}

}
