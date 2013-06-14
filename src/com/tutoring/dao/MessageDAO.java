package com.tutoring.dao;

import com.tutoring.entity.User;

public interface MessageDAO {
	public void addMessage(User user, User other, String content);
}
