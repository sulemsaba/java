<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
// Check if the admin session exists
if (session.getAttribute("admin") == null) {
    response.sendRedirect("login.jsp?message=Please login as admin to access this page.");
    return;
}

// Get form data
String id = request.getParameter("id");
String title = request.getParameter("title");
String name = request.getParameter("name");
String content = request.getParameter("content");
String category = request.getParameter("category");
String date = request.getParameter("date");
String likeCount = request.getParameter("like_count");
String image = request.getParameter("image");

// Database connection
String url = "jdbc:mysql://localhost:3306/enews";
String user = "root";
String password = "";
Connection con = null;
PreparedStatement pstmt = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(url, user, password);

    // Update news
    String query = "UPDATE news SET Title = ?, name = ?, content = ?, category = ?, date = ?, like_count = ?, videos = ? WHERE id = ?";
    pstmt = con.prepareStatement(query);
    pstmt.setString(1, title);
    pstmt.setString(2, name);
    pstmt.setString(3, content);
    pstmt.setString(4, category);
    pstmt.setString(5, date);
    pstmt.setInt(6, Integer.parseInt(likeCount));
    pstmt.setString(7, image);
    pstmt.setInt(8, Integer.parseInt(id));
    pstmt.executeUpdate();

    response.sendRedirect("addednews.jsp?message=News updated successfully.");
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("addednews.jsp?message=Error updating news.");
} finally {
    if (pstmt != null) pstmt.close();
    if (con != null) con.close();
}
%>