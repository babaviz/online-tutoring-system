package com.tutoring.biz;

import com.tutoring.dao.TutorDAO;
import com.tutoring.entity.Tutor;

public class TutorBizImpl implements TutorBiz{

	TutorDAO tutorDAO;
	public void setTutorDAO(TutorDAO tutorDAO) {
		this.tutorDAO = tutorDAO;
	}
	@Override
	public Tutor getTutor(int id) {
		// TODO Auto-generated method stub
		return tutorDAO.getTutorById(id);
	}

}
