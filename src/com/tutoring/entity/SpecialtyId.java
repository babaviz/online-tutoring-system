package com.tutoring.entity;

/**
 * SpecialtyId entity. @author MyEclipse Persistence Tools
 */

public class SpecialtyId implements java.io.Serializable {

	// Fields

	private String tutorUsername;
	private Subject subject;

	// Constructors

	/** default constructor */
	public SpecialtyId() {
	}

	/** full constructor */
	public SpecialtyId(String tutorUsername, Subject subject) {
		this.tutorUsername = tutorUsername;
		this.subject = subject;
	}

	// Property accessors

	public String getTutorUsername() {
		return this.tutorUsername;
	}

	public void setTutorUsername(String tutorUsername) {
		this.tutorUsername = tutorUsername;
	}

	public Subject getSubject() {
		return this.subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof SpecialtyId))
			return false;
		SpecialtyId castOther = (SpecialtyId) other;

		return ((this.getTutorUsername() == castOther.getTutorUsername()) || (this
				.getTutorUsername() != null
				&& castOther.getTutorUsername() != null && this
				.getTutorUsername().equals(castOther.getTutorUsername())))
				&& ((this.getSubject() == castOther.getSubject()) || (this
						.getSubject() != null && castOther.getSubject() != null && this
						.getSubject().equals(castOther.getSubject())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getTutorUsername() == null ? 0 : this.getTutorUsername()
						.hashCode());
		result = 37 * result
				+ (getSubject() == null ? 0 : this.getSubject().hashCode());
		return result;
	}

}