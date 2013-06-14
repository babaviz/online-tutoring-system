package com.tutoring.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.biz.MessageBiz;
import com.tutoring.entity.User;

public class ChattingAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	MessageBiz messageBiz;
	
	public void setMessageBiz(MessageBiz messageBiz) {
		this.messageBiz = messageBiz;
	}

	public String execute() throws Exception{
		ActionContext ac = ActionContext.getContext();
		Map<String, Object>session = ac.getSession();
		User user = (User) session.get("user");
		ac.put("msglist", messageBiz.getOrderedMessages(user));
		return SUCCESS;
	}
}
