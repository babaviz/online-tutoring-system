package com.tutoring.biz;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.tutoring.bean.SearchFactors;
import com.tutoring.bean.SearchResult;
import com.tutoring.dao.CourseDAO;
import com.tutoring.dao.StudentDAO;
import com.tutoring.dao.UserDAO;
import com.tutoring.entity.Course;
import com.tutoring.entity.Student;
import com.tutoring.entity.Tutor;
import com.tutoring.entity.User;

public class CourseBizImpl implements CourseBiz{

	UserDAO userDAO;
	StudentDAO studentDAO;
	CourseDAO courseDAO;
	public void setCourseDAO(CourseDAO courseDAO) {
		this.courseDAO = courseDAO;
	}
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	@Override
	public List<?> getMyCourses() {
		// TODO Auto-generated method stub
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		User user=(User)session.get("user");
//		User u = userDAO.getUserByEmail(email);
		//System.out.println("userid:"+u.getId());
//		Student stu = studentDAO.getStudentByUser(u);
		//System.out.println("stugrade:"+stu.getGrade());
		return courseDAO.getCoursesByUser(user);
	}
	@Override
	public List<?> getMyTutors() {
		// TODO Auto-generated method stub
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		String email = ((User)session.get("user")).getEmail();
		User u = userDAO.getUserByEmail(email);
		//System.out.println("userid:"+u.getId());
		Student stu = studentDAO.getStudentByUser(u);
		List<Course> courses = (List<Course>) courseDAO.getCoursesByStudent(stu);
		List<Tutor> tutors = new ArrayList<Tutor>();
		for(Course c: courses)
		{
			Tutor t = c.getTutor();
			if(!isTutorExist(t, tutors))
				tutors.add(t);
			//System.out.println(c.getTutor().getUser().getFirstName());
			
		}
		return tutors;
	}
	
	@Override
	public ArrayList<SearchResult> getCourses(SearchFactors factors)
	{
		return courseDAO.searchCourses(factors);
	}
	
	private boolean isTutorExist(Tutor t, List<Tutor> l)
	{
		for(Tutor tutor: l )
		{
			if(tutor.getId()==t.getId())
				return true;
		}
		return false;
	}
	@Override
	public List<?> getTutorCourses() {
		// TODO Auto-generated method stub
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		User user = (User)session.get("user");
		Tutor tutor = (Tutor)user.getTutor();
		
		return courseDAO.getCoursesByTutor(tutor);
	}
}
