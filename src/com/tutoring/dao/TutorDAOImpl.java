package com.tutoring.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tutoring.entity.Tutor;

public class TutorDAOImpl extends HibernateDaoSupport implements TutorDAO{

	@Override
	public Tutor getTutorById(int id) {
		// TODO Auto-generated method stub
		List<?> tutorList = this.getHibernateTemplate().find("from Tutor where id = "+id);
		if(tutorList.size()>0)
		{
			Tutor t = (Tutor) tutorList.get(0);
			return t;
		}
		else
			return null;
	}

}
