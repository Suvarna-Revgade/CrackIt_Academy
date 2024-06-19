package com.DB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.file;

public class DownloadServletNotes {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/crackitacademy";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "Root@123";

    
   public List<file> getAllNotesFiles() {
       List<file> files = new ArrayList<>();

       try  {
       	Class.forName("com.mysql.cj.jdbc.Driver");
       	Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
           String sql = "SELECT * FROM notesSub";
           try (PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()) {
               while (resultSet.next()) {
                   file f = new file();
                   f.setId(resultSet.getInt("id"));
                   f.setFilename(resultSet.getString("filename"));
                  // f.setFiledata(resultSet.getBytes("filedata"));
                   Blob blob = resultSet.getBlob("filedata");
                   
                   if (blob != null) {
                       f.setFiledata(blob.getBytes(1, (int) blob.length()));
                   }
                   files.add(f);
               }
           }
       } catch (SQLException e) {
           e.printStackTrace();
       } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

       return files;
   }

  public file getNotesFileById(int fileId) {
//   	 List<file> getAllfiledata() {
//   	        List<file> files1 = new ArrayList<>();
	   		file f=null;
   	        try  {
   	        	Class.forName("com.mysql.cj.jdbc.Driver");
   	        	Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
   	            String sql = "SELECT * FROM notesSub where id=?";
   	           PreparedStatement statement = connection.prepareStatement(sql);
   	           statement.setInt(1, fileId);
   	                 ResultSet resultSet = statement.executeQuery(); 
   	                while (resultSet.next()) {
   	                     f = new file();
   	                    f.setId(resultSet.getInt("id"));
   	                    f.setFilename(resultSet.getString("filename"));
   	                    Blob blob = resultSet.getBlob("filedata");
   	                    
   	                    if (blob != null) {
   	                        f.setFiledata(blob.getBytes(1, (int) blob.length()));
   	                    }

   	                   
   	                
   	            }
   	        } 
   	            catch (Exception e) {
   	            e.printStackTrace();
   	        }

   	        return f;
   	      
   }
}