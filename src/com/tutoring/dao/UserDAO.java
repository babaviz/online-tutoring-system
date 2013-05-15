package com.tutoring.dao;

import java.util.List;

public interface UserDAO {
	public String getPasswordByUsername(String username);
	public void addUser(String username, String password);
	public List<?> getUserByUsername(String username);
}
