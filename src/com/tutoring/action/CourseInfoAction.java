package com.tutoring.action;

import java.sql.Timestamp;
import java.util.Date;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.biz.CourseBiz;
import com.tutoring.biz.TutorBiz;
import com.tutoring.entity.Course;
import com.tutoring.entity.Tutor;

public class CourseInfoAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	public CourseBiz courseBiz;
	public TutorBiz tutorBiz;
	public void setTutorBiz(TutorBiz tutorBiz) {
		this.tutorBiz = tutorBiz;
	}
	public void setCourseBiz(CourseBiz courseBiz) {
		this.courseBiz = courseBiz;
	}
	private int courseid;
	private Timestamp time;
	public String execute() throws Exception{
		setTime(new Timestamp((new Date()).getTime()));
		ActionContext ac = ActionContext.getContext();
		Course course=courseBiz.getCourseById(courseid);
		Tutor tutor=course.getTutor();
		ac.put("course", course);
		ac.put("course_name", course.getName());
		ac.put("tutor_name", tutor.getUser().getLastName()+tutor.getUser().getFirstName());
		ac.put("tutor_user_id", tutor.getUser().getId()+"");
		ac.put("course_description", course.getDescription());
		ac.put("tutor_description", tutor.getDescription());
		ac.put("tutor_eval", tutorBiz.getEvalAvgByTutorId(tutor.getId())+"");
		return SUCCESS;
	}
	public int getCourseid() {
		return courseid;
	}
	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
}
