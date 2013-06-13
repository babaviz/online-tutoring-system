package com.tutoring.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tutoring.entity.Student;
import com.tutoring.entity.User;

public class StudentDAOImpl extends HibernateDaoSupport implements StudentDAO{

	@Override
	public void addStudent(User u) {
		// TODO Auto-generated method stub
		Student stu = new Student();
		stu.setUser(u);
		this.getHibernateTemplate().merge(stu);
	}

	@Override
	public Student getStudentByUser(User u) {
		// TODO Auto-generated method stub
		return u.getStudent();
	}

	@Override
	public Student getStudentById(int id) {
		// TODO Auto-generated method stub
		List<?> stulist = this.getHibernateTemplate().find("from Student where id = "+id);
		if(stulist.size()>0)
		{
			Student stu = (Student)stulist.get(0);
			return stu;
		}
		else
			return null;
	}

}
