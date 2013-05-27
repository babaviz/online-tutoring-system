package com.tongji.onlinetutor.server;

import org.red5.server.api.IConnection;
import org.red5.server.api.scope.IScope;


public class User{
	public static class Type{
		public static boolean TEACHER = true;
		public static boolean STUDENT = false;
	}
	private String name;
	private IConnection conn;
	private IScope scope;
	private boolean isOnline;
	private boolean type;
	private String token;
	public User(String name, String token, IConnection conn, IScope scope) {
		this.name = name;
		this.token = token;
		//TODO type!
		this.type = User.Type.STUDENT;
		this.conn = conn;
		this.scope = scope;
		this.isOnline = true;
	}
	public User(String name){
		this.name = name;
		this.token = null;
		this.type = User.Type.STUDENT;
		this.conn = null;
		this.scope = null;
		this.isOnline = false;
	}
	public String name(){
		return name;
	}
	public String token(){
		return token;
	}
	public IConnection conn(){
		return conn;
	}
	public IScope scope(){
		return scope;
	}
	public boolean isOnline(){
		return isOnline;
	}
	public void setIsOnline(boolean b){
		isOnline = b;
	}
	public boolean getType(){
		return type;
	}
}
