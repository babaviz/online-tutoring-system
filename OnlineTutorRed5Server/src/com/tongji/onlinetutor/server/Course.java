package com.tongji.onlinetutor.server;

import java.sql.Date;
import java.util.ArrayList;

public class Course {
	private User teacher;
	private User student;
	public String teacher_name;
	public String student_name;
	private String courseID;
	private Date startTime;
	private Date endTime;
	private boolean available;
	private boolean finished;
	
	public Course(String id, Date startTime, Date endTime) {
		this.courseID = id;
		this.startTime = startTime;
		this.endTime = endTime;
		this.available = false;
		this.finished = false;
		this.teacher = null;
		this.student = null;
	}
	
	/**
	 * 
	 * @param usertype
	 * @param user
	 * @return false if student or teacher is already in class
	 * @return true if student or teacher come for the first time
	 */
	public boolean UserInClass(User user){
		if(user.getType()){	//	true means this is a teacher who came
			if(this.teacher != null || !this.teacher.isDummy())
				return false;
			this.teacher = user;
		}
		else{
			if(this.student != null || !this.student.isDummy())
				return false;
			this.student = user;
		}
		setUserOnlineStatus(user.getType(), true);
		return true;
	}
	
	public void setUserOnlineStatus(boolean usertype, boolean status){
		if(usertype)
			this.teacher.setIsOnline(status);
		else
			this.student.setIsOnline(status);
	}
	
	public String getStudentPublishID(){
		try{
			return student.name()+courseID+teacher.name();
		}catch(NullPointerException e){
			e.printStackTrace();
		}
		return null;
	}
	
	public String getTeacherPublishID(){
		try{
			return teacher.name()+courseID+student.name();
		}catch(NullPointerException e){
			e.printStackTrace();
		}
		return null;
	}
	
	public void setAvailable(boolean a){
		this.available = a;
	}
	public void setFinished(boolean f){
		this.finished = f;
	}
	public boolean isAvailable(){
		return available;
	}
	public boolean isFinished(){
		return finished;
	}
	public String getCourseID(){
		return courseID;
	}
	public Date getStartTime(){
		return startTime;
	}
	public Date getEndTime(){
		return endTime;
	}
	public boolean isReady(){
		return teacher.isOnline()&&student.isOnline();
	}
	public String getTeacherName(){
		try{
			return teacher.name();
		}catch(NullPointerException e){
			e.printStackTrace();
			System.out.println("teacher in course is null");
		}
		return null;
	}
	public String getStudentName(){
		try{
			return student.name();
		}catch(NullPointerException e){
			e.printStackTrace();
			System.out.println("student in course is null");
		}
		return null;
	}
	
	public ArrayList<User> getPair(){
		ArrayList<User> arr = new ArrayList<User>();
		arr.add(student);
		arr.add(teacher);
		return arr;
	}
	
	@Override
	public boolean equals(Object obj) {
		return this.courseID == ((Course)obj).courseID;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return Integer.valueOf(this.courseID);
	}
}
