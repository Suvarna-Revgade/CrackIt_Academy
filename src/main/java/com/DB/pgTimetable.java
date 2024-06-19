package com.DB;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pgtimetablemess;

public class pgTimetable {
	 private static final String JDBC_URL = "jdbc:mysql://localhost:3306/crackitacademy";
	    private static final String JDBC_USER = "root";
	    private static final String JDBC_PASSWORD = "Root@123";

	    public List<pgtimetablemess> getAllFiles() {
	        List<pgtimetablemess> l = new ArrayList<>();
	        pgtimetablemess d=null;
	        try  {
	        	Class.forName("com.mysql.cj.jdbc.Driver");
	        	Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
	            String sql = "SELECT * FROM pgtimetable";
	            
	        	PreparedStatement ps= connection.prepareStatement(sql);
	        	ResultSet rs=ps.executeQuery();
	        	
	        	while(rs.next())
	        	{
	        		d=new pgtimetablemess();
	        		d.setDays(rs.getString(1));
	        		d.setBreakfast(rs.getString(2));
	        		d.setLunch(rs.getString(3));
	        		d.setDinner(rs.getString(4));
	        		
	        		
	        		l.add(d);
	        		
	        	}
	        	
	        	}
	        	catch(Exception e)
	        	{
	        		System.out.println(e);
	        	}
	        	
	        	return l;
	        	}
	    	      
	    }
