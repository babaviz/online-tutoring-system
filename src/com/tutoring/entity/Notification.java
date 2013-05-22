package com.tutoring.entity;

import java.sql.Timestamp;

/**
 * Notification entity. @author MyEclipse Persistence Tools
 */

public class Notification implements java.io.Serializable {

	// Fields

	private Integer id;
	private User user;
	private Integer notificationId;
	private Integer type;
	private Timestamp time;

	// Constructors

	/** default constructor */
	public Notification() {
	}

	/** full constructor */
	public Notification(User user, Integer notificationId, Integer type,
			Timestamp time) {
		this.user = user;
		this.notificationId = notificationId;
		this.type = type;
		this.time = time;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getNotificationId() {
		return this.notificationId;
	}

	public void setNotificationId(Integer notificationId) {
		this.notificationId = notificationId;
	}

	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

}