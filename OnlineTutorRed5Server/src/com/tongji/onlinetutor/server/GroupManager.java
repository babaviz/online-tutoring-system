package com.tongji.onlinetutor.server;

import java.util.ArrayList;

public class GroupManager {
	private ArrayList<Group> groups_;
	public GroupManager() {
		// TODO something to do with the DB
		groups_ = new ArrayList<Group>();
	}
	
	//if already exsits, return false;
	public boolean addGroup(Group group){
		boolean flag = true;
		for(Group g : groups_){
			if(g.getIdentification().equals(group.getIdentification())){
				flag = false;
				break;
			}
		}
		if(flag)
			groups_.add(group);
		return flag;
	}
	public void CleanGroups(){
		//TODO remove overdue groups
	}
}
