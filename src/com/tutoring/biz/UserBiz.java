package com.tutoring.biz;

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
}
