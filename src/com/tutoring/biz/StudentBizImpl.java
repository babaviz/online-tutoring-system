package com.tutoring.biz;


import com.tutoring.dao.CourseDAO;
import com.tutoring.dao.NotificationDAO;
import com.tutoring.dao.StudentDAO;
import com.tutoring.dao.UserDAO;
import com.tutoring.entity.Course;
import com.tutoring.entity.Student;
import com.tutoring.entity.User;

public class StudentBizImpl implements StudentBiz{

	CourseDAO courseDAO;
	UserDAO userDAO;
	NotificationDAO notificationDAO;
	StudentDAO studentDAO;
	
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}


	public void setNotificationDAO(NotificationDAO notificationDAO) {
		this.notificationDAO = notificationDAO;
	}


	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}


	public void setCourseDAO(CourseDAO courseDAO) {
		this.courseDAO = courseDAO;
	}


	@Override
	public void addApplyCourse(User user, User recieveuser, int courseid) {
		// TODO Auto-generated method stub
		Course course = courseDAO.getCourseById(courseid);
		user.getStudent().getApplications().add(course);
		userDAO.save(user);
		notificationDAO.addNotice(course.getId(), 1, recieveuser,user);
	}


	@Override
	public Student getStudentById(int id) {
		// TODO Auto-generated method stub
		return studentDAO.getStudentById(id);
	}
	
}
