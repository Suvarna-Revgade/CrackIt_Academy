package com.Admiin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class QuebankFileUpload
 */
@WebServlet("/QuebankFileUpload")
@MultipartConfig
public class QuebankFileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final String JDBC_URL = "jdbc:mysql://localhost:3306/crackitacademy";
	    private static final String DB_USER = "root";
	    private static final String DB_PASSWORD = "Root@123";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuebankFileUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
        //String action = request.getParameter("action");

if (action != null) {
    switch (action) {
       
        case "uploadnote":
            handleFileUploadnote(request, response);
            break;
        default:
            response.sendRedirect("index.html");
            break;
    }
} else {
    response.sendRedirect("index.html");
}
}

//private void handleFileUpload(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//Part filePart = request.getPart("file");
//String fileName = getFileName(filePart);
//
//try  {
//	Class.forName("com.mysql.cj.jdbc.Driver");
//	InputStream fileContent = filePart.getInputStream();
//    Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
//    // Insert file into the database
//    PreparedStatement preparedStatement = connection
//            .prepareStatement("INSERT INTO files (filename, filedata) VALUES (?, ?)");
//    preparedStatement.setString(1, fileName);
//    preparedStatement.setBlob(2, fileContent);
//    preparedStatement.executeUpdate();
//
//    response.sendRedirect("index.html");
//} catch (Exception e) {
//    e.printStackTrace();
//    response.getWriter().println("Error: " + e.getMessage());
//}
//}
//
//private String getFileName(final Part part) {
//final String partHeader = part.getHeader("content-disposition");
//for (String content : partHeader.split(";")) {
//    if (content.trim().startsWith("filename")) {
//        return content.substring(content.indexOf('.') + 1).trim().replace("\"", "");
//    }
//}
//return null;
//}



private void handleFileUploadnote(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
Part filePart = request.getPart("file");
String fileName = getnotesFileName(filePart);

try  {
	Class.forName("com.mysql.cj.jdbc.Driver");
	InputStream fileContent = filePart.getInputStream();
    Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
    // Insert file into the database
    PreparedStatement preparedStatement = connection
            .prepareStatement("INSERT INTO QuestionBank (filename, filedata) VALUES (?, ?)");
    preparedStatement.setString(1, fileName);
    preparedStatement.setBlob(2, fileContent);
    preparedStatement.executeUpdate();

    response.sendRedirect("admin_panel.html");
} catch (Exception e) {
    e.printStackTrace();
    response.getWriter().println("Error: " + e.getMessage());
}
}

private String getnotesFileName(final Part part) {
final String partHeader = part.getHeader("content-disposition");
for (String content : partHeader.split(";")) {
    if (content.trim().startsWith("filename")) {
        return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
    }
}
return null;
}




	}


