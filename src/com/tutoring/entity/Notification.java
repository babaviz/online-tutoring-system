package com.tutoring.entity;

import java.sql.Timestamp;

/**
 * Notification entity. @author MyEclipse Persistence Tools
 */

public class Notification implements java.io.Serializable {

	// Fields

	private Long id;
	private Person personBySenderUsername;
	private Person personByRecipientUsername;
	private Timestamp time;
	private String content;

	// Constructors

	/** default constructor */
	public Notification() {
	}

	/** minimal constructor */
	public Notification(Long id, Person personBySenderUsername,
			Person personByRecipientUsername, String content) {
		this.id = id;
		this.personBySenderUsername = personBySenderUsername;
		this.personByRecipientUsername = personByRecipientUsername;
		this.content = content;
	}

	/** full constructor */
	public Notification(Long id, Person personBySenderUsername,
			Person personByRecipientUsername, Timestamp time, String content) {
		this.id = id;
		this.personBySenderUsername = personBySenderUsername;
		this.personByRecipientUsername = personByRecipientUsername;
		this.time = time;
		this.content = content;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Person getPersonBySenderUsername() {
		return this.personBySenderUsername;
	}

	public void setPersonBySenderUsername(Person personBySenderUsername) {
		this.personBySenderUsername = personBySenderUsername;
	}

	public Person getPersonByRecipientUsername() {
		return this.personByRecipientUsername;
	}

	public void setPersonByRecipientUsername(Person personByRecipientUsername) {
		this.personByRecipientUsername = personByRecipientUsername;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}