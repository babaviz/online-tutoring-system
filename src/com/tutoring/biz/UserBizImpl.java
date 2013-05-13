package com.tutoring.biz;

import com.tutoring.dao.UserDAO;

public class UserBizImpl implements UserBiz{

	UserDAO userDAO;
	
	@Override
	public boolean login(String username, String password) {
		// TODO Auto-generated method stub
		if(password.equals(userDAO.getPasswordByUsername(username))){
			return true;
		}
		return false;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
}
