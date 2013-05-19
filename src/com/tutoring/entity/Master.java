package com.tutoring.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Master entity. @author MyEclipse Persistence Tools
 */

public class Master implements java.io.Serializable {

	// Fields

	private Long id;
	private Person person;
	private String title;
	private String content;
	private Timestamp time;
	private Integer view;
	private Integer reply;
	private String picture;
	private String attachment;
	private Set postings = new HashSet(0);

	// Constructors

	/** default constructor */
	public Master() {
	}

	/** minimal constructor */
	public Master(Long id, Person person, String title, String content) {
		this.id = id;
		this.person = person;
		this.title = title;
		this.content = content;
	}

	/** full constructor */
	public Master(Long id, Person person, String title, String content,
			Timestamp time, Integer view, Integer reply, String picture,
			String attachment, Set postings) {
		this.id = id;
		this.person = person;
		this.title = title;
		this.content = content;
		this.time = time;
		this.view = view;
		this.reply = reply;
		this.picture = picture;
		this.attachment = attachment;
		this.postings = postings;
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

	public Integer getView() {
		return this.view;
	}

	public void setView(Integer view) {
		this.view = view;
	}

	public Integer getReply() {
		return this.reply;
	}

	public void setReply(Integer reply) {
		this.reply = reply;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getAttachment() {
		return this.attachment;
	}

	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}

	public Set getPostings() {
		return this.postings;
	}

	public void setPostings(Set postings) {
		this.postings = postings;
	}

}