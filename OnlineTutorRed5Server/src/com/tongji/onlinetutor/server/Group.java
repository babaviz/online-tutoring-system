package com.tongji.onlinetutor.server;

import java.util.ArrayList;

public class Group {
	private User master_;
	private ArrayList<User> children_;
	private String time_;
	
	public Group(String master_name, String time){
		master_ = new User(master_name);
		children_ = new ArrayList<User>();
		this.time_ = time;
	}
	public Group(User master, String time){
		master_ = master;
		children_ = new ArrayList<User>();
		time_ = time;
	}
	
	public String getIdentification(){
		return master_.name() + time_;
	}
	public String getMasterName(){
		return master_.name();
	}
	public String getTime(){
		return time_;
	}
	public int getAllChildrenCount(){
		return children_.size();
	}
	public int getOnlineChildrenCount(){
		int count = 0;
		for(User user : children_){
			if(user.isOnline())
				count++;
		}
		return count;
	}
	//if child already exists, return false;
	public boolean addChildren(String child_name){
		boolean flag = true;
		for(User user : children_){
			if(user.name().equals(child_name)){
				flag = false;
				break;
			}
		}
		if(flag)
			children_.add(new User(child_name));
		return flag;
	}
	//if child already exists, return false;
	public boolean addChildren(User child){
		boolean flag = true;
		for(User user : children_){
			if(user.name().equals(child.name())){
				flag = false;
				break;
			}
		}
		if(flag)
			children_.add(child);
		return flag;
	}
	//if no such child found, return false;
	public boolean ChildOnline(String child_name){
		boolean flag = false;
		for(User user : children_){
			if(user.name().equals(child_name)){
				user.setIsOnline(true);
				flag = true;
				break;
			}
		}
		return flag;
	}
	public void ChildOffline(String child_name){
		for(User user : children_){
			if(user.name().equals(child_name)){
				user.setIsOnline(false);
				break;
			}
		}
	}
	public boolean isReady(){
		return (master_.isOnline() && getOnlineChildrenCount()>0);
	}
	public String getPublishStreamId(String requester_name){
		if(!isReady())
			return null;
		String id = null;
		if(master_.name().equals(requester_name)){
			id = master_.name() + "-" +time_;
		}
		else{
			for(User user : children_){
				if(user.isOnline() && user.name().equals(requester_name)){
					id = user.name() + "-" + master_.name() + "-" + time_;
					break;
				}
			}
		}
		return id;
	}
	public String getPlayStreamId(String requester_name){
		if(!isReady())
			return null;
		String id = null;
		if(master_.name().equals(requester_name)){
			if(getOnlineChildrenCount() == 1){
				for(User user : children_){
					if(user.isOnline()){
						id = user.name() + "-" + master_.name() + "-" + time_;
						break;
					}
				}
			}
		}
		else{
			id = master_.name() + "-" + time_;
		}
		return id;
	}
}
