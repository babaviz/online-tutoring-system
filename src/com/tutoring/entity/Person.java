package com.tutoring.entity;

import java.util.Date;

/**
 * Person entity. @author MyEclipse Persistence Tools
 */

public class Person implements java.io.Serializable {

	// Fields

	private Long id;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private String phone;
	private Date birthday;
	private String cardNumber;
	private String type;
	private Integer score;
	private String avator;

	// Constructors

	/** default constructor */
	public Person() {
	}

	/** minimal constructor */
	public Person(String firstName, String lastName, String email,
			String password) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
	}

	/** full constructor */
	public Person(String firstName, String lastName, String email,
			String password, String phone, Date birthday, String cardNumber,
			String type, Integer score, String avator) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.birthday = birthday;
		this.cardNumber = cardNumber;
		this.type = type;
		this.score = score;
		this.avator = avator;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
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

}