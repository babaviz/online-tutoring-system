package com.tutoring.entity;

/**
 * FriendId entity. @author MyEclipse Persistence Tools
 */

public class FriendId implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer idA;
	private Integer idB;

	// Constructors

	/** default constructor */
	public FriendId() {
	}

	/** full constructor */
	public FriendId(Integer idA, Integer idB) {
		this.idA = idA;
		this.idB = idB;
	}

	// Property accessors

	public Integer getIdA() {
		return this.idA;
	}

	public void setIdA(Integer idA) {
		this.idA = idA;
	}

	public Integer getIdB() {
		return this.idB;
	}

	public void setIdB(Integer idB) {
		this.idB = idB;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof FriendId))
			return false;
		FriendId castOther = (FriendId) other;

		return ((this.getIdA() == castOther.getIdA()) || (this.getIdA() != null
				&& castOther.getIdA() != null && this.getIdA().equals(
				castOther.getIdA())))
				&& ((this.getIdB() == castOther.getIdB()) || (this.getIdB() != null
						&& castOther.getIdB() != null && this.getIdB().equals(
						castOther.getIdB())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getIdA() == null ? 0 : this.getIdA().hashCode());
		result = 37 * result
				+ (getIdB() == null ? 0 : this.getIdB().hashCode());
		return result;
	}

}