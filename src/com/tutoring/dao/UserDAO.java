package com.tutoring.dao;


import java.util.Date;
import java.util.List;

import com.tutoring.entity.User;

public interface UserDAO {
	public String  getPasswordByEmail(String email);
	public void addUser(String email, String password,char type,String firstname,String lastname);
	public User getUserByEmail(String email);
	public List<?> getQuestionsByEmail(String email); 
	public User setUser(User u, String FirstName, String LastName, String phone, Date birth, String school);
	public void save(User u);
}
