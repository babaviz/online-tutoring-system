package com.tutoring.dao;

import com.tutoring.entity.User;

public interface FriendDAO {
	public void addFriend(User user, User other);
}
