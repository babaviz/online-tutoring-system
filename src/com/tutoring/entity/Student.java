package com.tutoring.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */

public class Student implements java.io.Serializable {

	// Fields

	private Long id;
	private Person person;
	private Long balance;
	private Integer grade;
	private Set applications = new HashSet(0);
	private Set studentTimetables = new HashSet(0);

	// Constructors

	/** default constructor */
	public Student() {
	}

	/** minimal constructor */
	public Student(Long id, Person person) {
		this.id = id;
		this.person = person;
	}

	/** full constructor */
	public Student(Long id, Person person, Long balance, Integer grade,
			Set applications, Set studentTimetables) {
		this.id = id;
		this.person = person;
		this.balance = balance;
		this.grade = grade;
		this.applications = applications;
		this.studentTimetables = studentTimetables;
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

	public Set getApplications() {
		return this.applications;
	}

	public void setApplications(Set applications) {
		this.applications = applications;
	}

	public Set getStudentTimetables() {
		return this.studentTimetables;
	}

	public void setStudentTimetables(Set studentTimetables) {
		this.studentTimetables = studentTimetables;
	}

}