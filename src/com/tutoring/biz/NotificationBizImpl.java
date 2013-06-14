package com.tutoring.biz;

import java.util.List;

import com.tutoring.dao.CourseDAO;
import com.tutoring.dao.NotificationDAO;
import com.tutoring.dao.StudentDAO;
import com.tutoring.entity.Course;
import com.tutoring.entity.Notification;
import com.tutoring.entity.Student;

public class NotificationBizImpl implements NotificationBiz{

	CourseDAO courseDAO;
	StudentDAO studentDAO;
	NotificationDAO notificationDAO;
	public void setNotificationDAO(NotificationDAO notificationDAO) {
		this.notificationDAO = notificationDAO;
	}
	public void setCourseDAO(CourseDAO courseDAO) {
		this.courseDAO = courseDAO;
	}
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}
	@Override
	public void acceptApplication(int courseid, int studentid, int noticeid) {
		// TODO Auto-generated method stub
		//System.out.println("in biz:"+studentid+";"+courseid+";"+noticeid);
		Course c = courseDAO.getCourseById(courseid);
		//System.out.println("coursename:"+c.getName());
		Student stu = studentDAO.getStudentById(studentid);
		//System.out.println("stuname:"+stu.getUser().getLastName());
		c.setStudent(stu);
		c.setStatus(1);
		courseDAO.save(c);
		List<Notification> list = notificationDAO.getNotificationListByQuery("from Notification where type=1 and state=0 and id!="+noticeid);
		System.out.println("noticelistsize:"+list.size());
		for(Notification n:list){
			n.setState(1);
			notificationDAO.save(n);
		}
		notificationDAO.setNoticeStatus(notificationDAO.getNotificationById(noticeid), 1);
	}
	@Override
	public void refuseApplication(int courseid, int studentid, int noticeid) {
		// TODO Auto-generated method stub
		notificationDAO.setNoticeStatus(notificationDAO.getNotificationById(noticeid), 1);
	}
	@Override
	public void handleNotification(int id) {
		// TODO Auto-generated method stub
		notificationDAO.setNoticeStatus(notificationDAO.getNotificationById(id), 1);
	}

}
