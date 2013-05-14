package com.tutoring.dao;

public interface UserDAO {
	public String getPasswordByUsername(String username);
	public void addUser(String username, String password);
}
