package com.tutoring.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class LaunchTopicAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final int BUFFER_SIZE=16*1024;
	
	private File picture;
	private File file;
	private String pictureFileName;
	private String fileFileName;
	private String pictureContentType;
	private String fileContentType;
	private String type;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public File getPicture() {
		return picture;
	}
	public void setPicture(File picture) {
		this.picture = picture;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getPictureFileName() {
		return pictureFileName;
	}
	public void setPictureFileName(String pictureFileName) {
		this.pictureFileName = pictureFileName;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public String getPictureContentType() {
		return pictureContentType;
	}
	public void setPictureContentType(String pictureContentType) {
		this.pictureContentType = pictureContentType;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	
	public String execute() throws Exception{
		//System.out.println(fileFileName+","+pictureFileName+","+type);
		if(file!=null)
		{
			String storePath = ServletActionContext.getServletContext().getRealPath( "/download" )+"/"+fileFileName;
			File storeFile = new File(storePath);
			copy(file,storeFile);
			
		}
		return SUCCESS;
	}
	
	private static void copy(File src, File dst) {
        try {
            InputStream in = null ;
            OutputStream out = null ;
             try {
            	 in = new BufferedInputStream( new FileInputStream(src), BUFFER_SIZE);
            	 out = new BufferedOutputStream( new FileOutputStream(dst), BUFFER_SIZE);
                 byte [] buffer = new byte [BUFFER_SIZE];
                 while (in.read(buffer) > 0 ) {
                	 out.write(buffer);
                 } 
            } finally {
                 if ( null != in) {
                	 in.close();
                 } 
                 if ( null != out) {
                	 out.close();
                 } 
            } 
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    } 
	

}
