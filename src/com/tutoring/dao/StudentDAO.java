package com.tutoring.dao;

import com.tutoring.entity.Student;
import com.tutoring.entity.User;

public interface StudentDAO {
	public void addStudent(User u);
	public Student getStudentByUser(User u);
	public Student getStudentById(int id);
}
