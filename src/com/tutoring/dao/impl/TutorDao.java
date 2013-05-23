/**
 * 
 */
package com.tutoring.dao.impl;

import org.springframework.stereotype.Repository;

import com.tutoring.dao.ITutorDao;
import com.tutoring.entity.Tutor;



/**
 * @author Ssn
 *
 */
@Repository("tutorDao")
public class TutorDao extends BaseDao<Tutor, Integer>  implements ITutorDao{

}
