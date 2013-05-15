package com.tutoring.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */

public class Student implements java.io.Serializable {

	// Fields

	private String personUsername;
	private Person person;
	private Long balance;
	private Integer grade;
	private Set studentTimetables = new HashSet(0);

	// Constructors

	/** default constructor */
	public Student() {
	}

	/** minimal constructor */
	public Student(String personUsername, Person person) {
		this.personUsername = personUsername;
		this.person = person;
	}

	/** full constructor */
	public Student(String personUsername, Person person, Long balance,
			Integer grade, Set studentTimetables) {
		this.personUsername = personUsername;
		this.person = person;
		this.balance = balance;
		this.grade = grade;
		this.studentTimetables = studentTimetables;
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

	public Long getBalance() {
		return this.balance;
	}

	public void setBalance(Long balance) {
		this.balance = balance;
	}

	public Integer getGrade() {
		return this.grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public Set getStudentTimetables() {
		return this.studentTimetables;
	}

	public void setStudentTimetables(Set studentTimetables) {
		this.studentTimetables = studentTimetables;
	}

}