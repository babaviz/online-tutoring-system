package com.test.action;

import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionContext;
import com.tutoring.action.ChangeInfoAction;
import com.tutoring.biz.UserBiz;
import com.tutoring.dao.UserDAO;
import com.tutoring.entity.User;

public class TestChangeInfo {
	public static void main(String[] args)
	{
		ApplicationContext context =new ClassPathXmlApplicationContext("applicationContext.xml");
		ChangeInfoAction ca = (ChangeInfoAction) context.getBean("changeInfoAction");
		//Map<String,Object> session = ActionContext.getContext().getSession();
		//UserBiz userBiz = (UserBiz) context.getBean("UserBiz");
		//User u = userBiz.getUserInfo("panyan@gmail.com");
		//session.put("user", u);
		String birthstr = "1993-06-05";
		UserDAO userDAO = (UserDAO) context.getBean("UserDAO");
		User user = userDAO.getUserByEmail("panyan@gmail.com");
		String[] dates = birthstr.split("-");
		//Timestamp birth = new Timestamp(Integer.parseInt(dates[0]),Integer.parseInt(dates[1]),Integer.parseInt(dates[2]),0,0,0,0);
		Calendar cl = Calendar.getInstance();
		cl.set(Integer.parseInt(dates[0]), Integer.parseInt(dates[1])-1, Integer.parseInt(dates[2]));
		Date birth = cl.getTime();
		//ca.changeBasicInfo("Pan", "Yan", "18801785230", "1993-06-05", "tj");
		userDAO.setUser(user, "Pan", "Yan", "18801785230", birth, "tj");
	}
}
