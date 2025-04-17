package com.enews.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/EditNewsServlet")
public class EditNewsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp?message=Please login as admin to access this page.");
            return;
        }

        String id = request.getParameter("id");
        if (id == null || id.isEmpty()) {
            response.sendRedirect("availablenews.jsp?message=Invalid news ID.");
            return;
        }

        String url = "jdbc:mysql://localhost:3306/enews";
        String user = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);

            String query = "SELECT * FROM news WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(id));
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("id", rs.getInt("id"));
                request.setAttribute("title", rs.getString("Title"));
                request.setAttribute("name", rs.getString("name"));
                request.setAttribute("content", rs.getString("content"));
                request.setAttribute("category", rs.getString("category"));
                request.setAttribute("date", rs.getString("date"));
                request.setAttribute("like_count", rs.getString("like_count"));
                request.setAttribute("image", rs.getString("videos"));

                request.getRequestDispatcher("editnews.jsp").forward(request, response);
            } else {
                response.sendRedirect("availablenews.jsp?message=News not found.");
            }

            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("availablenews.jsp?message=Error fetching news details.");
        }
    }
}