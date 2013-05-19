package com.tutoring.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Tutor entity. @author MyEclipse Persistence Tools
 */

public class Tutor implements java.io.Serializable {

	// Fields

	private Long id;
	private Person person;
	private Long salary;
	private String description;
	private Set arrangements = new HashSet(0);
	private Set specialties = new HashSet(0);

	// Constructors

	/** default constructor */
	public Tutor() {
	}

	/** minimal constructor */
	public Tutor(Long id, Person person) {
		this.id = id;
		this.person = person;
	}

	/** full constructor */
	public Tutor(Long id, Person person, Long salary, String description,
			Set arrangements, Set specialties) {
		this.id = id;
		this.person = person;
		this.salary = salary;
		this.description = description;
		this.arrangements = arrangements;
		this.specialties = specialties;
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

	public Set getArrangements() {
		return this.arrangements;
	}

	public void setArrangements(Set arrangements) {
		this.arrangements = arrangements;
	}

	public Set getSpecialties() {
		return this.specialties;
	}

	public void setSpecialties(Set specialties) {
		this.specialties = specialties;
	}

}