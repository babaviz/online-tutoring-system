package com.tutoring.action;


import java.sql.Timestamp;
import java.util.Date;

import com.opensymphony.xwork2.ActionSupport;

public class IndexAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Timestamp time;
	
	public String execute() throws Exception{
		//List<?> myCourses = courseBiz.getMyCourses();
		//ActionContext ac = ActionContext.getContext();
		//ac.put("mycourses", myCourses);
		
		time = new Timestamp((new Date()).getTime());
		
		return SUCCESS;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}
}
