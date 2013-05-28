package com.tutoring.entity;

/**
 * Friend entity. @author MyEclipse Persistence Tools
 */

public class Friend extends AbstractModel {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private FriendId id;

	// Constructors

	/** default constructor */
	public Friend() {
	}

	/** full constructor */
	public Friend(FriendId id) {
		this.id = id;
	}

	// Property accessors

	public FriendId getId() {
		return this.id;
	}

	public void setId(FriendId id) {
		this.id = id;
	}

}