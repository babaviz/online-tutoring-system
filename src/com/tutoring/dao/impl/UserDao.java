/**
 * 
 */
package com.tutoring.dao.impl;

import org.springframework.stereotype.Repository;

import com.tutoring.dao.IUserDao;
import com.tutoring.entity.User;



/**
 * @author Ssn
 *
 */
@Repository("userDao")
public class UserDao extends BaseDao<User, Integer> implements IUserDao{

}
