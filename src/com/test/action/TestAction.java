package com.test.action;

import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.biz.SessionMaintainBiz;

public class TestAction extends ActionSupport {
	public SessionMaintainBiz sessionMaintainBiz;
	public void setSessionMaintainBiz(SessionMaintainBiz sessionMaintainBiz) {
		this.sessionMaintainBiz = sessionMaintainBiz;
	}
	public String execute() throws Exception
	{
		sessionMaintainBiz.updateCourse();
		return SUCCESS;
	}
}
