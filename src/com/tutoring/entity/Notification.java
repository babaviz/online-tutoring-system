package com.tutoring.entity;

import java.sql.Timestamp;

/**
 * Notification entity. @author MyEclipse Persistence Tools
 */

public class Notification implements java.io.Serializable {

	// Fields

	private Long id;
	private Person person;
	private Long notificationId;
	private Timestamp time;
	private Integer type;

	// Constructors

	/** default constructor */
	public Notification() {
	}

	/** minimal constructor */
	public Notification(Long id, Person person, Long notificationId,
			Integer type) {
		this.id = id;
		this.person = person;
		this.notificationId = notificationId;
		this.type = type;
	}

	/** full constructor */
	public Notification(Long id, Person person, Long notificationId,
			Timestamp time, Integer type) {
		this.id = id;
		this.person = person;
		this.notificationId = notificationId;
		this.time = time;
		this.type = type;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Person getPerson() {
		return this.person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public Long getNotificationId() {
		return this.notificationId;
	}

	public void setNotificationId(Long notificationId) {
		this.notificationId = notificationId;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

}