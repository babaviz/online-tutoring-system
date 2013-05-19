package com.tutoring.biz;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.tutoring.dao.StudentDAO;
import com.tutoring.dao.TutorDAO;
import com.tutoring.dao.UserDAO;


public class UserBizImpl implements UserBiz{

	UserDAO userDAO;
	StudentDAO studentDAO;
	public void setTutorDAO(TutorDAO tutorDAO) {
		this.tutorDAO = tutorDAO;
	}

	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}

	TutorDAO tutorDAO;
	
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
		
		if(session.get("email")!=null)
			return true;
		return false;
	}
	
	public boolean CanLoginByCookie()
	{
		return false;
	}
	
	public void register(String password,String email,String type)
	{
		userDAO.addPerson(email, password);
		
	}

	@Override
	public boolean isUserExist(String email) {
		// TODO Auto-generated method stub
		if(userDAO.getPersonByEmail(email)!=null)
			return true;
		else
			return false;
	}

	@Override
	public void deleteUser(String email) {
		// TODO Auto-generated method stub
		userDAO.deletePerson(email);
	}
	
	
	
}
