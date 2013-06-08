package com.tongji.onlinetutor.server;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.red5.server.api.IConnection;
import org.red5.server.api.scope.IScope;

public class CourseManager {
	private HashMap<String, Course> courseMap;
	private Database db;
	
	public CourseManager() {
		db = new Database();
		courseMap = new HashMap<String,Course>();
	}
	
	public void startBackgroundTask(){
		
	}
	
	public void addCourse(String id){
		if(courseMap.containsKey(id))
			return;
		ResultSet rs = db.executeQueryA("select stu.first_name, stu.last_name, tea.first_name, tea.last_name"+
										 "course.start_time, course.end_time"+
										 "from user as stu, user as tea, course, tutor, student"+
										 "where course.flash_sn=" + id +
										 "and stu.id=student.user_id and tea.id=tutor.user_id"+
									  	"and course.student_id=student.id and course.tutor_id=tutor.id;");
		try{
			String student_name = rs.getString(0) + rs.getString(1);
			String teacher_name = rs.getString(2) + rs.getString(3);
			Course course = new Course(id, rs.getDate(4), rs.getDate(5));
			//TODO do something here if there is any time constraint 
			course.setAvailable(true);
			courseMap.put(id, course);
			
			User student = new User(student_name, User.Type.STUDENT);
			User teacher = new User(teacher_name, User.Type.TEACHER);
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public void takeCourse(String courseID, String username, boolean usertype, IConnection conn, IScope scope){
		//TODO date?time?
		User user = new User(username,usertype,conn,scope);
		courseMap.get(courseID).UserInClass(user);
	}
	
	public void leaveClass(String courseID, boolean usertype, String username){
		courseMap.get(courseID).setUserOnlineStatus(usertype, false);
	}
	
	public String getPublishID(String courseID, boolean type){
		if(type)
			return courseMap.get(courseID).getTeacherPublishID();
		else
			return courseMap.get(courseID).getStudentPublishID();
	}
	public String getPlayID(String courseID, boolean type){
		if(type)
			return courseMap.get(courseID).getStudentPublishID();
		else
			return courseMap.get(courseID).getTeacherPublishID();
	}
	
	public boolean isCourseReady(String courseID){
		return courseMap.get(courseID).isReady();
	}
	
	public void CloseCourse(String courseID){
		courseMap.get(courseID).setFinished(true);
	}
	
	public ArrayList<User> getCoursePair(String courseID){
		return courseMap.get(courseID).getPair();
	}
}
