package com.tutoring.dao;

import java.util.List;

import com.tutoring.entity.Question;
import com.tutoring.entity.Subject;
import com.tutoring.entity.User;

public interface QuestionDAO {
	public void addQuestion(User user, String title, String content, Subject subject);
	public Question getQuestionById(int id);
	public List<Question> getQuestionsByUser(User u);
}
