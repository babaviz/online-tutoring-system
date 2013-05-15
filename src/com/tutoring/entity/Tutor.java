package com.tutoring.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Tutor entity. @author MyEclipse Persistence Tools
 */

public class Tutor implements java.io.Serializable {

	// Fields

	private String personUsername;
	private Person person;
	private Long salary;
	private String description;
	private Set specialties = new HashSet(0);
	private Set arrangements = new HashSet(0);

	// Constructors

	/** default constructor */
	public Tutor() {
	}

	/** minimal constructor */
	public Tutor(String personUsername, Person person) {
		this.personUsername = personUsername;
		this.person = person;
	}

	/** full constructor */
	public Tutor(String personUsername, Person person, Long salary,
			String description, Set specialties, Set arrangements) {
		this.personUsername = personUsername;
		this.person = person;
		this.salary = salary;
		this.description = description;
		this.specialties = specialties;
		this.arrangements = arrangements;
	}

	// Property accessors

	public String getPersonUsername() {
		return this.personUsername;
	}

	public void setPersonUsername(String personUsername) {
		this.personUsername = personUsername;
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

	public Set getSpecialties() {
		return this.specialties;
	}

	public void setSpecialties(Set specialties) {
		this.specialties = specialties;
	}

	public Set getArrangements() {
		return this.arrangements;
	}

	public void setArrangements(Set arrangements) {
		this.arrangements = arrangements;
	}

}