package com.tutoring.action;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.biz.TopicBiz;
import com.tutoring.entity.Question;

public class TopicDetailAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	TopicBiz topicBiz;
	public void setTopicBiz(TopicBiz topicBiz) {
		this.topicBiz = topicBiz;
	}
	private int topicid;
	public int getTopicid() {
		return topicid;
	}
	public void setTopicid(int id) {
		this.topicid = id;
	}
	public String execute() throws Exception{
		
		Question q = topicBiz.getQuestionById(topicid);
		//System.out.println(q.getUser().getFirstName());
		ActionContext ac = ActionContext.getContext();
		ac.getValueStack().push(q);
		
		return SUCCESS;
	}
}
