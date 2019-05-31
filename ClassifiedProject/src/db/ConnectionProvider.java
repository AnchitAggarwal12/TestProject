package db;

import java.sql.*;

public class ConnectionProvider {
  
	public static Connection getConnection()
	{
		try{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/classified","root","anchit");
			return con;
		}
		catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
	}
	
}
