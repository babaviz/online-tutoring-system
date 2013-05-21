package com.tutoring.dao;


import com.tutoring.entity.User;

public interface UserDAO {
	public String  getPasswordByEmail(String email);
	public void addUser(String email, String password);
	public User getUserByEmail(String email);
	public void deleteUser(String email);
}
