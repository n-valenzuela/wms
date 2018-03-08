package com.java.wms;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connection {
	private static final String USERNAME = "admin";
	private static final String PASSWORD = "admin";
	private static final String CONN_STRING = "jdbc:mysql://localhost/nvalen-wms";
	
	public static void main(String[] args) throws SQLException {
		
		//Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn = null;
		
		try {
			conn = DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
			System.out.println("Connected");
		} catch (SQLException e) {
			System.err.println(e);
		}finally {
			if(conn != null) {
				conn.close();
			}
		}
	}
}
