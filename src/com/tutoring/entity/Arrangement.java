package com.tutoring.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Arrangement entity. @author MyEclipse Persistence Tools
 */

public class Arrangement implements java.io.Serializable {

	// Fields

	private Long id;
	private Course course;
	private String tutorUsername;
	private Integer score;
	private Set timetables = new HashSet(0);

	// Constructors

	/** default constructor */
	public Arrangement() {
	}

	/** minimal constructor */
	public Arrangement(Course course, String tutorUsername) {
		this.course = course;
		this.tutorUsername = tutorUsername;
	}

	/** full constructor */
	public Arrangement(Course course, String tutorUsername, Integer score,
			Set timetables) {
		this.course = course;
		this.tutorUsername = tutorUsername;
		this.score = score;
		this.timetables = timetables;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Course getCourse() {
		return this.course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public String getTutorUsername() {
		return this.tutorUsername;
	}

	public void setTutorUsername(String tutorUsername) {
		this.tutorUsername = tutorUsername;
	}

	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Set getTimetables() {
		return this.timetables;
	}

	public void setTimetables(Set timetables) {
		this.timetables = timetables;
	}

}