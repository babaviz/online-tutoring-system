package com.tutoring.action;


import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.biz.UserBiz;
import com.tutoring.entity.User;

public class IndexAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Timestamp time;
	
	UserBiz userBiz;
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}
	
	public String execute() throws Exception{
		//List<?> myCourses = courseBiz.getMyCourses();
		//ActionContext ac = ActionContext.getContext();
		//ac.put("mycourses", myCourses);
		
		time = new Timestamp((new Date()).getTime());
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		User user = (User)session.get("user");
		if(user.getType()=='1')
			return "student";
		else if(user.getType()=='2')
			return "tutor";
		else
			return ERROR;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}
}
