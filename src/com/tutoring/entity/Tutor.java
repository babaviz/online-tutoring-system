package com.tutoring.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Tutor entity. @author MyEclipse Persistence Tools
 */

public class Tutor implements java.io.Serializable {

	// Fields

	private Integer id;
	private User user;
	private Integer balance;
	private String description;
	private Set specialties = new HashSet(0);
	private Set courses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Tutor() {
	}

	/** minimal constructor */
	public Tutor(User user) {
		this.user = user;
	}

	/** full constructor */
	public Tutor(User user, Integer balance, String description,
			Set specialties, Set courses) {
		this.user = user;
		this.balance = balance;
		this.description = description;
		this.specialties = specialties;
		this.courses = courses;
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

	public Integer getBalance() {
		return this.balance;
	}

	public void setBalance(Integer balance) {
		this.balance = balance;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set getSpecialties() {
		return this.specialties;
	}

	public void setSpecialties(Set specialties) {
		this.specialties = specialties;
	}

	public Set getCourses() {
		return this.courses;
	}

	public void setCourses(Set courses) {
		this.courses = courses;
	}

}