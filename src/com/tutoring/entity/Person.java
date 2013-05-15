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
	private Set notificationsForSenderUsername = new HashSet(0);
	private Set friendsForSecondaryUsername = new HashSet(0);
	private Set postings = new HashSet(0);
	private Set students = new HashSet(0);
	private Set masters = new HashSet(0);
	private Set tutors = new HashSet(0);
	private Set friendsForPrimaryUsername = new HashSet(0);
	private Set notificationsForRecipientUsername = new HashSet(0);

	// Constructors

	/** default constructor */
	public Person() {
	}

	/** minimal constructor */
	public Person(String username, String email) {
		this.username = username;
		this.email = email;
	}

	/** full constructor */
	public Person(String username, String firstName, String lastName,
			String email, String phone, Date birthday, String cardNumber,
			String type, Integer score, String avator,
			Set notificationsForSenderUsername,
			Set friendsForSecondaryUsername, Set postings, Set students,
			Set masters, Set tutors, Set friendsForPrimaryUsername,
			Set notificationsForRecipientUsername) {
		this.username = username;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
		this.birthday = birthday;
		this.cardNumber = cardNumber;
		this.type = type;
		this.score = score;
		this.avator = avator;
		this.notificationsForSenderUsername = notificationsForSenderUsername;
		this.friendsForSecondaryUsername = friendsForSecondaryUsername;
		this.postings = postings;
		this.students = students;
		this.masters = masters;
		this.tutors = tutors;
		this.friendsForPrimaryUsername = friendsForPrimaryUsername;
		this.notificationsForRecipientUsername = notificationsForRecipientUsername;
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

	public Set getNotificationsForSenderUsername() {
		return this.notificationsForSenderUsername;
	}

	public void setNotificationsForSenderUsername(
			Set notificationsForSenderUsername) {
		this.notificationsForSenderUsername = notificationsForSenderUsername;
	}

	public Set getFriendsForSecondaryUsername() {
		return this.friendsForSecondaryUsername;
	}

	public void setFriendsForSecondaryUsername(Set friendsForSecondaryUsername) {
		this.friendsForSecondaryUsername = friendsForSecondaryUsername;
	}

	public Set getPostings() {
		return this.postings;
	}

	public void setPostings(Set postings) {
		this.postings = postings;
	}

	public Set getStudents() {
		return this.students;
	}

	public void setStudents(Set students) {
		this.students = students;
	}

	public Set getMasters() {
		return this.masters;
	}

	public void setMasters(Set masters) {
		this.masters = masters;
	}

	public Set getTutors() {
		return this.tutors;
	}

	public void setTutors(Set tutors) {
		this.tutors = tutors;
	}

	public Set getFriendsForPrimaryUsername() {
		return this.friendsForPrimaryUsername;
	}

	public void setFriendsForPrimaryUsername(Set friendsForPrimaryUsername) {
		this.friendsForPrimaryUsername = friendsForPrimaryUsername;
	}

	public Set getNotificationsForRecipientUsername() {
		return this.notificationsForRecipientUsername;
	}

	public void setNotificationsForRecipientUsername(
			Set notificationsForRecipientUsername) {
		this.notificationsForRecipientUsername = notificationsForRecipientUsername;
	}

}