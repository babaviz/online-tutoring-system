package com.tutoring.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;


import nl.justobjects.pushlet.core.Dispatcher;
import nl.justobjects.pushlet.core.Event;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.bean.ComparatorMessage;
import com.tutoring.biz.MessageBiz;
import com.tutoring.biz.SessionMaintainBiz;
import com.tutoring.biz.UserBiz;

import com.tutoring.entity.Message;
import com.tutoring.entity.User;

public class ChattingAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	MessageBiz messageBiz;
	SessionMaintainBiz sessionMaintainBiz;
	UserBiz userBiz;
	
	
	
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public void setSessionMaintainBiz(SessionMaintainBiz sessionMaintainBiz) {
		this.sessionMaintainBiz = sessionMaintainBiz;
	}
	
	public void setMessageBiz(MessageBiz messageBiz) {
		this.messageBiz = messageBiz;
	}
	
	private User currentReceiver;
	private int userid=0;

	public String execute() throws Exception{
		ActionContext ac = ActionContext.getContext();
		Map<String, Object>session = ac.getSession();
		User user = (User) session.get("user");
		if(userid==0)
		{
			System.out.println("userid is 0");
			List<Message> receives = new ArrayList<Message>(user.getReceives());
			ComparatorMessage comparator = new ComparatorMessage();
			Collections.sort(receives,comparator);
			if(receives.size()>0)
			{
				currentReceiver = receives.get(receives.size()-1).getSender();
			}
			else
			{
				
			}
		}
		else
		{
			currentReceiver = userBiz.getUserInfoById(userid);
		}
		List<Message> msglist = messageBiz.getOrderedMessagesWithUser(user, currentReceiver);
		ac.put("msglist", msglist);
		System.out.println(user.getEmail()+" in execute currentReceiver:"+currentReceiver.getEmail());
		return SUCCESS;
	}


	public User getCurrentReceiver() {
		return currentReceiver;
	}


	public void setCurrentReceiver(User currentReceiver) {
		this.currentReceiver = currentReceiver;
	}

	public String sendMessage(int receiverid, String content)
	{
		ActionContext ac = ActionContext.getContext();
		Map<String, Object>session = ac.getSession();
		User user = (User)session.get("user");
		messageBiz.sendMessage(user, receiverid, content);
		//System.out.println(currentReceiver.getEmail());
		//System.out.println(user.getEmail()+" send to currentReceiver:"+currentReceiver.getEmail());
		currentReceiver = userBiz.getUserInfoById(receiverid);
		sessionMaintainBiz.updateUser();
		Unicast(content);
		return "ok";
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	public void Unicast(String content){
		Event event = Event.createDataEvent("/tutoring/numberofnotice");
		event.setField("content", content);
		Dispatcher.getInstance().unicast(event, currentReceiver.getId()+"");
	}
	
	public void readMessage(int receiveid)
	{
		ActionContext ac = ActionContext.getContext();
		Map<String, Object>session = ac.getSession();
		User user = (User)session.get("user");
		messageBiz.readAllMessage(user, userBiz.getUserInfoById(receiveid));
		sessionMaintainBiz.updateUser();
	}
	
}
