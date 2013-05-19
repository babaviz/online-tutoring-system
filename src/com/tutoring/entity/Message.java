package com.tutoring.entity;

import java.sql.Timestamp;

/**
 * Message entity. @author MyEclipse Persistence Tools
 */

public class Message implements java.io.Serializable {

	// Fields

	private Long id;
	private Person personBySenderId;
	private Person personByRecipientId;
	private Timestamp time;
	private String content;

	// Constructors

	/** default constructor */
	public Message() {
	}

	/** minimal constructor */
	public Message(Person personBySenderId, Person personByRecipientId,
			String content) {
		this.personBySenderId = personBySenderId;
		this.personByRecipientId = personByRecipientId;
		this.content = content;
	}

	/** full constructor */
	public Message(Person personBySenderId, Person personByRecipientId,
			Timestamp time, String content) {
		this.personBySenderId = personBySenderId;
		this.personByRecipientId = personByRecipientId;
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

	public Person getPersonBySenderId() {
		return this.personBySenderId;
	}

	public void setPersonBySenderId(Person personBySenderId) {
		this.personBySenderId = personBySenderId;
	}

	public Person getPersonByRecipientId() {
		return this.personByRecipientId;
	}

	public void setPersonByRecipientId(Person personByRecipientId) {
		this.personByRecipientId = personByRecipientId;
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