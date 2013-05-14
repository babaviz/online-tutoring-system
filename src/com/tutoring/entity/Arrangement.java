package com.tutoring.entity;

/**
 * Arrangement entity. @author MyEclipse Persistence Tools
 */

public class Arrangement implements java.io.Serializable {

	// Fields

	private Long id;
	private Long tutorId;
	private Long courseId;
	private Integer score;

	// Constructors

	/** default constructor */
	public Arrangement() {
	}

	/** minimal constructor */
	public Arrangement(Long tutorId, Long courseId) {
		this.tutorId = tutorId;
		this.courseId = courseId;
	}

	/** full constructor */
	public Arrangement(Long tutorId, Long courseId, Integer score) {
		this.tutorId = tutorId;
		this.courseId = courseId;
		this.score = score;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getTutorId() {
		return this.tutorId;
	}

	public void setTutorId(Long tutorId) {
		this.tutorId = tutorId;
	}

	public Long getCourseId() {
		return this.courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

}