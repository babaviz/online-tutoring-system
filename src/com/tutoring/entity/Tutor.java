package com.tutoring.entity;

/**
 * Tutor entity. @author MyEclipse Persistence Tools
 */

public class Tutor implements java.io.Serializable {

	// Fields

	private String personUsername;
	private Long salary;
	private String description;

	// Constructors

	/** default constructor */
	public Tutor() {
	}

	/** full constructor */
	public Tutor(Long salary, String description) {
		this.salary = salary;
		this.description = description;
	}

	// Property accessors

	public String getPersonUsername() {
		return this.personUsername;
	}

	public void setPersonUsername(String personUsername) {
		this.personUsername = personUsername;
	}

	public Long getSalary() {
		return this.salary;
	}

	public void setSalary(Long salary) {
		this.salary = salary;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}