/**
 * 
 */
package com.tutoring.dao.impl;

import org.springframework.stereotype.Repository;

import com.tutoring.dao.INotificationDao;
import com.tutoring.entity.Notification;



/**
 * @author Ssn
 *
 */
@Repository("notificationDao")
public class NotificationDao extends BaseDao<Notification, Integer> implements INotificationDao{

}
