package com.tutoring.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tutoring.entity.Course;
import com.tutoring.entity.Student;
import com.tutoring.entity.Tutor;

public class CourseDAOImpl extends HibernateDaoSupport implements CourseDAO{

	@Override
	public List<Course> getCoursesByStudent(Student stu) {
		// TODO Auto-generated method stub
		List<Course> list = new ArrayList<Course>();
		list.addAll(stu.getCourses());
		return list;
	}

	@Override
	public Tutor getTutorByCourse(Course c) {
		// TODO Auto-generated method stub
		return c.getTutor();
	}

	@Override
	public List<Course> getCoursesByTutor(Tutor t) {
		// TODO Auto-generated method stub
		List<Course> list = new ArrayList<Course>();
		list.addAll(t.getCourses());
		return list;
	}

	@Override
	public Course getCourseById(int id) {
		// TODO Auto-generated method stub
		List<?> list = this.getHibernateTemplate().find("from Course where id = "+id);
		if(list.size()>0)
		{
			Course course = (Course) list.get(0);
			return course;
		}
		else
			return null;
	}

}
