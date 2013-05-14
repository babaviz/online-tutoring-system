package com.tutoring.entity;

/**
 * Tutor entity. @author MyEclipse Persistence Tools
 */

public class Tutor implements java.io.Serializable {

	// Fields

	private Long id;
	private Long personId;
	private Long salary;
	private String description;

	// Constructors

	/** default constructor */
	public Tutor() {
	}

	/** minimal constructor */
	public Tutor(Long personId) {
		this.personId = personId;
	}

	/** full constructor */
	public Tutor(Long personId, Long salary, String description) {
		this.personId = personId;
		this.salary = salary;
		this.description = description;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getPersonId() {
		return this.personId;
	}

	public void setPersonId(Long personId) {
		this.personId = personId;
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