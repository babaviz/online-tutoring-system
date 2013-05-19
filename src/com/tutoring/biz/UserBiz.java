package com.tutoring.biz;

public interface UserBiz {
	public boolean login(String email, String password);
	public boolean CanLoginBySession();
	public boolean CanLoginByCookie();
	public void register(String password,String email,String type);
	public boolean isUserExist(String email);
	public void deleteUser(String email);
}
