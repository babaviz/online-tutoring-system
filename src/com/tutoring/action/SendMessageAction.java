package com.tutoring.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.tutoring.biz.MessageBiz;
import com.tutoring.biz.SessionMaintainBiz;
import com.tutoring.entity.User;

public class SendMessageAction {
	MessageBiz messageBiz;
	SessionMaintainBiz sessionMaintainBiz;
	public void setSessionMaintainBiz(SessionMaintainBiz sessionMaintainBiz) {
		this.sessionMaintainBiz = sessionMaintainBiz;
	}
	public void setMessageBiz(MessageBiz messageBiz) {
		this.messageBiz = messageBiz;
	}
	public String sendMessage(int toid,String content){
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		User user = (User) session.get("user");
		messageBiz.sendMessage(user, toid, content);
		sessionMaintainBiz.updateUser();
		return "ok";
	}
}
