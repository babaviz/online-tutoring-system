package com.tongji.onlinetutor.server;

import java.util.ArrayList;

public class Group {
	private User master;
	private ArrayList<User> children;
	private String time;
	
	public Group(String mastername, String token, String time){
		this.master = new User(mastername,false);
		this.children = new ArrayList<User>();
		this.time = time;
	}
	public Group(User master, String time){
		this.master = master;
		this.children = new ArrayList<User>();
		this.time = time;
	}
	
	public String getIdentification(){
		return master.token();
	}
	public String getMasterName(){
		return master.name();
	}
	public String getTime(){
		return time;
	}
	public int getAllChildrenCount(){
		return children.size();
	}
	public int getOnlineChildrenCount(){
		int count = 0;
		for(User user : children){
			if(user.isOnline())
				count++;
		}
		return count;
	}
	//if child already exists, return false;
	public boolean addChildren(String child_name,String token){
		boolean flag = true;
		for(User user : children){
			if(user.name().equals(child_name)){
				flag = false;
				break;
			}
		}
		if(flag)
			children.add(new User(child_name,false));
		return flag;
	}
	//if child already exists, return false;
	public boolean addChildren(User child){
		boolean flag = true;
		for(User user : children){
			if(user.name().equals(child.name())){
				flag = false;
				break;
			}
		}
		if(flag)
			children.add(child);
		return flag;
	}
	//if no such child found, return false;
	public boolean UserCome(String token){
		boolean flag = false;
		if(master.token().equals(token)){
			master.setIsOnline(true);
			return true;
		}
		for(User user : children){
			if(user.token().equals(token)){
				user.setIsOnline(true);
				flag = true;
				break;
			}
		}
		return flag;
	}
	public void UserLeave(String token){
		if(master.token().equals(token)){
			master.setIsOnline(false);
			return;
		}
		for(User user : children){
			if(user.token().equals(token)){
				user.setIsOnline(false);
				break;
			}
		}
	}
	public boolean isReady(){
		return (master.isOnline() && getOnlineChildrenCount()>0);
	}
	public String getPublishStreamId(String requester_token){
		if(!isReady())
			return null;
		String id = null;
		if(master.token().equals(requester_token)){
			id = master.name() + "-" +time+"-"+master.token();
		}
		else{
			for(User user : children){
				if(user.isOnline() && user.token().equals(requester_token)){
					id = user.name() + "-" + master.name() + "-" + time + "-" + user.token();
					break;
				}
			}
		}
		return id;
	}
	public String getPlayStreamId(String requester_token){
		if(!isReady())
			return null;
		String id = null;
		if(master.token().equals(requester_token)){
			if(getOnlineChildrenCount() == 1){
				for(User user : children){
					if(user.isOnline()){
						id = user.name() + "-" + master.name() + "-" + time + "-" + user.token();
						break;
					}
				}
			}
		}
		else{
			id = master.name() + "-" + time + "-" + master.token();
		}
		return id;
	}
}
