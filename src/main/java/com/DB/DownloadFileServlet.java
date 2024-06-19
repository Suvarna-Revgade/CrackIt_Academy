package com.DB;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.jsp.JspWriter;

//@WebServlet("/DownloadFileServlet")
@MultipartConfig
public class DownloadFileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC database URL, username, and password
   
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/crackitacademy";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Root@123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "upload":
                    handleFileUpload(request, response);
                    break;
                default:
                    response.sendRedirect("index.html");
                    break;
            }
        } else {
            response.sendRedirect("index.html");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "download":
                   // handleFileDownload(request, response);
                    break;
                case "showTable":
                  showFileTable(response);
                   
                    List<Map<String, Object>> fileList = retrieveFileListFromDatabase();
                    request.setAttribute("fileList", fileList);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("notesList.jsp");
                    dispatcher.forward(request, response);
                   //out.println(fileList);
                    break;
                default:
                    response.sendRedirect("notes_subjectwise.html");
                    break;
            }
        } else {
            response.sendRedirect("notes_subjectwise.html");
        }
    }
    

    private void handleFileUpload(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Part filePart = request.getPart("file");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        try 
            
            (
                    InputStream fileContent = filePart.getInputStream();    
                
                
                     ){
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
            // Insert file into database
            Class.forName("com.mysql.cj.jdbc.Driver");           
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "INSERT INTO files (filename, filedata) VALUES (?, ?)");
            preparedStatement.setString(1, fileName);
            preparedStatement.setBlob(2, fileContent);
            preparedStatement.executeUpdate();

            response.sendRedirect("past_question_paper.html");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
        

//    private void handleFileDownload(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String fileId = request.getParameter("fileId");
//        //String fileId = URLDecoder.decode(request.getParameter("fileId"), "UTF-8");
//
//        try {
//          Class.forName("com.mysql.cj.jdbc.Driver");
//          Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
//          PreparedStatement preparedStatement = connection.prepareStatement(
//                    "SELECT filename, filedata FROM files WHERE id = ?");
//            preparedStatement.setInt(1, Integer.parseInt(fileId));
//            ResultSet resultSet = preparedStatement.executeQuery();
//
//            if (resultSet.next()) {
//                String fileName = resultSet.getString("filename");
//                response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
//
//                try (InputStream fileContent = resultSet.getBinaryStream("filedata");
//                     OutputStream out = response.getOutputStream()) {
//                    byte[] buffer = new byte[4096];
//                    int bytesRead;
//                    while ((bytesRead = fileContent.read(buffer)) != -1) {
//                        out.write(buffer, 0, bytesRead);
//                    }
//                }
//            }
//        } catch (SQLException | ClassNotFoundException e) {
//            e.printStackTrace();
//            response.getWriter().println("Error: " + e.getMessage());
//        }
//    }

    private void showFileTable(HttpServletResponse response) throws IOException {
        try  {
            // Retrieve all files from database
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT id, filename FROM files");
            ResultSet resultSet = preparedStatement.executeQuery();

            StringBuilder htmlTable = new StringBuilder("<table border='1'><tr><th>ID</th><th>Filename</th> </tr>");

            while (resultSet.next()) {
                int fileId = resultSet.getInt("id");
                String fileName = resultSet.getString("filename");

                htmlTable.append("<tr><td>").append(fileId).append("</td><td>").append(fileName)
                        .append("</td><td><a href='FileUploadDownloadServlet?action=download&fileId=").append(fileId)
                        .append("' target='_blank'>Download</a></td></tr>");
            }

            htmlTable.append("</table>");
            response.getWriter().println(htmlTable.toString());
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
    private List<Map<String, Object>> retrieveFileListFromDatabase() {
        List<Map<String, Object>> fileList = new ArrayList<>();

        try  {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
            String query = "SELECT id, filename FROM files";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                 ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int fileId = resultSet.getInt("id");
                    String fileName = resultSet.getString("filename");

                    Map<String, Object> fileMap = new HashMap<>();
                    fileMap.put("id", fileId);
                    fileMap.put("filename", fileName);

                    fileList.add(fileMap);
                   
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log or handle the exception as needed
        }
        
         catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        //System.out.print(fileList);
        return fileList;
    }
    
}
