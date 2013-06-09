package com.tutoring.biz;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.tutoring.bean.*;
import com.tutoring.entity.User;
import com.tutoring.entity.Course;

public interface CourseBiz {
	public List<?> getMyCourses();
	public List<?> getMyTutors();
	public List<?> getTutorCourses();
	public ArrayList<SearchResult> getCourses(SearchFactors factors);
	public void openCourse(User u, String startTime, String endTime, int price, String coursename, String description,String type);
	public List<UnhandleCourse> getUnhandleCourseInfoList(Set<Course> allcourses);
	public void deleteCourse(int courseid);
}
