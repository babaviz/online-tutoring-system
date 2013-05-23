/**
 * 
 */
package com.tutoring.dao.impl;

import org.springframework.stereotype.Repository;

import com.tutoring.dao.IMessageDao;
import com.tutoring.entity.Message;



/**
 * @author Ssn
 *
 */
@Repository("messageDao")
public class MessageDao extends BaseDao<Message, Integer> implements IMessageDao{

}
