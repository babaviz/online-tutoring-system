package com.tutoring.entity;

/**
 * SpecialtyId entity. @author MyEclipse Persistence Tools
 */

public class SpecialtyId implements java.io.Serializable {

	// Fields

	private Tutor tutor;
	private Subject subject;

	// Constructors

	/** default constructor */
	public SpecialtyId() {
	}

	/** full constructor */
	public SpecialtyId(Tutor tutor, Subject subject) {
		this.tutor = tutor;
		this.subject = subject;
	}

	// Property accessors

	public Tutor getTutor() {
		return this.tutor;
	}

	public void setTutor(Tutor tutor) {
		this.tutor = tutor;
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

		return ((this.getTutor() == castOther.getTutor()) || (this.getTutor() != null
				&& castOther.getTutor() != null && this.getTutor().equals(
				castOther.getTutor())))
				&& ((this.getSubject() == castOther.getSubject()) || (this
						.getSubject() != null && castOther.getSubject() != null && this
						.getSubject().equals(castOther.getSubject())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getTutor() == null ? 0 : this.getTutor().hashCode());
		result = 37 * result
				+ (getSubject() == null ? 0 : this.getSubject().hashCode());
		return result;
	}

}