package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
private static Connection connection;
	
	private static final String URL = "jdbc:mysql://localhost:3306/book_store";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "06101997";
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			if(connection == null || connection.isClosed())
				connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			
			return connection;
		} catch (ClassNotFoundException e) {
			System.out.println("Driver could not found");
		} catch (SQLException ex) {
			System.out.println("Database connection could not be established");
		}
		return null;
	}
}
