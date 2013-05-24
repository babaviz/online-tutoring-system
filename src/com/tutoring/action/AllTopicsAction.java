package com.tutoring.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.biz.TopicBiz;

public class AllTopicsAction extends ActionSupport{

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
		Map<String, Object> session = ac.getSession();
		
		String useremail = (String) session.get("email");
		List<?> qlist = topicBiz.getQuestions(useremail);
		
		
		//System.out.println(qlist.size());
		
		ac.put("questions", qlist);
		//topicBiz.makeComment("panyan@gmail.com", "hello", 2);
		return SUCCESS;
	}

}
