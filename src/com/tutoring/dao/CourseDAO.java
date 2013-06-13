package com.tutoring.dao;

import java.util.ArrayList;
import java.util.List;

import com.tutoring.bean.SearchFactors;
import com.tutoring.bean.SearchResult;
import com.tutoring.entity.Course;
import com.tutoring.entity.Student;
import com.tutoring.entity.Tutor;
import com.tutoring.entity.User;

public interface CourseDAO {
	public List<Course> getCoursesByStudent(Student stu);
	public List<Course> getCoursesByUser(User user);
	public Tutor getTutorByCourse(Course c);
	public List<Course> getCoursesByTutor(Tutor t);
	public ArrayList<SearchResult> searchCourses(SearchFactors factors);
	public Course getCourseById(int id);
	public int getApplyNumberOfCourse(Course c);
	public void deleteCourse(Course c);
	public List<Course> getOrderedCoursesByTutorId(int id);
	public void save(Course c);
}
