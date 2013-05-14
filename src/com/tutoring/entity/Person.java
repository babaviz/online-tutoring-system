package com.tutoring.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Person entity. @author MyEclipse Persistence Tools
 */

public class Person implements java.io.Serializable {

	// Fields

	private String username;
	private String firstName;
	private String lastName;
	private String email;
	private String phone;
	private Date birthday;
	private String cardNumber;
	private String type;
	private Integer score;
	private String avator;
	private Set students = new HashSet(0);

	// Constructors

	/** default constructor */
	public Person() {
	}

	/** minimal constructor */
	public Person(String email) {
		this.email = email;
	}

	/** full constructor */
	public Person(String firstName, String lastName, String email,
			String phone, Date birthday, String cardNumber, String type,
			Integer score, String avator, Set students) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
		this.birthday = birthday;
		this.cardNumber = cardNumber;
		this.type = type;
		this.score = score;
		this.avator = avator;
		this.students = students;
	}

	// Property accessors

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getCardNumber() {
		return this.cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getAvator() {
		return this.avator;
	}

	public void setAvator(String avator) {
		this.avator = avator;
	}

	public Set getStudents() {
		return this.students;
	}

	public void setStudents(Set students) {
		this.students = students;
	}

}