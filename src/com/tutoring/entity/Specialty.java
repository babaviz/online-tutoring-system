package com.tutoring.entity;

/**
 * Specialty entity. @author MyEclipse Persistence Tools
 */

public class Specialty extends AbstractModel {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private SpecialtyId id;

	// Constructors

	/** default constructor */
	public Specialty() {
	}

	/** full constructor */
	public Specialty(SpecialtyId id) {
		this.id = id;
	}

	// Property accessors

	public SpecialtyId getId() {
		return this.id;
	}

	public void setId(SpecialtyId id) {
		this.id = id;
	}

}