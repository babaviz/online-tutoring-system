package com.tutoring.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.FlushMode;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tutoring.entity.Person;

public class UserDAOImpl extends HibernateDaoSupport implements UserDAO{

	@Override
	public String getPasswordByEmail(String email) {
		// TODO Auto-generated method stub
		List<?> personList = this.getHibernateTemplate().find("from Person where email='"+email+"'");
		if(personList.size()>0)
		{
			Person person = (Person) personList.get(0);
			return person.getPassword();
		}
		else
			return null;
	}

	public void addPerson(String email, String password)
	{
		Person person = new Person();
		person.setEmail(email);
		person.setPassword(password);
		person.setFirstName("fn");
		person.setLastName("ln");
		
		this.getHibernateTemplate().save(person);
	}

	@Override
	public Person getPersonByEmail(String email) {
		// TODO Auto-generated method stub
		List<?> personList = this.getHibernateTemplate().find("from Person where email = '"+email+"'");
		if(personList.size()>0)
		{
			Person person = (Person) personList.get(0);
			return person;
		}
		else
			return null;
		
	}

	@Override
	public void deletePerson(String email) {
		// TODO Auto-generated method stub
		final Person person = (Person) this.getHibernateTemplate().find("from Person where email='"+email+"'").get(0);
		System.out.print(person.getEmail());
		//this.getHibernateTemplate().delete(person);
		this.getHibernateTemplate().executeFind(new HibernateCallback() {  
            public Object doInHibernate(Session s)  
                    throws HibernateException, SQLException {  
                s.setFlushMode(FlushMode.AUTO);  
                s.beginTransaction().begin();  
                s.delete(person);  
                s.beginTransaction().commit();  
                s.close();  
                return null;  
            }  
        }); 
	}
	
	
}
