package com.tutoring.entity;

/**
 * Application entity. @author MyEclipse Persistence Tools
 */

public class Application extends AbstractModel {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
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