package com.tutoring.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport {
	public String execute() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.remove("user");
		return SUCCESS;
	}
}
