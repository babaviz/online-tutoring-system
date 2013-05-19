package com.tutoring.entity;

/**
 * ApplicationId entity. @author MyEclipse Persistence Tools
 */

public class ApplicationId implements java.io.Serializable {

	// Fields

	private Student student;
	private Timetable timetable;

	// Constructors

	/** default constructor */
	public ApplicationId() {
	}

	/** full constructor */
	public ApplicationId(Student student, Timetable timetable) {
		this.student = student;
		this.timetable = timetable;
	}

	// Property accessors

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

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof ApplicationId))
			return false;
		ApplicationId castOther = (ApplicationId) other;

		return ((this.getStudent() == castOther.getStudent()) || (this
				.getStudent() != null && castOther.getStudent() != null && this
				.getStudent().equals(castOther.getStudent())))
				&& ((this.getTimetable() == castOther.getTimetable()) || (this
						.getTimetable() != null
						&& castOther.getTimetable() != null && this
						.getTimetable().equals(castOther.getTimetable())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getStudent() == null ? 0 : this.getStudent().hashCode());
		result = 37 * result
				+ (getTimetable() == null ? 0 : this.getTimetable().hashCode());
		return result;
	}

}