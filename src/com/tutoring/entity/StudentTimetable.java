package com.tutoring.entity;

/**
 * StudentTimetable entity. @author MyEclipse Persistence Tools
 */

public class StudentTimetable implements java.io.Serializable {

	// Fields

	private Long id;
	private Student student;
	private Timetable timetable;
	private Integer score;
	private String remark;

	// Constructors

	/** default constructor */
	public StudentTimetable() {
	}

	/** minimal constructor */
	public StudentTimetable(Long id, Student student, Timetable timetable) {
		this.id = id;
		this.student = student;
		this.timetable = timetable;
	}

	/** full constructor */
	public StudentTimetable(Long id, Student student, Timetable timetable,
			Integer score, String remark) {
		this.id = id;
		this.student = student;
		this.timetable = timetable;
		this.score = score;
		this.remark = remark;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Timetable getTimetable() {
		return this.timetable;
	}

	public void setTimetable(Timetable timetable) {
		this.timetable = timetable;
	}

	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}