/**
 * 
 */
package com.tutoring.dao.impl;

import org.springframework.stereotype.Repository;

import com.tutoring.dao.IStudentDao;
import com.tutoring.entity.Student;



/**
 * @author Ssn
 *
 */
@Repository("studentDao")
public class StudentDao extends BaseDao<Student, Integer> implements IStudentDao{

}
