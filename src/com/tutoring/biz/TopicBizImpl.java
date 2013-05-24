package com.tutoring.biz;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.tutoring.dao.AnswerDAO;
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
	AnswerDAO answerDAO;
	public void setAnswerDAO(AnswerDAO answerDAO) {
		this.answerDAO = answerDAO;
	}
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
	@Override
	public void makeComment(String useremail, String content, int questionid) {
		// TODO Auto-generated method stub
		User user = userDAO.getUserByEmail(useremail);
		Question qt = questionDAO.getQuestionById(questionid);
		answerDAO.addAnswer(user, content, qt);
	}
	@Override
	public List<?> getAnswers(int topicid) {
		// TODO Auto-generated method stub
		Question q = questionDAO.getQuestionById(topicid);
		return answerDAO.getAnswersByQuestion(q);
	}
	@Override
	public List<?> getMyQuestions() {
		// TODO Auto-generated method stub
		ActionContext ac = ActionContext.getContext();
		Map<String , Object> session = ac.getSession();
		String useremail = (String) session.get("email");
		User user = userDAO.getUserByEmail(useremail);
		
		return questionDAO.getQuestionsByUser(user);
	}
	

}
