package com.tutoring.dao;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tutoring.entity.Notification;
import com.tutoring.entity.User;

public class NotificationDAOImpl extends HibernateDaoSupport implements NotificationDAO{

	@Override
	public void addNotice(int noticeid, int type, User user) {
		// TODO Auto-generated method stub
		System.out.println("addnotice:"+noticeid);
		Notification notice = new Notification();
		notice.setNotification_id(noticeid);
		Timestamp date = new Timestamp((new Date()).getTime());
		notice.setTime(date);
		notice.setType(type);
		notice.setUser(user);
		notice.setState(0);
		user.getNotifications().add(notice);
		this.getHibernateTemplate().merge(user);
	}

	@Override
	public int getNumberOfNotice(User user) {
		// TODO Auto-generated method stub
//		this.getHibernateTemplate().setMaxResults(3);
//		return this.getHibernateTemplate().execute(new HibernateCallback<Integer>(){
//
//			@Override
//			public Integer doInHibernate(Session session)
//					throws HibernateException, SQLException {
//				// TODO Auto-generated method stub
//				
//				Query query = session.createQuery("select count(*) from Notification where state = 0");
//				int count = ((Number)query.uniqueResult()).intValue();
//				//session.flush();
//				//session.clear();
//				
//				return count;
//			}
//			
//		});
		return user.getNotifications().size();
		
	}

}
