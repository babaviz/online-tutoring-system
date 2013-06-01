package com.tutoring.dao;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import org.hibernate.FlushMode;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tutoring.entity.Notification;
import com.tutoring.entity.User;

public class NotificationDAOImpl extends HibernateDaoSupport implements NotificationDAO{

	@Override
	public void addNotice(int noticeid, int type, User user) {
		// TODO Auto-generated method stub
		Notification notice = new Notification();
		notice.setNotification_id(noticeid);
		Timestamp date = new Timestamp((new Date()).getTime());
		notice.setTime(date);
		notice.setType(type);
		notice.setUser(user);
		notice.setState(0);
		this.getHibernateTemplate().merge(notice);
	}

	@Override
	public int getNumberOfNotice() {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().setMaxResults(3);
		return this.getHibernateTemplate().execute(new HibernateCallback<Integer>(){

			@Override
			public Integer doInHibernate(Session session)
					throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				session.setFlushMode(FlushMode.AUTO);
				session.beginTransaction().begin();
				Query query = session.createQuery("select count(*) from Notification where state = 0");
				int count = ((Number)query.uniqueResult()).intValue();
				//session.flush();
				//session.clear();
				session.beginTransaction().commit();
				//session.close();
				//session.disconnect();
				session.close();
				return count;
			}
			
		});
		
	}

}
