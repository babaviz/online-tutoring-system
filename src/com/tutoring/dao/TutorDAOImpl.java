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

	@Override
	public void save(Tutor t) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(t);
	}

	@Override
	public float getEvalAvgByTutorId(int id) {
		// TODO Auto-generated method stub
		List<?> eval = this.getHibernateTemplate().find("select AVG(ebsa+ebsb+ebsc) from Course where tutor="+id);
		if(eval.size()!=0)
			return ((Double) eval.get(0)).floatValue();
		return 0;
	}
}
