package com.tutoring.dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tutoring.entity.Student;

public class StudentDAOImpl extends HibernateDaoSupport implements StudentDAO{

	@Override
	public void addStudent(String username) {
		// TODO Auto-generated method stub
		Student stu = new Student();
		stu.setPersonUsername(username);
		stu.setBalance(null);
		stu.setGrade(null);
		stu.setStudentTimetables(null);
		stu.setPerson(null);
		this.getHibernateTemplate().save(stu);
	}

}
