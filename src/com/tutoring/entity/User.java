package com.tutoring.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer id;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private String phone;
	private Date birthday;
	private String cardNum;
	private String type;
	private Integer point;
	private String headPicSn;
	private String school;
	private String cookieSn;
	private Set answers = new HashSet(0);
	private Set friendsForIdB = new HashSet(0);
	private Set messagesForSenderId = new HashSet(0);
	private Set messagesForReceiverId = new HashSet(0);
	private Set notifications = new HashSet(0);
	private Set questions = new HashSet(0);
	private Set tutors = new HashSet(0);
	private Set students = new HashSet(0);
	private Set friendsForIdA = new HashSet(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String email, String password, String type) {
		this.email = email;
		this.password = password;
		this.type = type;
	}

	/** full constructor */
	public User(String firstName, String lastName, String email,
			String password, String phone, Date birthday, String cardNum,
			String type, Integer point, String headPicSn, String school,
			String cookieSn, Set answers, Set friendsForIdB,
			Set messagesForSenderId, Set messagesForReceiverId,
			Set notifications, Set questions, Set tutors, Set students,
			Set friendsForIdA) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.birthday = birthday;
		this.cardNum = cardNum;
		this.type = type;
		this.point = point;
		this.headPicSn = headPicSn;
		this.school = school;
		this.cookieSn = cookieSn;
		this.answers = answers;
		this.friendsForIdB = friendsForIdB;
		this.messagesForSenderId = messagesForSenderId;
		this.messagesForReceiverId = messagesForReceiverId;
		this.notifications = notifications;
		this.questions = questions;
		this.tutors = tutors;
		this.students = students;
		this.friendsForIdA = friendsForIdA;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
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

	public String getCardNum() {
		return this.cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getPoint() {
		return this.point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public String getHeadPicSn() {
		return this.headPicSn;
	}

	public void setHeadPicSn(String headPicSn) {
		this.headPicSn = headPicSn;
	}

	public String getSchool() {
		return this.school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getCookieSn() {
		return this.cookieSn;
	}

	public void setCookieSn(String cookieSn) {
		this.cookieSn = cookieSn;
	}

	public Set getAnswers() {
		return this.answers;
	}

	public void setAnswers(Set answers) {
		this.answers = answers;
	}

	public Set getFriendsForIdB() {
		return this.friendsForIdB;
	}

	public void setFriendsForIdB(Set friendsForIdB) {
		this.friendsForIdB = friendsForIdB;
	}

	public Set getMessagesForSenderId() {
		return this.messagesForSenderId;
	}

	public void setMessagesForSenderId(Set messagesForSenderId) {
		this.messagesForSenderId = messagesForSenderId;
	}

	public Set getMessagesForReceiverId() {
		return this.messagesForReceiverId;
	}

	public void setMessagesForReceiverId(Set messagesForReceiverId) {
		this.messagesForReceiverId = messagesForReceiverId;
	}

	public Set getNotifications() {
		return this.notifications;
	}

	public void setNotifications(Set notifications) {
		this.notifications = notifications;
	}

	public Set getQuestions() {
		return this.questions;
	}

	public void setQuestions(Set questions) {
		this.questions = questions;
	}

	public Set getTutors() {
		return this.tutors;
	}

	public void setTutors(Set tutors) {
		this.tutors = tutors;
	}

	public Set getStudents() {
		return this.students;
	}

	public void setStudents(Set students) {
		this.students = students;
	}

	public Set getFriendsForIdA() {
		return this.friendsForIdA;
	}

	public void setFriendsForIdA(Set friendsForIdA) {
		this.friendsForIdA = friendsForIdA;
	}

}