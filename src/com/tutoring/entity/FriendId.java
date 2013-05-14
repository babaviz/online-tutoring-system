package com.tutoring.entity;

/**
 * FriendId entity. @author MyEclipse Persistence Tools
 */

public class FriendId implements java.io.Serializable {

	// Fields

	private Long primaryId;
	private Long secondaryId;

	// Constructors

	/** default constructor */
	public FriendId() {
	}

	/** full constructor */
	public FriendId(Long primaryId, Long secondaryId) {
		this.primaryId = primaryId;
		this.secondaryId = secondaryId;
	}

	// Property accessors

	public Long getPrimaryId() {
		return this.primaryId;
	}

	public void setPrimaryId(Long primaryId) {
		this.primaryId = primaryId;
	}

	public Long getSecondaryId() {
		return this.secondaryId;
	}

	public void setSecondaryId(Long secondaryId) {
		this.secondaryId = secondaryId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof FriendId))
			return false;
		FriendId castOther = (FriendId) other;

		return ((this.getPrimaryId() == castOther.getPrimaryId()) || (this
				.getPrimaryId() != null && castOther.getPrimaryId() != null && this
				.getPrimaryId().equals(castOther.getPrimaryId())))
				&& ((this.getSecondaryId() == castOther.getSecondaryId()) || (this
						.getSecondaryId() != null
						&& castOther.getSecondaryId() != null && this
						.getSecondaryId().equals(castOther.getSecondaryId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getPrimaryId() == null ? 0 : this.getPrimaryId().hashCode());
		result = 37
				* result
				+ (getSecondaryId() == null ? 0 : this.getSecondaryId()
						.hashCode());
		return result;
	}

}