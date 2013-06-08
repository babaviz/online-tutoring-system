package org.red5.core;

import java.util.ArrayList;

import org.red5.io.object.UnsignedInt;
import org.red5.server.adapter.ApplicationAdapter;
import org.red5.server.api.IConnection;
import org.red5.server.api.scope.IScope;
import org.red5.server.api.service.IServiceCapableConnection;

import com.tongji.onlinetutor.server.*;
import com.tongji.onlinetutor.server.utils.MinMemory;
import com.tongji.onlinetutor.server.utils.TokenGenerator;
import com.tongji.onlinetutor.server.utils.TokenGeneratorManager;


public class Application extends ApplicationAdapter{
	private ArrayList<User> tempcontainer;
	private CourseManager courseManager;
	
	public Application() {
		System.out.println("OnlineTutorRed5Server start.");
		tempcontainer = new ArrayList<User>(); 
		courseManager = new CourseManager();
//		TokenGeneratorManager tgm = new TokenGeneratorManager();
//		tgm.setStrategy(new MinMemory());
//		tgm.GenerateInt();  
	}
	@Override
	public synchronized boolean connect(IConnection conn, IScope scope, Object[] params) {
		String username = (String)params[0];
		boolean usertype = (boolean)params[1];
		String courseID = (String)params[2];
		System.out.println(username + " connecting.");
		
		if(!super.connect(conn, scope, params)){
			System.out.println("Unable to connect "+username);
			return false;
		} 
		signin(username, usertype, courseID,conn,scope);
		tempcontainer.add(new User(username,usertype,conn,scope));
		
		//TODO i dont know what to say... anyway, a lot of things to do
		System.out.println(username+" connected");
		return true;
	}
	@Override
	public synchronized void disconnect(IConnection conn, IScope scope) {
		System.out.println("Client disconnected");
		super.disconnect(conn, scope);
	}
	
	private boolean callClient(IConnection conn, String method_name, Object[] params){
		if(conn instanceof IServiceCapableConnection){
			IServiceCapableConnection sc = (IServiceCapableConnection)conn;
			sc.invoke(method_name,params);
		}
		else
			return false;
		return true;
	}
	
	public void signin(String username, boolean usertype, String courseID, IConnection conn, IScope scope){
		courseManager.addCourse(courseID);
		courseManager.takeCourse(courseID, username, usertype, conn, scope);
	}
	public void signout(String username, boolean usertype, String courseID){
		courseManager.leaveClass(courseID, usertype, username);
	}
	
	public void sendMessage(String courseID, String msg, String sender){
		ArrayList<User> users = courseManager.getCoursePair(courseID);
		for(User user : users){
			callClient(user.conn(), "receiveMessage", new Object[]{"["+sender+"]\n"+msg});
		}
	}
	
	public void sendMouseDown(String courseID, int mX, int mY, int color){
//		System.out.println("Mouse Down");
		ArrayList<User> users = courseManager.getCoursePair(courseID);
		for(User user : users){
			callClient(user.conn(), "receiveMouseDown", new Object[]{mX,mY,color});
		}
	}
	
	public void sendMouseUp(String courseID, int mX, int mY){
//		System.out.println("Mouse Up");
		ArrayList<User> users = courseManager.getCoursePair(courseID);
		for(User user : users){
			callClient(user.conn(), "receiveMouseUp", new Object[]{mX,mY});
		}
	}
	
	public void sendMouseMove(String courseID, int mX, int mY){
//		System.out.print(mX+" "+mY+" ");
		ArrayList<User> users = courseManager.getCoursePair(courseID);
		for(User user : users){
			callClient(user.conn(), "receiveMouseMove", new Object[]{mX,mY});
		}
	}
	
	public void sendUndo(String courseID){
		ArrayList<User> users = courseManager.getCoursePair(courseID);
		for(User user : users){
			callClient(user.conn(), "receiveUndo", null);
		}
	}
	
	public void sendChangeTool(String courseID, int tool){
		ArrayList<User> users = courseManager.getCoursePair(courseID);
		for(User user : users){
			callClient(user.conn(), "receiveChangeTool", new Object[]{tool});
		}
	}
	
	
	public void sendClearScreen(String courseID){
		ArrayList<User> users = courseManager.getCoursePair(courseID);
		for(User user : users){
			callClient(user.conn(), "receiveClearScreen", null);
		}
	}
	
	
	public void sendDoCheckBox(String courseID,boolean isEnable){
		ArrayList<User> users = courseManager.getCoursePair(courseID);
		for(User user : users){
			callClient(user.conn(), "receiveDoCheckBox", new Object[]{isEnable});
		}
	}
	
	
}
