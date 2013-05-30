package com.tutoring.dao;

import java.util.List;

import com.tutoring.entity.Course;
import com.tutoring.entity.Student;
import com.tutoring.entity.Tutor;

public interface CourseDAO {
	public List<Course> getCoursesByStudent(Student stu);
	public Tutor getTutorByCourse(Course c);
	public List<Course> getCoursesByTutor(Tutor t);
}
