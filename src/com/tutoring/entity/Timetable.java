package com.tutoring.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Timetable entity. @author MyEclipse Persistence Tools
 */

public class Timetable implements java.io.Serializable {

	// Fields

	private Long id;
	private Arrangement arrangement;
	private Date startTime;
	private Date endTime;
	private Set studentTimetables = new HashSet(0);
	private Set applications = new HashSet(0);

	// Constructors

	/** default constructor */
	public Timetable() {
	}

	/** minimal constructor */
	public Timetable(Long id, Arrangement arrangement) {
		this.id = id;
		this.arrangement = arrangement;
	}

	/** full constructor */
	public Timetable(Long id, Arrangement arrangement, Date startTime,
			Date endTime, Set studentTimetables, Set applications) {
		this.id = id;
		this.arrangement = arrangement;
		this.startTime = startTime;
		this.endTime = endTime;
		this.studentTimetables = studentTimetables;
		this.applications = applications;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Arrangement getArrangement() {
		return this.arrangement;
	}

	public void setArrangement(Arrangement arrangement) {
		this.arrangement = arrangement;
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

	public Set getStudentTimetables() {
		return this.studentTimetables;
	}

	public void setStudentTimetables(Set studentTimetables) {
		this.studentTimetables = studentTimetables;
	}

	public Set getApplications() {
		return this.applications;
	}

	public void setApplications(Set applications) {
		this.applications = applications;
	}

}