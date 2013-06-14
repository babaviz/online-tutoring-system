package com.tutoring.biz;

import com.tutoring.dao.FriendDAO;
import com.tutoring.dao.UserDAO;
import com.tutoring.entity.User;

public class FriendBizImpl implements FriendBiz{
	FriendDAO friendDAO;
	UserDAO userDAO;

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public void setFriendDAO(FriendDAO friendDAO) {
		this.friendDAO = friendDAO;
	}

	@Override
	public void addFriend(int a_id, int b_id) {
		// TODO Auto-generated method stub
		User a_user = userDAO.getUserByID(a_id);
		User b_user = userDAO.getUserByID(b_id);
		friendDAO.addFriend(a_user, b_user);
	}
}
