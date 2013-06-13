package com.tutoring.dao;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tutoring.entity.Notification;
import com.tutoring.entity.User;

public class NotificationDAOImpl extends HibernateDaoSupport implements NotificationDAO{

	@Override
	public void addNotice(int noticeid, int type, User user,User fromuser) {
		// TODO Auto-generated method stub
		System.out.println("addnotice:"+noticeid);
		Notification notice = new Notification();
		notice.setNotification_id(noticeid);
		Timestamp date = new Timestamp((new Date()).getTime());
		notice.setTime(date);
		notice.setType(type);
		notice.setUser(user);
		notice.setFromuser(fromuser);
		notice.setState(0);
		user.getNotifications().add(notice);
		this.getHibernateTemplate().merge(user);
	}

	@Override
	public int getNumberOfNotice(final int userid) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().setMaxResults(3);
		return this.getHibernateTemplate().execute(new HibernateCallback<Integer>(){

			@Override
			public Integer doInHibernate(Session session)
					throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				
				Query query = session.createQuery("select count(*) from Notification where state = 0 and user_id = "+userid);
				int count = ((Number)query.uniqueResult()).intValue();
				//session.flush();
				//session.clear();
				
				return count;
			}
			
		});
		//return user.getNotifications().size();
		
	}

	@Override
	public int getNumberOfCourseNotice(final int userid) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().setMaxResults(3);
		return this.getHibernateTemplate().execute(new HibernateCallback<Integer>(){

			@Override
			public Integer doInHibernate(Session session)
					throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				
				Query query = session.createQuery("select count(*) from Notification where state = 0 and type = 1 and user_id = "+userid);
				int count = ((Number)query.uniqueResult()).intValue();
				//session.flush();
				//session.clear();
				
				return count;
			}
			
		});
	}

	@Override
	public int getNumberOfFriendNotice(final int userid) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().setMaxResults(3);
		return this.getHibernateTemplate().execute(new HibernateCallback<Integer>(){

			@Override
			public Integer doInHibernate(Session session)
					throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				
				Query query = session.createQuery("select count(*) from Notification where state = 0 and type = 2 and user_id = "+userid);
				int count = ((Number)query.uniqueResult()).intValue();
				//session.flush();
				//session.clear();
				
				return count;
			}
			
		});
	}

	@Override
	public int getNumberOfChatNotice(final int userid) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().setMaxResults(3);
		return this.getHibernateTemplate().execute(new HibernateCallback<Integer>(){

			@Override
			public Integer doInHibernate(Session session)
					throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				
				Query query = session.createQuery("select count(*) from Notification where state = 0 and type = 3 and user_id = "+userid);
				int count = ((Number)query.uniqueResult()).intValue();
				//session.flush();
				//session.clear();
				
				return count;
			}
			
		});
	}

	@Override
	public void setNoticeStatus(Notification n,int status) {
		// TODO Auto-generated method stub
		n.setState(status);
		//System.out.println("status:"+n.getState());
		this.getHibernateTemplate().merge(n);
		//System.out.println("merge ok");
	}

	@Override
	public Notification getNotificationById(int id) {
		// TODO Auto-generated method stub
		List<?> l = this.getHibernateTemplate().find("from Notification where id = "+id);
		if(l.size()>0){
			//System.out.println("noticeid:"+id);
			return (Notification)l.get(0);
		}
		else
			return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Notification> getNotificationListByQuery(String condition) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().find(condition);
	}

	@Override
	public void save(Notification n) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().merge(n);
	}

}
