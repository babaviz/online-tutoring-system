package com.tutoring.dao;

import com.tutoring.entity.Person;

public interface MasterDAO {
	public void addMaster(Person person, String title, String time, String content,String picture,String attachment);
}
