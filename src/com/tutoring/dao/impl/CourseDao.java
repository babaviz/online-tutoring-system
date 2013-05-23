/**
 * 
 */
package com.tutoring.dao.impl;

import org.springframework.stereotype.Repository;

import com.tutoring.dao.ICourseDao;
import com.tutoring.entity.Course;

/**
 * @author Ssn
 *
 */
@Repository("courseDao")
public class CourseDao extends BaseDao<Course, Integer> implements ICourseDao{

	
}
