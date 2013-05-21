package com.tutoring.entity;

/**
 * FriendId entity. @author MyEclipse Persistence Tools
 */

public class FriendId implements java.io.Serializable {

	// Fields

	private User user;
	private User user_1;

	// Constructors

	/** default constructor */
	public FriendId() {
	}

	/** full constructor */
	public FriendId(User user, User user_1) {
		this.user = user;
		this.user_1 = user_1;
	}

	// Property accessors

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getUser_1() {
		return this.user_1;
	}

	public void setUser_1(User user_1) {
		this.user_1 = user_1;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof FriendId))
			return false;
		FriendId castOther = (FriendId) other;

		return ((this.getUser() == castOther.getUser()) || (this.getUser() != null
				&& castOther.getUser() != null && this.getUser().equals(
				castOther.getUser())))
				&& ((this.getUser_1() == castOther.getUser_1()) || (this
						.getUser_1() != null && castOther.getUser_1() != null && this
						.getUser_1().equals(castOther.getUser_1())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getUser() == null ? 0 : this.getUser().hashCode());
		result = 37 * result
				+ (getUser_1() == null ? 0 : this.getUser_1().hashCode());
		return result;
	}

}