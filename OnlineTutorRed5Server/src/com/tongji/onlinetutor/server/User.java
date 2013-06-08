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
	private boolean dummy;
	private String token;
	
	public User(String name, boolean type, IConnection conn, IScope scope) {
		this.name = name;
		//this.token = token;
		this.type = type;
		this.conn = conn;
		this.scope = scope;
		this.isOnline = true;
		this.dummy = false;
	}
	public User(String name, boolean type){
		this.name = name;
		this.type = type;
		this.conn = null;
		this.scope = null;
		this.isOnline = false;
		this.dummy = true;
	}
	public void Instantiate(IConnection conn, IScope scope){
		this.conn = conn;
		this.scope = scope;
		this.dummy = false;
		this.isOnline = true;
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
	public boolean isDummy(){
		return dummy;
	}
}
