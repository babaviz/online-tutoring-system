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
	private Tutor tutor;
	private Integer score;
	private Set timetables = new HashSet(0);

	// Constructors

	/** default constructor */
	public Arrangement() {
	}

	/** minimal constructor */
	public Arrangement(Long id, Course course, Tutor tutor) {
		this.id = id;
		this.course = course;
		this.tutor = tutor;
	}

	/** full constructor */
	public Arrangement(Long id, Course course, Tutor tutor, Integer score,
			Set timetables) {
		this.id = id;
		this.course = course;
		this.tutor = tutor;
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

	public Tutor getTutor() {
		return this.tutor;
	}

	public void setTutor(Tutor tutor) {
		this.tutor = tutor;
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