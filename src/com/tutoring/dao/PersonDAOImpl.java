package com.tutoring.dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tutoring.entity.Person;

public class PersonDAOImpl extends HibernateDaoSupport implements PersonDAO{

	@Override
	public void addPerson(String username, String email) {
		// TODO Auto-generated method stub
		Person person = new Person();
		person.setUsername(username);
		person.setEmail(email);
		
		this.getHibernateTemplate().save(person);
	}

}
