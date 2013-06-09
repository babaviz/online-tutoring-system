package com.tutoring.biz;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;
import com.tutoring.bean.SearchFactors;
import com.tutoring.bean.SearchResult;
import com.tutoring.bean.UnhandleCourse;
import com.tutoring.dao.CourseDAO;
import com.tutoring.dao.StudentDAO;
import com.tutoring.dao.SubjectDAO;
import com.tutoring.dao.TutorDAO;
import com.tutoring.dao.UserDAO;
import com.tutoring.entity.Course;
import com.tutoring.entity.Student;
import com.tutoring.entity.Tutor;
import com.tutoring.entity.User;
import com.tutoring.util.StaticUtil;

public class CourseBizImpl implements CourseBiz{

	UserDAO userDAO;
	StudentDAO studentDAO;
	CourseDAO courseDAO;
	TutorDAO tutorDAO;
	SubjectDAO subjectDAO;
	public void setSubjectDAO(SubjectDAO subjectDAO) {
		this.subjectDAO = subjectDAO;
	}
	public void setTutorDAO(TutorDAO tutorDAO) {
		this.tutorDAO = tutorDAO;
	}
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
	@Override
	public void openCourse(User u, String startTime, String endTime, int price, String coursename, String description,String type) {
		// TODO Auto-generated method stub
		
		Course c = new Course();
		String[] sTime = startTime.split(" ");
		String[] sTimeDate = sTime[0].split("-");
		String[] sTimeClock = sTime[1].split(":");
		String[] eTime = endTime.split(" ");
		String[] eTimeDate = eTime[0].split("-");
		String[] eTimeClock = eTime[1].split(":");
		
		Calendar cl = Calendar.getInstance();
		cl.set(Integer.parseInt(sTimeDate[0]), Integer.parseInt(sTimeDate[1]), Integer.parseInt(sTimeDate[2]), Integer.parseInt(sTimeClock[0]), Integer.parseInt(sTimeClock[1]), Integer.parseInt(sTimeClock[2]));
		
		Timestamp startstamp = new Timestamp(cl.getTime().getTime());
		
		c.setStartTime(startstamp);
		
		cl.set(Integer.parseInt(eTimeDate[0]), Integer.parseInt(eTimeDate[1]), Integer.parseInt(eTimeDate[2]), Integer.parseInt(eTimeClock[0]), Integer.parseInt(eTimeClock[1]), Integer.parseInt(eTimeClock[2]));
		
		Timestamp endstamp = new Timestamp(cl.getTime().getTime());
		
		c.setEndTime(endstamp);
		c.setDuration(StaticUtil.getDuration(Integer.parseInt(sTimeClock[0]), Integer.parseInt(sTimeClock[1]), Integer.parseInt(sTimeClock[2]), Integer.parseInt(eTimeClock[0]), Integer.parseInt(eTimeClock[1]), Integer.parseInt(eTimeClock[2])));
		
		c.setName(coursename);
		
		c.setPrice(price);
		
		c.setDescription(description);
		
		c.setEbsa(0);
		c.setEbsb(0);
		c.setEbsc(0);
		c.setEbta(0);
		c.setEbtb(0);
		c.setEbtc(0);
		
		c.setStatus(0);
		
		System.out.println(subjectDAO.getSubjectByName(type).getId());
		
		c.setSubject(subjectDAO.getSubjectByName(type));
		c.setTutor(u.getTutor());
		
		u.getTutor().getCourses().add(c);
		userDAO.save(u);
	}
	@Override
	public List<UnhandleCourse> getUnhandleCourseInfoList(Set<Course> allcourses) {
		// TODO Auto-generated method stub
		List<UnhandleCourse> list = new ArrayList<UnhandleCourse>();
		
		for(Course c : allcourses){
			if(c.getStudent()==null)
			{
			UnhandleCourse uc = new UnhandleCourse();
			uc.setCourseid(c.getId());
			uc.setApplyNumber(courseDAO.getApplyNumberOfCourse(c));
			uc.setCourseName(c.getName());
			uc.setEndTime(c.getEndTime());
			uc.setStartTime(c.getStartTime());
			list.add(uc);
			}
		}
		return list;
	}
	@Override
	public void deleteCourse(int courseid) {
		// TODO Auto-generated method stub
		Course c = courseDAO.getCourseById(courseid);
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		User user = (User)session.get("user");
		Tutor tutor = (Tutor)user.getTutor();
		//System.out.println("before sessionsize:"+tutor.getCourses().size());
		tutor.getCourses().remove(c);
		session.put("user", user);
		//System.out.println("after sessionsize:"+tutor.getCourses().size()); 
		courseDAO.deleteCourse(c);
	}
}
