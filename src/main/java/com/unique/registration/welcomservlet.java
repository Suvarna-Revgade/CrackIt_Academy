package com.unique.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class welcomservlet
 */
@WebServlet("/welcomeservlet")
public class welcomservlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
      HttpSession session = request.getSession(false);
      if (session != null && session.getAttribute("username") != null) {
          response.setContentType("text/html");
          PrintWriter out = response.getWriter();
          out.println("<h2>Welcome, " + session.getAttribute("username") + "!</h2>");
          out.println("<a href='logout'>Logout</a>");
      } else {
          response.sendRedirect("login.html");
      }
  }
}
