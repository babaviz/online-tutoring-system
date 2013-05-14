package com.tutoring.entity;

/**
 * StudentTimetable entity. @author MyEclipse Persistence Tools
 */

public class StudentTimetable implements java.io.Serializable {

	// Fields

	private Long id;
	private Long studentId;
	private Long timetableId;
	private Integer score;
	private String remark;

	// Constructors

	/** default constructor */
	public StudentTimetable() {
	}

	/** minimal constructor */
	public StudentTimetable(Long studentId, Long timetableId) {
		this.studentId = studentId;
		this.timetableId = timetableId;
	}

	/** full constructor */
	public StudentTimetable(Long studentId, Long timetableId, Integer score,
			String remark) {
		this.studentId = studentId;
		this.timetableId = timetableId;
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

	public Long getStudentId() {
		return this.studentId;
	}

	public void setStudentId(Long studentId) {
		this.studentId = studentId;
	}

	public Long getTimetableId() {
		return this.timetableId;
	}

	public void setTimetableId(Long timetableId) {
		this.timetableId = timetableId;
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