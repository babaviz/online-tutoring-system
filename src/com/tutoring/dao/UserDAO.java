package com.tutoring.dao;


import java.util.List;

import com.tutoring.entity.User;

public interface UserDAO {
	public String  getPasswordByEmail(String email);
	public void addUser(String email, String password,char type);
	public User getUserByEmail(String email);
	public void deleteUser(String email);
	public List<?> getQuestionsByEmail(String email); 
}
