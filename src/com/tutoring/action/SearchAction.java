package com.tutoring.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.bean.SearchFactors;
import com.tutoring.bean.SearchResult;
import com.tutoring.bean.SearchUserResult;
import com.tutoring.biz.CourseBiz;
import com.tutoring.biz.UserBiz;

public class SearchAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Timestamp time;

	public String execute() throws Exception {
		time = new Timestamp((new Date()).getTime());
		return SUCCESS;
	}

	CourseBiz courseBiz;
	UserBiz userBiz;
	
	public void setCourseBiz(CourseBiz courseBiz) {
		this.courseBiz = courseBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public ArrayList<SearchResult> getResult(SearchFactors factors,int pageNO) {
//		ArrayList<SearchResult> searchResults = new ArrayList<SearchResult>();
//		SearchResult s = new SearchResult();
//		s.setTutor_name("PY");
//		s.setStart_time("2012年");
//		s.setCourse_description("很牛逼");
//		s.setCourse_type("计算机");
//		s.setCourse_price("120");
//		s.setCourse_name("移动应用开发");
//		s.setCourse_duration("60");
//		searchResults.add(s);
//		return searchResults;
		return courseBiz.getCourses(factors, pageNO);
	}
	
	public ArrayList<SearchUserResult> getUserResult(SearchFactors factors, int pageNO) {
		return userBiz.getUsers(factors, pageNO);
	}
	
	public int getUserResultNum(SearchFactors factors) {
		return userBiz.getUsersNum(factors);
	}
	
	public int getCourseResultNum(SearchFactors factors) {
		return courseBiz.getCoursesNum(factors);
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}
}
