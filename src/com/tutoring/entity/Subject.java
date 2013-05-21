package com.tutoring.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Subject entity. @author MyEclipse Persistence Tools
 */

public class Subject implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Set courses = new HashSet(0);
	private Set questions = new HashSet(0);
	private Set specialties = new HashSet(0);

	// Constructors

	/** default constructor */
	public Subject() {
	}

	/** full constructor */
	public Subject(String name, Set courses, Set questions, Set specialties) {
		this.name = name;
		this.courses = courses;
		this.questions = questions;
		this.specialties = specialties;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set getCourses() {
		return this.courses;
	}

	public void setCourses(Set courses) {
		this.courses = courses;
	}

	public Set getQuestions() {
		return this.questions;
	}

	public void setQuestions(Set questions) {
		this.questions = questions;
	}

	public Set getSpecialties() {
		return this.specialties;
	}

	public void setSpecialties(Set specialties) {
		this.specialties = specialties;
	}

}