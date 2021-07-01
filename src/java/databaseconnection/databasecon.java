/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package databaseconnection;

/**
 *
 *
 */
import java.sql.*;

public class databasecon
{
	static Connection con;
	public static Connection getconnection()
	{	
            System.out.println("connection class");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");	
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/telehealth","root","root");
                        System.out.println("welcome"+con);
		}
		catch(Exception e)
		{
			System.out.println("class error");
		}
		return con;
	}
	
}
