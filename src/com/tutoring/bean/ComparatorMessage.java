package com.tutoring.bean;

import java.util.Comparator;
import com.tutoring.entity.Message;

public class ComparatorMessage implements Comparator<Object>{

	@Override
	public int compare(Object o1, Object o2) {
		// TODO Auto-generated method stub
		Message msg1 = (Message)o1;
		Message msg2 = (Message)o2;
		int flag = msg1.getTime().compareTo(msg2.getTime());
		
		return flag;
	}

}
