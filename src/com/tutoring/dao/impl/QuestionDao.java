/**
 * 
 */
package com.tutoring.dao.impl;

import org.springframework.stereotype.Repository;

import com.tutoring.dao.IQuestionDao;
import com.tutoring.entity.Question;



/**
 * @author Ssn
 *
 */
@Repository("questionDao")
public class QuestionDao extends BaseDao<Question, Integer> implements IQuestionDao{

	
}
