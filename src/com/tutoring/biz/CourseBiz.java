package com.tutoring.biz;

import java.util.ArrayList;
import java.util.List;
import com.tutoring.bean.*;

public interface CourseBiz {
	public List<?> getMyCourses();
	public List<?> getMyTutors();
	public List<?> getTutorCourses();
	public ArrayList<SearchResult> getCourses(SearchFactors factors);
}
