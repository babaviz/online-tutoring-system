package com.tutoring.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.biz.TopicBiz;

public class MyTopicsAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	TopicBiz topicBiz;
	public void setTopicBiz(TopicBiz topicBiz) {
		this.topicBiz = topicBiz;
	}
	public String execute() throws Exception{
		ActionContext ac = ActionContext.getContext();
		List<?> qlist = topicBiz.getMyQuestions();
		ac.put("questions", qlist);
		return SUCCESS;
	}
}
