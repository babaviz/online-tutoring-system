package com.tutoring.biz;

import com.tutoring.entity.Tutor;

public interface TutorBiz {
	public Tutor getTutor(int id);
	public float getEvalAvgByTutorId(int id);
}
