package com.tutoring.action;

import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.biz.UserBiz;

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
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}
	public String execute() throws Exception{
		//ActionContext ac = ActionContext.getContext();
		//Map<String , Object> session = ac.getSession();
		//String email = (String) session.get("email");
		//user = userBiz.getUserInfo(email);
		//System.out.println(user.getFirstName());
		return SUCCESS;
	}

}
