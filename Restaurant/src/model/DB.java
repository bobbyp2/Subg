package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB {

	private DB() {
		// TODO Auto-generated constructor stub
	}
	public static Connection getConnection()
	{
		Connection con=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/bench", "root", "root");	
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error in establishing connection");
		}
		return con;
	}
}
