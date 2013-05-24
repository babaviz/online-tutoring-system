package com.tutoring.dao;

import java.util.List;

import com.tutoring.entity.Question;
import com.tutoring.entity.User;

public interface AnswerDAO {
	public void addAnswer(User user, String content, Question question);
	public List<?> getAnswersByQuestion(Question q);
}
