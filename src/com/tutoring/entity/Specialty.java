package com.tutoring.entity;

/**
 * Specialty entity. @author MyEclipse Persistence Tools
 */

public class Specialty implements java.io.Serializable {

	// Fields

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