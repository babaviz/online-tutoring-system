package com.tutoring.dao;

import com.tutoring.entity.Tutor;

public interface TutorDAO {
	public Tutor getTutorById(int id);
	public float getEvalAvgByTutorId(int id);
	public void save (Tutor t);
}
