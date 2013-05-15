package com.tongji.onlinetutor.server;

import org.red5.server.api.IConnection;
import org.red5.server.api.scope.IScope;


public class User{
	private String name_;
	private IConnection conn_;
	private IScope scope_;
	private boolean isOnline_;
	public User(String name, IConnection conn, IScope scope) {
		this.name_ = name;
		this.conn_ = conn;
		this.scope_ = scope;
		this.isOnline_ = true;
	}
	public User(String name){
		this.conn_ = null;
		this.scope_ = null;
		this.isOnline_ = false;
	}
	public String name(){
		return name_;
	}
	public IConnection conn(){
		return conn_;
	}
	public IScope scope(){
		return scope_;
	}
	public boolean isOnline(){
		return isOnline_;
	}
	public void setIsOnline(boolean b){
		isOnline_ = b;
	}
}
