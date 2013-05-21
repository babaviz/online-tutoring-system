package com.tutoring.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Course entity. @author MyEclipse Persistence Tools
 */

public class Course implements java.io.Serializable {

	// Fields

	private Integer id;
	private Tutor tutor;
	private Student student;
	private Subject subject;
	private Timestamp startTime;
	private Timestamp endTime;
	private Integer duration;
	private Integer price;
	private String name;
	private String description;
	private Integer evalByTutorA;
	private Integer evalByTutorB;
	private Integer evalByTutorC;
	private Integer evalByStuA;
	private Integer evalByStuB;
	private Integer evalByStuC;
	private String evaluation;
	private Set applications = new HashSet(0);

	// Constructors

	/** default constructor */
	public Course() {
	}

	/** minimal constructor */
	public Course(Tutor tutor, Subject subject, Timestamp startTime,
			Timestamp endTime, Integer duration, Integer price, String name,
			String description, Integer evalByTutorA, Integer evalByTutorB,
			Integer evalByTutorC, Integer evalByStuA, Integer evalByStuB,
			Integer evalByStuC) {
		this.tutor = tutor;
		this.subject = subject;
		this.startTime = startTime;
		this.endTime = endTime;
		this.duration = duration;
		this.price = price;
		this.name = name;
		this.description = description;
		this.evalByTutorA = evalByTutorA;
		this.evalByTutorB = evalByTutorB;
		this.evalByTutorC = evalByTutorC;
		this.evalByStuA = evalByStuA;
		this.evalByStuB = evalByStuB;
		this.evalByStuC = evalByStuC;
	}

	/** full constructor */
	public Course(Tutor tutor, Student student, Subject subject,
			Timestamp startTime, Timestamp endTime, Integer duration,
			Integer price, String name, String description,
			Integer evalByTutorA, Integer evalByTutorB, Integer evalByTutorC,
			Integer evalByStuA, Integer evalByStuB, Integer evalByStuC,
			String evaluation, Set applications) {
		this.tutor = tutor;
		this.student = student;
		this.subject = subject;
		this.startTime = startTime;
		this.endTime = endTime;
		this.duration = duration;
		this.price = price;
		this.name = name;
		this.description = description;
		this.evalByTutorA = evalByTutorA;
		this.evalByTutorB = evalByTutorB;
		this.evalByTutorC = evalByTutorC;
		this.evalByStuA = evalByStuA;
		this.evalByStuB = evalByStuB;
		this.evalByStuC = evalByStuC;
		this.evaluation = evaluation;
		this.applications = applications;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Tutor getTutor() {
		return this.tutor;
	}

	public void setTutor(Tutor tutor) {
		this.tutor = tutor;
	}

	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Subject getSubject() {
		return this.subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public Timestamp getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	public Timestamp getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	public Integer getDuration() {
		return this.duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public Integer getPrice() {
		return this.price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getEvalByTutorA() {
		return this.evalByTutorA;
	}

	public void setEvalByTutorA(Integer evalByTutorA) {
		this.evalByTutorA = evalByTutorA;
	}

	public Integer getEvalByTutorB() {
		return this.evalByTutorB;
	}

	public void setEvalByTutorB(Integer evalByTutorB) {
		this.evalByTutorB = evalByTutorB;
	}

	public Integer getEvalByTutorC() {
		return this.evalByTutorC;
	}

	public void setEvalByTutorC(Integer evalByTutorC) {
		this.evalByTutorC = evalByTutorC;
	}

	public Integer getEvalByStuA() {
		return this.evalByStuA;
	}

	public void setEvalByStuA(Integer evalByStuA) {
		this.evalByStuA = evalByStuA;
	}

	public Integer getEvalByStuB() {
		return this.evalByStuB;
	}

	public void setEvalByStuB(Integer evalByStuB) {
		this.evalByStuB = evalByStuB;
	}

	public Integer getEvalByStuC() {
		return this.evalByStuC;
	}

	public void setEvalByStuC(Integer evalByStuC) {
		this.evalByStuC = evalByStuC;
	}

	public String getEvaluation() {
		return this.evaluation;
	}

	public void setEvaluation(String evaluation) {
		this.evaluation = evaluation;
	}

	public Set getApplications() {
		return this.applications;
	}

	public void setApplications(Set applications) {
		this.applications = applications;
	}

}