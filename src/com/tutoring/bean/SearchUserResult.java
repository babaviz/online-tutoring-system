package com.tutoring.bean;

public class SearchUserResult {
	public String name;
	public String type;
	public String point;
	public String grade;
	public String subjects;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
//		switch(grade)
//		{
//			case 0:
//				this.grade="学龄前";
//			case 1:
//				this.grade="小学一年级";
//			case 2:
//				this.grade="小学二年级";
//			case 3:
//				this.grade="小学三年级";
//			case 4:
//				this.grade="小学四年级";
//			case 5:
//				this.grade="小学五年级";
//			case 6:
//				this.grade="小学六年级";
//			case 7:
//				this.grade="初一";
//			case 8:
//				this.grade="初二";
//			case 9:
//				this.grade="初三";
//			case 10:
//				this.grade="高一";
//			case 11:
//				this.grade="高二";
//			case 12:
//				this.grade="高三";
//			case 13:
//				this.grade="大一";
//			case 14:
//				this.grade="大二";
//			case 15:
//				this.grade="大三";
//			case 16:
//				this.grade="大四";
//		}
		this.grade=grade;
	}
	public String getSubjects() {
		return subjects;
	}
	public void setSubjects(String subjects) {
		this.subjects = subjects;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String description;
}
