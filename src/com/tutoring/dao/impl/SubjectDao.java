/**
 * 
 */
package com.tutoring.dao.impl;

import org.springframework.stereotype.Repository;

import com.tutoring.dao.ISubjectDao;
import com.tutoring.entity.Subject;



/**
 * @author Ssn
 *
 */
@Repository("subjectDao")
public class SubjectDao extends BaseDao<Subject, Integer>  implements ISubjectDao{

}
