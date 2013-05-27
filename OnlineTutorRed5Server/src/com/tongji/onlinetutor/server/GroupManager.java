package com.tongji.onlinetutor.server;

import java.util.HashMap;

import org.red5.server.api.IConnection;

public class GroupManager {
	private HashMap<String, Group> groups;
	private HashMap<String, User> name_users;
	private HashMap<IConnection, User> conn_users;
	public GroupManager() {
		// TODO something to do with the DB
		groups = new HashMap<String, Group>();
		name_users = new HashMap<String, User>();
		conn_users = new HashMap<IConnection, User>();
	}
	
	//if already exsits, return false;
	public boolean addGroup(Group group){
		if(groups.containsKey(group.getIdentification()))
			return false;
		groups.put(group.getIdentification(), group);
		return true;
	}
	
	public void removeGroup(Group group){
		groups.remove(group.getIdentification());
	}
	public void removeGroup(String token){
		groups.remove(token);
	}
	
	public Group getGroup(String token){
		return groups.get(token);
	}
	
	public void CleanGroups(){
		//TODO remove overdue groups
	}
}
