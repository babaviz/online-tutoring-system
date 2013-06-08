package com.tongji.onlinetutor.server;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Database{
	private static String DRIVER = "com.mysql.jdbc.Driver";
	private static String URL = "jdbc:mysql://127.0.0.1:3307/";
	private static String DATABASENAME = "onlingtutoring";
	private static String USER = "root";
	private static String PASSWORD = "1234";
	private Connection conn;
	private Statement statement1;
	private Statement statement2;
	public Database(){
		try{
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL+DATABASENAME,USER,PASSWORD);
			if(!conn.isClosed()){
				System.out.println("Successfully connected to "+DATABASENAME);
				statement1 = conn.createStatement();
				statement2 = conn.createStatement();
			}
			
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public ResultSet executeQueryA(String sql){
		ResultSet rs = null;
		try{
			rs = statement1.executeQuery(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet executeQueryB(String sql){
		ResultSet rs = null;
		try{
			rs = statement2.executeQuery(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	public void Close() {
		// TODO Auto-generated method stub
		try{
			statement1.close();
			statement2.close();
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
}
