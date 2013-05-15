package com.tutoring.entity;

/**
 * FriendId entity. @author MyEclipse Persistence Tools
 */

public class FriendId implements java.io.Serializable {

	// Fields

	private Person person;
	private Person person_1;

	// Constructors

	/** default constructor */
	public FriendId() {
	}

	/** full constructor */
	public FriendId(Person person, Person person_1) {
		this.person = person;
		this.person_1 = person_1;
	}

	// Property accessors

	public Person getPerson() {
		return this.person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public Person getPerson_1() {
		return this.person_1;
	}

	public void setPerson_1(Person person_1) {
		this.person_1 = person_1;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof FriendId))
			return false;
		FriendId castOther = (FriendId) other;

		return ((this.getPerson() == castOther.getPerson()) || (this
				.getPerson() != null && castOther.getPerson() != null && this
				.getPerson().equals(castOther.getPerson())))
				&& ((this.getPerson_1() == castOther.getPerson_1()) || (this
						.getPerson_1() != null
						&& castOther.getPerson_1() != null && this
						.getPerson_1().equals(castOther.getPerson_1())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getPerson() == null ? 0 : this.getPerson().hashCode());
		result = 37 * result
				+ (getPerson_1() == null ? 0 : this.getPerson_1().hashCode());
		return result;
	}

}