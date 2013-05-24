/**
 * 
 */
package com.tutoring.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tutoring.dao.IAnswerDao;
import com.tutoring.entity.Answer;



/**
 * @author Ssn
 *
 */
@Repository("answerDao")
public class AnswerDao extends BaseDao<Answer, Integer> implements IAnswerDao{

	@Override
	public Integer save(Answer model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdate(Answer model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Answer model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void merge(Answer model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteObject(Answer model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Answer get(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Answer> listAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Answer> listAll(int pn, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Answer> pre(Integer pk, int pn, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Answer> next(Integer pk, int pn, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean exists(Integer id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void flush() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void clear() {
		// TODO Auto-generated method stub
		
	}

}
