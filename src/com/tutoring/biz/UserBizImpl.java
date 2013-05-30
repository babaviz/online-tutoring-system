package com.tutoring.biz;

import java.util.Date;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.tutoring.dao.UserDAO;
import com.tutoring.entity.User;


public class UserBizImpl implements UserBiz{

	UserDAO userDAO;

	@Override
	public boolean login(String email, String password) {
		// TODO Auto-generated method stub
		
		if(password.equals(userDAO.getPasswordByEmail(email))){
			return true;
		}
		return false;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	
	public boolean CanLoginBySession()
	{
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		
		if(session.get("user")!=null)
			return true;
		return false;
	}
	
	public boolean CanLoginByCookie()
	{
		return false;
	}
	
	public void register(String password,String email,String type,String firstname, String lastname)
	{
		char t;
		if(type.equals("student"))
		
			t='1';
			
		
		else
			t='2';
		userDAO.addUser(email, password,t,firstname,lastname);
		
	}

	@Override
	public boolean isUserExist(String email) {
		// TODO Auto-generated method stub
		if(userDAO.getUserByEmail(email)!=null)
			return true;
		else
			return false;
	}

	@Override
	public boolean isStudent(String email) {
		// TODO Auto-generated method stub
		User u = userDAO.getUserByEmail(email);
		if(u.getType() == '1')
			return true;
		else
			return false;
	}

	@Override
	public boolean isTutor(String email) {
		// TODO Auto-generated method stub
		User u = userDAO.getUserByEmail(email);
		if(u.getType() == '2')
			return true;
		else
			return false;
	}

	@Override
	public User getUserInfo(String email) {
		// TODO Auto-generated method stub
		
		return userDAO.getUserByEmail(email);
	}

	@Override
	public User changeUserInfo(String FirstName, String LastName,
			String phone, Date birth, String school) {
		// TODO Auto-generated method stub
		ActionContext ac = ActionContext.getContext();
		Map<String ,Object > session = ac.getSession();
		User u = userDAO.getUserByEmail(((User)session.get("user")).getEmail());
		System.out.println("from biz:"+phone);
		return userDAO.setUser(u, FirstName, LastName, phone, birth, school);
	}

	@Override
	public void setHeadImagePathByEmail(User user, String path) {
		// TODO Auto-generated method stub
		//User user = userDAO.getUserByEmail(email);
		
		user.setPicture(path);
		System.out.println(user.getPicture());
		userDAO.save(user);
	}

	
	
	
	
}
