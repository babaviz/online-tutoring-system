package com.tutoring.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.biz.CourseBiz;
import com.tutoring.biz.UserBiz;
import com.tutoring.entity.User;

public class LoginAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String username;
	private String password;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	UserBiz userBiz;
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}
	
	CourseBiz courseBiz;
	public void setCourseBiz(CourseBiz courseBiz) {
		this.courseBiz = courseBiz;
	}
	
	public String execute() throws Exception{
		if(userBiz.login(username, password)){
			ActionContext ac = ActionContext.getContext();
			Map<String, Object> session = ac.getSession();
			User user = userBiz.getUserInfo(username);
			session.put("user", user);
			
			//System.out.println(session.get("username"));
			if(userBiz.isStudent(username))
			{
				List<?> myCourses = courseBiz.getMyCourses();
				session.put("mycourses", myCourses);
				
				List<?> mytutors = courseBiz.getMyTutors();
				session.put("mytutors", mytutors);
				//System.out.println(mytutors.size());
			}
			else if(userBiz.isTutor(username))
			{
				List<?> myCourses = courseBiz.getTutorCourses();
				session.put("mycourses", myCourses);
			}
				
			
			return SUCCESS;
		}
		else
			return LOGIN;
	}
	public String CanLoginDirectly()
	{
		if(userBiz.CanLoginBySession())
			return "ok";
		return "no";
	}
	
	
}
