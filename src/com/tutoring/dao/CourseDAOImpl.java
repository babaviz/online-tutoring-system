package com.tutoring.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tutoring.bean.SearchFactors;
import com.tutoring.bean.SearchResult;
import com.tutoring.entity.Course;
import com.tutoring.entity.Student;
import com.tutoring.entity.Tutor;
import com.tutoring.entity.User;

public class CourseDAOImpl extends HibernateDaoSupport implements CourseDAO {

	@Override
	public List<Course> getCoursesByStudent(Student stu) {
		// TODO Auto-generated method stub
		List<Course> list = new ArrayList<Course>();
		list.addAll(stu.getCourses());
		return list;
	}
	
	public List<Course> getCoursesByUser(User user){
		List<Course> list = new ArrayList<Course>();
		if(user.getType()=='1')
		{
			list.addAll(user.getStudent().getCourses());
		}
		else if(user.getType()=='2')
		{
			list.addAll(user.getTutor().getCourses());
		}
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
		List<?> list = this.getHibernateTemplate().find(
				"from Course where id = " + id);
		if (list.size() > 0) {
			Course course = (Course) list.get(0);
			return course;
		} else
			return null;
	}

	@SuppressWarnings("deprecation")
	@Override
	public ArrayList<SearchResult> searchCourses(SearchFactors factors) {
		String query = "select distinct c from Course c, Subject s, Tutor t, User u where s.id = c.subject and c.tutor = t.id and u.id = t.user ";

		System.out.println("\nlalala");
		
		if(!factors.getCourse_type().equals("不限类别"))
		{
			query=query+" and s.name = '"+factors.getCourse_type()+"' ";
		}
		
		if (factors.getCourse_description().length() > 0) {
			query = query + " and c.description like '%"
					+ factors.getCourse_description() + "%' ";
			System.out.println("c_description:"
					+ factors.getCourse_description());
		}

		if (factors.getTutor_description().length() > 0) {
			query = query + " and t.description like '%"
					+ factors.getTutor_description() + "%' ";
			System.out.println("t_description:"
					+ factors.getTutor_description());
		}

		if (factors.getCourse_name().length() > 0) {
			query = query + " and c.name like '%" + factors.getCourse_name()
					+ "%' ";
			System.out.println("c_name:" + factors.getCourse_name());
		}

		if ((factors.getCourse_price_f().length() > 0)
				&& (factors.getCourse_price_t().length() > 0)) {
			query = query + " and c.price <= " + factors.getCourse_price_t()
					+ " and c.price >= " + factors.getCourse_price_f() + " ";
		} else if ((factors.getCourse_price_f().length() == 0)
				&& (factors.getCourse_price_t().length() > 0)) {
			query = query + " and c.price <= " + factors.getCourse_price_t()
					+ " ";
		} else if ((factors.getCourse_price_f().length() > 0)
				&& (factors.getCourse_price_t().length() == 0)) {
			query = query + " and c.price >= " + factors.getCourse_price_f()
					+ " ";
		}

		System.out.println("price_f:" + factors.getCourse_price_f());
		System.out.println("price_t:" + factors.getCourse_price_t());
		System.out.println("start_time:" + factors.getCourse_start_time());
		System.out.println("time_f:" + factors.getCourse_time_f());
		System.out.println("time_t:" + factors.getCourse_time_t());
		System.out.println("course_type:" + factors.getCourse_type());
		System.out.println("tutor_name:" + factors.getTutor_name());
		
		if (factors.getCourse_start_time().length() > 0) {
			//String[] tmpStr=factors.getCourse_start_time().split(" ");
			//String dd=tmpStr[0];
			
			query = query + " and c.startTime >= '"
					+ factors.getCourse_start_time() + ":00' ";
		}

		if ((factors.getCourse_time_f().length() > 0)
				&& (factors.getCourse_time_t().length() == 0)) {
			query = query + " and c.duration >= " + factors.getCourse_time_f()
					+ " ";
		} else if ((factors.getCourse_time_f().length() == 0)
				&& (factors.getCourse_time_t().length() > 0)) {
			query = query + " and c.duration <= " + factors.getCourse_time_t()
					+ " ";
		} else if ((factors.getCourse_time_f().length() > 0)
				&& (factors.getCourse_time_t().length() > 0)) {
			query = query + " and c.duration >= " + factors.getCourse_time_f()
					+ " and c.duration <= " + factors.getCourse_time_t()+" ";
		}

		if (factors.getTutor_name().length()>0)
		{
			query=query+" and LOWER(CONCAT(u.lastName,u.firstName)) like LOWER('%"+factors.getTutor_name()+"%') ";
		}
		
		if(factors.getTutor_eval().length()>0)
		{
			query=query+" and u.point >= "+Float.valueOf(factors.getTutor_eval().substring(0, 2))+" ";
			System.out.println("tutor_eval:" + Float.valueOf(factors.getTutor_eval().substring(0, 2)));
		}
		
//		query="select distinct c from Course c, Subject s, Tutor t, User u where s.id = c.subject and c.tutor = t.id and u.id = t.user and s.name='计算机' ";
//		query="from Course where startTime > '2013-05-30 17:39:05' ";
		System.out.println(query);
		List<?> list = this.getHibernateTemplate().find(query);
		SearchResult result;
		ArrayList<SearchResult> searchResults = new ArrayList<SearchResult>();
		for (int i = 0; i < list.size(); i++) {
			result = new SearchResult();
			result.setCourse_description(((Course) list.get(i)).getDescription());
			result.setCourse_name(((Course) list.get(i)).getName());
			result.setCourse_duration(((Course) list.get(i)).getDuration()+"");
			result.setCourse_price(((Course) list.get(i)).getPrice()+"");
			result.setTutor_name(((Course) list.get(i)).getTutor().getUser().getLastName()+((Course) list.get(i)).getTutor().getUser().getFirstName());
			result.setCourse_type(((Course) list.get(i)).getSubject().getName());
			result.setStart_time(((Course) list.get(i)).getStartTime().toLocaleString());
			searchResults.add(result);
		}
		return searchResults;
	}

	@Override
	public int getApplyNumberOfCourse(final Course c) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().execute(new HibernateCallback<Integer>(){

			@Override
			public Integer doInHibernate(Session session)
					throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				Query query = session.createQuery("select count(*) from Application where course_id = "+c.getId());
				return ((Number)query.uniqueResult()).intValue();
			}
			
		});
	}

	@Override
	public void deleteCourse(Course c) {
		// TODO Auto-generated method stub
		System.out.println("delete id:"+c.getId());
		List<?> applylist = this.getHibernateTemplate().find("from Application where course_id="+c.getId());
		List<?> noticelist = this.getHibernateTemplate().find("from Notification where type=1 and notification_id="+c.getId());
		this.getHibernateTemplate().deleteAll(applylist);
		this.getHibernateTemplate().deleteAll(noticelist);
		this.getHibernateTemplate().delete(c);
	}

	@Override
	public List<Course> getOrderedCoursesByTutorId(int id) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<Course> list = this.getHibernateTemplate().find("from Course where tutor_id="+id);
		return list;
	}

	@Override
	public void save(Course c) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().merge(c);
	}
}
