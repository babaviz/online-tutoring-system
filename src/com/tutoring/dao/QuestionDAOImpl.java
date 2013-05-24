package com.tutoring.dao;

import java.util.Date;
import java.util.List;
import java.sql.Timestamp;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.tutoring.entity.Question;
import com.tutoring.entity.Subject;
import com.tutoring.entity.User;

public class QuestionDAOImpl extends HibernateDaoSupport implements QuestionDAO{

	@Override
	public void addQuestion(User user, String title, String content,
			Subject subject) {
		// TODO Auto-generated method stub
		Question question = new Question();
		question.setUser(user);
		question.setTitle(title);
		question.setContent(content);
		question.setSubject(subject);
		Timestamp date = new Timestamp((new Date()).getTime());
		question.setTime(date);
		question.setView(0);
		question.setReply(0);
		this.getHibernateTemplate().save(question);
	}

	@Override
	public Question getQuestionById(int id) {
		// TODO Auto-generated method stub
		List<?> qlist = this.getHibernateTemplate().find("from Question where id="+id);
		if(qlist.size()>0)
		{
			Question q = (Question) qlist.get(0);
			return q;
		}
		else
			return null;
	}

}
