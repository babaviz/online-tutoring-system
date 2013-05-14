package com.tutoring.biz;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.tutoring.dao.StudentDAO;
import com.tutoring.dao.TutorDAO;
import com.tutoring.dao.UserDAO;
import com.tutoring.dao.PersonDAO;

public class UserBizImpl implements UserBiz{

	UserDAO userDAO;
	PersonDAO personDAO;
	StudentDAO studentDAO;
	public void setTutorDAO(TutorDAO tutorDAO) {
		this.tutorDAO = tutorDAO;
	}

	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}

	TutorDAO tutorDAO;
	
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
	
	public void setPersonDAO(PersonDAO personDAO){
		this.personDAO = personDAO;
	}
	
	public boolean CanLoginBySession()
	{
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		
		if(session.get("username")!=null)
			return true;
		return false;
	}
	
	public boolean CanLoginByCookie()
	{
		return false;
	}
	
	public void register(String username, String password,String email,String type)
	{
		userDAO.addUser(username, password);
		personDAO.addPerson(username, email);
		if(type.equals("student"))
		{
			studentDAO.addStudent(username);
		}
		else if(type.equals("tutor"))
		{
			tutorDAO.addTutor(username);
		}
		else
			return;
		
	}
	
}
