package main.java;


import java.sql.*;
public class Demo {
	public Connection returnConn() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/shuttle", "root", "");
		return conn;
		
	}
}
