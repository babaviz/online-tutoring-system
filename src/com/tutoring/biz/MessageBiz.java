package com.tutoring.biz;

import java.util.List;

import com.tutoring.entity.Message;
import com.tutoring.entity.User;

public interface MessageBiz {
	public void sendMessage(User user, int toid, String content);
	public List<Message> getOrderedMessages(User user);
	public List<Message> getOrderedMessagesWithUser(User u1,User u2);
}
