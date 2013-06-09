package com.tutoring.biz;

import java.util.ArrayList;
import java.util.Date;

import com.tutoring.bean.SearchFactors;
import com.tutoring.bean.SearchUserResult;
import com.tutoring.entity.User;

public interface UserBiz {
	public boolean login(String email, String password);
	public boolean CanLoginBySession();
	public boolean CanLoginByCookie();
	public void register(String password,String email,String type,String firstname,String lastname);
	public boolean isUserExist(String email);
	public boolean isStudent(String email);
	public boolean isTutor(String email);
	public User getUserInfo(String email);
	public User changeUserInfo(String FirstName, String LastName, String phone, Date birth, String school,String description);
	public User changeUserInfo(String FirstName, String LastName, String phone, Date birth, String school,int grade);
	public void setHeadImagePathByEmail(User user , String path);
	public User getUserInfoById(int id);
	public User getMyUserInfo();
	public ArrayList<SearchUserResult> getUsers(SearchFactors factors);
}
