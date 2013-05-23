package com.tutoring.biz;

import java.util.List;

import com.tutoring.dao.QuestionDAO;
import com.tutoring.dao.SubjectDAO;
import com.tutoring.dao.UserDAO;
import com.tutoring.entity.Question;
import com.tutoring.entity.Subject;
import com.tutoring.entity.User;

public class TopicBizImpl implements TopicBiz{

	QuestionDAO questionDAO;
	UserDAO userDAO;
	SubjectDAO subjectDAO;
	public void setSubjectDAO(SubjectDAO subjectDAO) {
		this.subjectDAO = subjectDAO;
	}
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	public void setQuestionDAO(QuestionDAO questionDAO) {
		this.questionDAO = questionDAO;
	}
	@Override
	public void publishQuestion(String useremail, String title, String content,
			String name) {
		// TODO Auto-generated method stub
		
		Subject subject = subjectDAO.getSubjectByName(name);
		User user = userDAO.getUserByEmail(useremail);
		questionDAO.addQuestion(user, title, content, subject);
	}
	@Override
	public List<?> getQuestions(String email) {
		// TODO Auto-generated method stub
		return userDAO.getQuestionsByEmail(email);
	}
	@Override
	public Question getQuestionById(int id) {
		// TODO Auto-generated method stub
		
		return questionDAO.getQuestionById(id);
	}
	

}
