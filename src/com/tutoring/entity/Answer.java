package com.tutoring.entity;

import java.sql.Timestamp;

/**
 * Answer entity. @author MyEclipse Persistence Tools
 */

public class Answer implements java.io.Serializable {

	// Fields

	private Integer id;
	private User user;
	private Question question;
	private String content;
	private Timestamp time;
	private String picSn;

	// Constructors

	/** default constructor */
	public Answer() {
	}

	/** minimal constructor */
	public Answer(User user, Question question, String content, Timestamp time) {
		this.user = user;
		this.question = question;
		this.content = content;
		this.time = time;
	}

	/** full constructor */
	public Answer(User user, Question question, String content, Timestamp time,
			String picSn) {
		this.user = user;
		this.question = question;
		this.content = content;
		this.time = time;
		this.picSn = picSn;
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

	public Question getQuestion() {
		return this.question;
	}

	public void setQuestion(Question question) {
		this.question = question;
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

	public String getPicSn() {
		return this.picSn;
	}

	public void setPicSn(String picSn) {
		this.picSn = picSn;
	}

}