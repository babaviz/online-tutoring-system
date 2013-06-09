package com.tutoring.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.biz.CourseBiz;
import com.tutoring.entity.User;

public class OpenCourseAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String coursename;
	private String startTime;
	private String endTime;
	private int price;
	private String description;
	private String type;
	
	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}
	
	
	CourseBiz courseBiz;

	public void setCourseBiz(CourseBiz courseBiz) {
		this.courseBiz = courseBiz;
	}


	public String execute() throws Exception{
		
		
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		User user = (User)session.get("user");
		
		courseBiz.openCourse(user, startTime, endTime, price, coursename, description,type);
		
		return SUCCESS;
	}
	
	
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}
}
