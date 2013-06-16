package com.tutoring.biz;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.tutoring.bean.ComparatorMessage;
import com.tutoring.dao.MessageDAO;
import com.tutoring.dao.NotificationDAO;
import com.tutoring.dao.UserDAO;
import com.tutoring.entity.Message;
import com.tutoring.entity.Notification;
import com.tutoring.entity.User;

public class MessageBizImpl implements MessageBiz{

	MessageDAO messageDAO;
	UserDAO userDAO;
	NotificationDAO notificationDAO;
	public void setNotificationDAO(NotificationDAO notificationDAO) {
		this.notificationDAO = notificationDAO;
	}
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	public void setMessageDAO(MessageDAO messageDAO) {
		this.messageDAO = messageDAO;
	}
	@Override
	public void sendMessage(User user, int toid, String content) {
		// TODO Auto-generated method stub
		
		User touser = userDAO.getUserByID(toid);
		notificationDAO.addNotice(user.getId(), 3, touser, user);
		//userDAO.save(user);
		
		messageDAO.addMessage(userDAO.getUserByID(user.getId()), userDAO.getUserByID(toid), content);
	}
	@Override
	public List<Message> getOrderedMessages(User user) {
		// TODO Auto-generated method stub
		user = userDAO.getUserByID(user.getId());
		List<Message> sendmsgs = new ArrayList<Message>(user.getSends());
		List<Message> receives = new ArrayList<Message>(user.getReceives());
		sendmsgs.addAll(receives);
		ComparatorMessage comparator = new ComparatorMessage();
		Collections.sort(sendmsgs,comparator);
		
		for(Notification n:user.getNotifications())
		{
			if(n.getState()==0&&n.getType()==3)
			{
				notificationDAO.setNoticeStatus(n, 1);
			}
		}
		
		return sendmsgs;
	}

}
