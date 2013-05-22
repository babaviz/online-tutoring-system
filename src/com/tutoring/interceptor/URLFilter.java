package com.tutoring.interceptor;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class URLFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		System.out.println(httpServletRequest.getContextPath()+"/webs/Login.jsp");
		if(isIncludePages(httpServletRequest.getRequestURI())){
			httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/webs/Login.jsp");
		}
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	private boolean isIncludePages(String url){
		return url.indexOf("AllTopics.jsp")!=-1||url.indexOf("chatting.jsp")!=-1||url.indexOf("LaunchTopic.jsp")!=-1
				||url.indexOf("search.jsp")!=-1||url.indexOf("MyTopics.jsp")!=-1||url.indexOf("TopicDetail.jsp")!=-1;
	} 

}
