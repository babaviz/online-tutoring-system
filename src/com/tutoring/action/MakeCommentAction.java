package com.tutoring.action;


import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.tutoring.biz.TopicBiz;

public class MakeCommentAction {
	TopicBiz topicBiz;
	
	public void setTopicBiz(TopicBiz topicBiz) {
		this.topicBiz = topicBiz;
	}

	public String makeComment(String content,int topicid){
		System.out.println(topicid);
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		String useremail = (String)session.get("email");
		topicBiz.makeComment(useremail, content, topicid);
		return "ok";
	}
}
