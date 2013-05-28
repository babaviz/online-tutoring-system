package com.tutoring.entity;

/**
 * ApplicationId entity. @author MyEclipse Persistence Tools
 */

public class ApplicationId implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer courseId;
	private Integer studentId;

	// Constructors

	/** default constructor */
	public ApplicationId() {
	}

	/** full constructor */
	public ApplicationId(Integer courseId, Integer studentId) {
		this.courseId = courseId;
		this.studentId = studentId;
	}

	// Property accessors

	public Integer getCourseId() {
		return this.courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public Integer getStudentId() {
		return this.studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof ApplicationId))
			return false;
		ApplicationId castOther = (ApplicationId) other;

		return ((this.getCourseId() == castOther.getCourseId()) || (this
				.getCourseId() != null && castOther.getCourseId() != null && this
				.getCourseId().equals(castOther.getCourseId())))
				&& ((this.getStudentId() == castOther.getStudentId()) || (this
						.getStudentId() != null
						&& castOther.getStudentId() != null && this
						.getStudentId().equals(castOther.getStudentId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getCourseId() == null ? 0 : this.getCourseId().hashCode());
		result = 37 * result
				+ (getStudentId() == null ? 0 : this.getStudentId().hashCode());
		return result;
	}

}