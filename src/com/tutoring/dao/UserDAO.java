package com.tutoring.dao;


import com.tutoring.entity.Person;

public interface UserDAO {
	public String  getPasswordByEmail(String email);
	public void addPerson(String email, String password);
	public Person getPersonByEmail(String email);
	public void deletePerson(String email);
}
