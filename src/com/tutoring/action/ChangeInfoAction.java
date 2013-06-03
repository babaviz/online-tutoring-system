package com.tutoring.action;

import java.util.Date;
import java.util.Calendar;
import java.util.Map;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.biz.UserBiz;
import com.tutoring.entity.User;
import com.tutoring.util.StaticUtil;

public class ChangeInfoAction extends ActionSupport implements ServletResponseAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	UserBiz userBiz;
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}
	
	private HttpServletResponse response; 
	
	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	private File fileupload;
	private String fileuploadFileName;
	
	
	public String changeBasicInfo(String FirstName, String LastName, String phone, String birthstr, String school){
		Date birth = null;
		if(birthstr!=null)
		{
			String[] dates = birthstr.split("-");
			//Timestamp birth = new Timestamp(Integer.parseInt(dates[0]),Integer.parseInt(dates[1]),Integer.parseInt(dates[2]),0,0,0,0);
			Calendar cl = Calendar.getInstance();
			cl.set(Integer.parseInt(dates[0]), Integer.parseInt(dates[1])-1, Integer.parseInt(dates[2]));
			birth = cl.getTime();
			System.out.println(FirstName+","+LastName+","+phone+","+Integer.parseInt(dates[0])+","+Integer.parseInt(dates[1])+","+Integer.parseInt(dates[2])+","+school);
		}
		//birth.setYear(Integer.parseInt(dates[0]));
		//birth.setMonth(Integer.parseInt(dates[1]));
		//birth.setDate(Integer.parseInt(dates[2]));
		User user = userBiz.changeUserInfo(FirstName, LastName, phone, birth, school);
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		session.put("user", user);
		return "ok";
	}
	public String test()
	{
		return "ok";
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response = response;
	}
	public String uploadHeadImg(){
		System.out.println("uploadheadimg");
		
		response = ServletActionContext.getResponse();
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(fileupload!=null)
		{
			System.out.println("file is not null");
			String pictureType = fileuploadFileName.substring(fileuploadFileName.indexOf('.'));
			String head_pic_sn = null;
			if(pictureType.equals(".jpg")||pictureType.equals(".jpeg")||pictureType.equals(".png")||pictureType.equals(".bmp"))
			{
				head_pic_sn = StaticUtil.generateRandomString(10)+pictureType;
				String storePath = ServletActionContext.getServletContext().getRealPath( "/headimg" )+"/"+head_pic_sn;
				File file = new File(storePath);
				StaticUtil.copy(fileupload, file);
				ActionContext ac = ActionContext.getContext();
				Map<String, Object> session = ac.getSession();
				
				userBiz.setHeadImagePathByEmail(((User)session.get("user")), head_pic_sn);
			}
			out.print("ok&"+head_pic_sn);
		}
		else
		{
			out.print("error");
		}
		out.flush();
		out.close();
		return null;
	}
	public String getFileuploadFileName() {
		return fileuploadFileName;
	}
	public void setFileuploadFileName(String fileuploadFileName) {
		this.fileuploadFileName = fileuploadFileName;
	}
	public File getFileupload() {
		return fileupload;
	}
	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}
}
