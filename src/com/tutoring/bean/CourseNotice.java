package com.tutoring.bean;

import com.tutoring.entity.Course;
import com.tutoring.entity.Student;

public class CourseNotice {
	private Student stu;
	private Course course;
	private int status;
	private int noticeid;
	public Student getStu() {
		return stu;
	}
	public void setStu(Student stu) {
		this.stu = stu;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getNoticeid() {
		return noticeid;
	}
	public void setNoticeid(int noticeid) {
		this.noticeid = noticeid;
	}
	
}
