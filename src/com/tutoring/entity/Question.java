package com.tutoring.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Question entity. @author MyEclipse Persistence Tools
 */

public class Question implements java.io.Serializable {

	// Fields

	private Integer id;
	private User user;
	private Subject subject;
	private String title;
	private String content;
	private Timestamp time;
	private Integer view;
	private String picSn;
	private String attachmentSn;
	private Integer reply;
	private Set answers = new HashSet(0);

	// Constructors

	/** default constructor */
	public Question() {
	}

	/** minimal constructor */
	public Question(User user, Subject subject, String title, String content,
			Timestamp time, Integer view, Integer reply) {
		this.user = user;
		this.subject = subject;
		this.title = title;
		this.content = content;
		this.time = time;
		this.view = view;
		this.reply = reply;
	}

	/** full constructor */
	public Question(User user, Subject subject, String title, String content,
			Timestamp time, Integer view, String picSn, String attachmentSn,
			Integer reply, Set answers) {
		this.user = user;
		this.subject = subject;
		this.title = title;
		this.content = content;
		this.time = time;
		this.view = view;
		this.picSn = picSn;
		this.attachmentSn = attachmentSn;
		this.reply = reply;
		this.answers = answers;
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

	public Subject getSubject() {
		return this.subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
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

	public String getPicSn() {
		return this.picSn;
	}

	public void setPicSn(String picSn) {
		this.picSn = picSn;
	}

	public String getAttachmentSn() {
		return this.attachmentSn;
	}

	public void setAttachmentSn(String attachmentSn) {
		this.attachmentSn = attachmentSn;
	}

	public Integer getReply() {
		return this.reply;
	}

	public void setReply(Integer reply) {
		this.reply = reply;
	}

	public Set getAnswers() {
		return this.answers;
	}

	public void setAnswers(Set answers) {
		this.answers = answers;
	}

}