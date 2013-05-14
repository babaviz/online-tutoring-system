package com.tutoring.entity;

import java.util.Date;

/**
 * Timetable entity. @author MyEclipse Persistence Tools
 */

public class Timetable implements java.io.Serializable {

	// Fields

	private Long id;
	private Long arrangementId;
	private Date startTime;
	private Date endTime;

	// Constructors

	/** default constructor */
	public Timetable() {
	}

	/** minimal constructor */
	public Timetable(Long arrangementId) {
		this.arrangementId = arrangementId;
	}

	/** full constructor */
	public Timetable(Long arrangementId, Date startTime, Date endTime) {
		this.arrangementId = arrangementId;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getArrangementId() {
		return this.arrangementId;
	}

	public void setArrangementId(Long arrangementId) {
		this.arrangementId = arrangementId;
	}

	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

}