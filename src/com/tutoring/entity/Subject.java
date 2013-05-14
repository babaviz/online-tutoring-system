package com.tutoring.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Subject entity. @author MyEclipse Persistence Tools
 */

public class Subject implements java.io.Serializable {

	// Fields

	private Long id;
	private Subject subject;
	private Set subjects = new HashSet(0);

	// Constructors

	/** default constructor */
	public Subject() {
	}

	/** full constructor */
	public Subject(Subject subject, Set subjects) {
		this.subject = subject;
		this.subjects = subjects;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Subject getSubject() {
		return this.subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public Set getSubjects() {
		return this.subjects;
	}

	public void setSubjects(Set subjects) {
		this.subjects = subjects;
	}

}