package com.tutoring.entity;

/**
 * Application entity. @author MyEclipse Persistence Tools
 */

public class Application implements java.io.Serializable {

	// Fields

	private ApplicationId id;

	// Constructors

	/** default constructor */
	public Application() {
	}

	/** full constructor */
	public Application(ApplicationId id) {
		this.id = id;
	}

	// Property accessors

	public ApplicationId getId() {
		return this.id;
	}

	public void setId(ApplicationId id) {
		this.id = id;
	}

}