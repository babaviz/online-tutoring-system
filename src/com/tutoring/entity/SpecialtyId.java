package com.tutoring.entity;

/**
 * SpecialtyId entity. @author MyEclipse Persistence Tools
 */

public class SpecialtyId implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer tutorId;
	private Integer subjectId;

	// Constructors

	/** default constructor */
	public SpecialtyId() {
	}

	/** full constructor */
	public SpecialtyId(Integer tutorId, Integer subjectId) {
		this.tutorId = tutorId;
		this.subjectId = subjectId;
	}

	// Property accessors

	public Integer getTutorId() {
		return this.tutorId;
	}

	public void setTutorId(Integer tutorId) {
		this.tutorId = tutorId;
	}

	public Integer getSubjectId() {
		return this.subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof SpecialtyId))
			return false;
		SpecialtyId castOther = (SpecialtyId) other;

		return ((this.getTutorId() == castOther.getTutorId()) || (this
				.getTutorId() != null && castOther.getTutorId() != null && this
				.getTutorId().equals(castOther.getTutorId())))
				&& ((this.getSubjectId() == castOther.getSubjectId()) || (this
						.getSubjectId() != null
						&& castOther.getSubjectId() != null && this
						.getSubjectId().equals(castOther.getSubjectId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getTutorId() == null ? 0 : this.getTutorId().hashCode());
		result = 37 * result
				+ (getSubjectId() == null ? 0 : this.getSubjectId().hashCode());
		return result;
	}

}