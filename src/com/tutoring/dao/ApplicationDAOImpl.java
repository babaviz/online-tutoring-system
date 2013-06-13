package com.tutoring.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tutoring.entity.Application;

public class ApplicationDAOImpl extends HibernateDaoSupport implements ApplicationDAO{

	

	@Override
	public List<Integer> getStudentIdByApplicationId(int id) {
		// TODO Auto-generated method stub
		List<?> list = this.getHibernateTemplate().find("from Application where course_id = "+id);
		
		List<Integer> returnlist = new ArrayList<Integer>();
		
		for(int i =0;i<list.size();i++){
			Application application = (Application )list.get(i);
			returnlist.add(application.getId().getStudentId());
		}
		return returnlist;
		
	}

}
