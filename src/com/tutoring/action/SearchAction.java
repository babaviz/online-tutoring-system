package com.tutoring.action;

import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.bean.SearchFactors;
import com.tutoring.bean.SearchResult;
import com.tutoring.biz.CourseBiz;

public class SearchAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String execute() throws Exception {
		return SUCCESS;
	}

	CourseBiz courseBiz;
	
	public void setCourseBiz(CourseBiz courseBiz) {
		this.courseBiz = courseBiz;
	}

	public ArrayList<SearchResult> getResult(SearchFactors factors) {
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
		return courseBiz.getCourses(factors);
	}
}
