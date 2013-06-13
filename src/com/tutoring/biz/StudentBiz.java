package com.tutoring.biz;

import com.tutoring.entity.Student;
import com.tutoring.entity.User;

public interface StudentBiz {
	public void addApplyCourse(User user,User recieveuser,int courseid);
	public Student getStudentById(int id);
}
