package com.Admiin;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class pgTimetableMess
 */
@WebServlet("/pgTimetableMess")

public class pgTimetableMess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pgTimetableMess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String Day = request.getParameter("Days");
		String breakfast = request.getParameter("Breakfast");
		String lunch = request.getParameter("Lunch");
		String dinner = request.getParameter("Dinner");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crackitacademy", "root",
					"Root@123");
			PreparedStatement pst = con.prepareStatement("insert into pgtimetable values(?,?,?,?) ");

			pst.setString(1, Day);
			pst.setString(2,breakfast);
			pst.setString(3, lunch);
			pst.setString(4, dinner);

		

				if (pst.executeUpdate() > 0) {
					RequestDispatcher rd = request.getRequestDispatcher("admin_panel.html");
					rd.forward(request, response);
				}
			
			con.close();
		} catch (Exception e) {
			out.println(e);
		}
		out.close();
	}



	}


