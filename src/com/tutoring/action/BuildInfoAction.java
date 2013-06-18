package com.tutoring.action;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.biz.UserBiz;
import com.tutoring.entity.User;

public class BuildInfoAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	UserBiz userBiz;
	/*private User user;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}*/
	
	private Timestamp time;
	
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}
	public String execute() throws Exception{
		time = new Timestamp((new Date()).getTime());
		ActionContext ac = ActionContext.getContext();
		Map<String , Object> session = ac.getSession();
		//String email = (String) session.get("email");
		//user = userBiz.getUserInfo(email);
		//System.out.println(user.getFirstName());
		User user = (User) session.get("user");
		if(user.getType()=='1')
			return "student";
		else if(user.getType()=='2')
			return "tutor";
		else
			return null;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}

}
