package com.tutoring.dao;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.tutoring.bean.SearchFactors;
import com.tutoring.bean.SearchUserResult;
import com.tutoring.entity.User;

public interface UserDAO {
	public String  getPasswordByEmail(String email);
	public void addUser(String email, String password,char type,String firstname,String lastname);
	public User getUserByEmail(String email);
	public List<?> getQuestionsByEmail(String email); 
	public User setTutor(User u, String FirstName, String LastName, String phone, Date birth, String school,String description);
	public void save(User u);
	public User getUserByID(int id);
	public User setStudent(User u, String FirstName, String LastName, String phone, Date birth, String school,String grade);
	public ArrayList<SearchUserResult> searchUsers(SearchFactors factors, int pageNO);
	public int searchUsersNum(SearchFactors factors);
}
