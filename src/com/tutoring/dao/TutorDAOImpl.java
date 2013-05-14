package com.tutoring.dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tutoring.entity.Tutor;

public class TutorDAOImpl extends HibernateDaoSupport implements TutorDAO{

	@Override
	public void addTutor(String username) {
		// TODO Auto-generated method stub
		Tutor tutor = new Tutor();
		tutor.setPersonUsername(username);
		this.getHibernateTemplate().save(tutor);
	}

}
