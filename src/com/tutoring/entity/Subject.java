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
	private Set specialties = new HashSet(0);
	private Set subjects = new HashSet(0);
	private Set courses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Subject() {
	}

	/** minimal constructor */
	public Subject(Long id) {
		this.id = id;
	}

	/** full constructor */
	public Subject(Long id, Subject subject, Set specialties, Set subjects,
			Set courses) {
		this.id = id;
		this.subject = subject;
		this.specialties = specialties;
		this.subjects = subjects;
		this.courses = courses;
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

	public Set getSpecialties() {
		return this.specialties;
	}

	public void setSpecialties(Set specialties) {
		this.specialties = specialties;
	}

	public Set getSubjects() {
		return this.subjects;
	}

	public void setSubjects(Set subjects) {
		this.subjects = subjects;
	}

	public Set getCourses() {
		return this.courses;
	}

	public void setCourses(Set courses) {
		this.courses = courses;
	}

}