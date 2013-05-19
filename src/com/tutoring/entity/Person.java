package com.tutoring.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

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
	private Set postings = new HashSet(0);
	private Set messagesForRecipientId = new HashSet(0);
	private Set students = new HashSet(0);
	private Set masters = new HashSet(0);
	private Set friendsForSecondaryId = new HashSet(0);
	private Set tutors = new HashSet(0);
	private Set messagesForSenderId = new HashSet(0);
	private Set notifications = new HashSet(0);
	private Set friendsForPrimaryId = new HashSet(0);

	// Constructors

	/** default constructor */
	public Person() {
	}

	/** minimal constructor */
	public Person(Long id, String firstName, String lastName, String email,
			String password) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
	}

	/** full constructor */
	public Person(Long id, String firstName, String lastName, String email,
			String password, String phone, Date birthday, String cardNumber,
			String type, Integer score, String avator, Set postings,
			Set messagesForRecipientId, Set students, Set masters,
			Set friendsForSecondaryId, Set tutors, Set messagesForSenderId,
			Set notifications, Set friendsForPrimaryId) {
		this.id = id;
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
		this.postings = postings;
		this.messagesForRecipientId = messagesForRecipientId;
		this.students = students;
		this.masters = masters;
		this.friendsForSecondaryId = friendsForSecondaryId;
		this.tutors = tutors;
		this.messagesForSenderId = messagesForSenderId;
		this.notifications = notifications;
		this.friendsForPrimaryId = friendsForPrimaryId;
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

	public Set getPostings() {
		return this.postings;
	}

	public void setPostings(Set postings) {
		this.postings = postings;
	}

	public Set getMessagesForRecipientId() {
		return this.messagesForRecipientId;
	}

	public void setMessagesForRecipientId(Set messagesForRecipientId) {
		this.messagesForRecipientId = messagesForRecipientId;
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

	public Set getFriendsForSecondaryId() {
		return this.friendsForSecondaryId;
	}

	public void setFriendsForSecondaryId(Set friendsForSecondaryId) {
		this.friendsForSecondaryId = friendsForSecondaryId;
	}

	public Set getTutors() {
		return this.tutors;
	}

	public void setTutors(Set tutors) {
		this.tutors = tutors;
	}

	public Set getMessagesForSenderId() {
		return this.messagesForSenderId;
	}

	public void setMessagesForSenderId(Set messagesForSenderId) {
		this.messagesForSenderId = messagesForSenderId;
	}

	public Set getNotifications() {
		return this.notifications;
	}

	public void setNotifications(Set notifications) {
		this.notifications = notifications;
	}

	public Set getFriendsForPrimaryId() {
		return this.friendsForPrimaryId;
	}

	public void setFriendsForPrimaryId(Set friendsForPrimaryId) {
		this.friendsForPrimaryId = friendsForPrimaryId;
	}

}