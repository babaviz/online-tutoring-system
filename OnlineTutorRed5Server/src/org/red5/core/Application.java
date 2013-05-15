package org.red5.core;

import java.util.ArrayList;

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
	
	public Application() {
		System.out.println("OnlineTutorRed5Server start.");
		tempcontainer = new ArrayList<User>(); 
		TokenGeneratorManager tgm = new TokenGeneratorManager();
		tgm.setStrategy(new MinMemory());
		tgm.Generate();  
	}
	@Override
	public synchronized boolean connect(IConnection conn, IScope scope, Object[] params) {
		String username = (String)params[0];
		System.out.println(username + " connecting.");
		
		if(!super.connect(conn, scope, params)){
			System.out.println("Unable to connect "+username);
			return false;
		} 
		tempcontainer.add(new User(username,conn,scope));
		
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
	
	public void signin(String username){
		
	}
	public void signout(String username){
		
	}
	
	public void sendMessage(String msg, String sender){
		for(User user : tempcontainer){
			callClient(user.conn(), "receiveMessage", new Object[]{"["+sender+"]\n"+msg});
		}
	}
	
	public void onUserDisconnected(){
		
	}
}
