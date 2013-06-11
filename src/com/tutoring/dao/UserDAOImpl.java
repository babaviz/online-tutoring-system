package com.tutoring.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;


import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tutoring.bean.SearchFactors;
import com.tutoring.bean.SearchResult;
import com.tutoring.bean.SearchUserResult;
import com.tutoring.entity.Student;
import com.tutoring.entity.Subject;
import com.tutoring.entity.Tutor;
import com.tutoring.entity.User;

public class UserDAOImpl extends HibernateDaoSupport implements UserDAO{

	@Override
	public String getPasswordByEmail(String email) {
		// TODO Auto-generated method stub
		System.out.println("before query");
		List<?> personList = this.getHibernateTemplate().find("from User where email='"+email+"'");
		System.out.println("after query");
		if(personList.size()>0)
		{
			User person = (User) personList.get(0);
			return person.getPassword();
		}
		else
			return null;
	}

	public void addUser(String email, String password,char type,String firstname, String lastname)
	{
		User person = new User();
		person.setEmail(email);
		person.setPassword(password);
		person.setFirstName(firstname);
		person.setLastName(lastname);
		person.setType(type);
		person.setPoint((float) 0);
		if(type=='1')
		{
			Student stu = new Student();
			stu.setUser(person);
			this.getHibernateTemplate().save(stu);
		}
		else if(type=='2')
		{
			Tutor tutor = new Tutor();
			tutor.setUser(person);
			this.getHibernateTemplate().save(tutor);
		}
			
		
	}

	@Override
	public User getUserByEmail(String email) {
		// TODO Auto-generated method stub
		List<?> personList = this.getHibernateTemplate().find("from User where email = '"+email+"'");
		if(personList.size()>0)
		{
			User person = (User) personList.get(0);
			return person;
		}
		else
			return null;
		
	}


	@Override
	public List<?> getQuestionsByEmail(final String email) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().executeFind(new HibernateCallback() {  
            public Object doInHibernate(Session s)  
                    throws HibernateException, SQLException { 

            	//List<?> list = s.createFilter(user.getQuestions(), "").setFirstResult(1).setMaxResults(10).list();
            	//s.setFlushMode(FlushMode.AUTO); 
            	//List<?> list = (List<?>) user.getQuestions().iterator();
            	Query query = s.createQuery("from Question");
            
            	List<?> list = query.list();
            	//s.close();
            	return list;
            }  
        }); 
		
	}

	@Override
	public User setTutor(User u, String FirstName, String LastName,
			String phone, Date birth, String school,String description) {
		// TODO Auto-generated method stub
		u.setFirstName(FirstName);
		u.setLastName(LastName);
		u.setPhone(phone);
		u.setBirthday(birth);
		u.setSchool(school);
		u.getTutor().setDescription(description);
		System.out.println(u.getTutor().getBalance());
		System.out.println("from dao:"+phone);
		this.getHibernateTemplate().merge(u);
		return u;
	}

	@Override
	public void save(User u) {
		// TODO Auto-generated method stub
		//Transaction t = this.getSession().beginTransaction();
		this.getHibernateTemplate().merge(u);
		
	}

	@Override
	public User getUserByID(int id) {
		// TODO Auto-generated method stub
		List<?> personList = this.getHibernateTemplate().find("from User where id = "+id);
		if(personList.size()>0)
		{
			User person = (User) personList.get(0);
			return person;
		}
		else
			return null;
	}

	@Override
	public User setStudent(User u, String FirstName, String LastName,
			String phone, Date birth, String school, String grade) {
		// TODO Auto-generated method stub
		u.setFirstName(FirstName);
		u.setLastName(LastName);
		u.setPhone(phone);
		u.setBirthday(birth);
		u.setSchool(school);
		System.out.println("from dao:"+phone);
		u.getStudent().setGrade(grade);
		this.getHibernateTemplate().merge(u);
		return u;
	}

	@Override
	public ArrayList<SearchUserResult> searchUsers(SearchFactors factors) {
		// TODO Auto-generated method stub
		String query="from User where LOWER(CONCAT(lastName,firstName)) like LOWER('%"+factors.getUser_name()+"%') ";
		List<?> list = this.getHibernateTemplate().find(query);
		SearchUserResult result;
		ArrayList<SearchUserResult> searchUserResults = new ArrayList<SearchUserResult>();
		for (int i = 0; i < list.size(); i++) {
			result=new SearchUserResult();
			if(((User)list.get(i)).getType()=='1')
			{
				result.setType("学生");
			}
			else if(((User)list.get(i)).getType()=='2')
			{
				result.setType("老师");
				result.setDescription(((User)list.get(i)).getTutor().getDescription());
				
				Iterator<Subject> it=((User)list.get(i)).getTutor().getSubjects().iterator();
				String subjectsTmpStr="";
				while(it.hasNext())
				{
					subjectsTmpStr=it.next().getName()+" "+subjectsTmpStr;
				}
				result.setSubjects(subjectsTmpStr);
			}
			
			result.setGrade("大一");//((User)list.get(i)).getStudent().getGrade());
			result.setName(((User)list.get(i)).getLastName()+((User)list.get(i)).getFirstName());
			result.setPoint(((User)list.get(i)).getPoint()+"");
			
			searchUserResults.add(result);
		}
		return searchUserResults;
	}
}
