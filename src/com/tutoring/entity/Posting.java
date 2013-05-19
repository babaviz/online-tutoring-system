package com.tutoring.entity;

import java.sql.Timestamp;

/**
 * Posting entity. @author MyEclipse Persistence Tools
 */

public class Posting implements java.io.Serializable {

	// Fields

	private Long id;
	private Master master;
	private Person person;
	private String title;
	private String content;
	private Timestamp time;
	private String picture;

	// Constructors

	/** default constructor */
	public Posting() {
	}

	/** minimal constructor */
	public Posting(Long id, Master master, Person person, String title,
			String content) {
		this.id = id;
		this.master = master;
		this.person = person;
		this.title = title;
		this.content = content;
	}

	/** full constructor */
	public Posting(Long id, Master master, Person person, String title,
			String content, Timestamp time, String picture) {
		this.id = id;
		this.master = master;
		this.person = person;
		this.title = title;
		this.content = content;
		this.time = time;
		this.picture = picture;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Master getMaster() {
		return this.master;
	}

	public void setMaster(Master master) {
		this.master = master;
	}

	public Person getPerson() {
		return this.person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

}