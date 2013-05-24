package com.tutoring.biz;

import java.util.List;

import com.tutoring.entity.Question;


public interface TopicBiz {
	public void publishQuestion(String useremail, String title, String content, String name);
	public List<?> getQuestions(String email);
	public Question getQuestionById(int id);
	public void makeComment(String useremail, String content, int questionid);
	public List<?> getAnswers(int topicid);
	public List<?> getMyQuestions();
}
