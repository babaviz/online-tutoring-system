package com.tutoring.biz;

public interface UserBiz {
	public boolean login(String username, String password);
	public boolean CanLoginBySession();
	public boolean CanLoginByCookie();
	public void register(String username, String password,String email,String type);
}
