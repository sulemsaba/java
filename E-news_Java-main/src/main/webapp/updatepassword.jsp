<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
String email = request.getParameter("email");
String newPassword = request.getParameter("Password");
String password = (String) session.getAttribute("password");
String cpassword = request.getParameter("CPassword");



if (email == null || email.trim().isEmpty() || newPassword == null || newPassword.trim().isEmpty()) {
    response.sendRedirect("changepassword.jsp?message=Please fill in all fields.");
    return;
}

// Database connection details
String url = "jdbc:mysql://localhost:3306/enews";
String user = "root";
String pass = "";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, pass);

    // Check if the email exists in the database
    String checkUserQuery = "SELECT * FROM registrationform WHERE email = ?";
    pstmt = conn.prepareStatement(checkUserQuery);
    pstmt.setString(1, email);
    rs = pstmt.executeQuery();
  

    if (rs.next()) {
        // Update password
        String updateQuery = "UPDATE registrationform SET password = ? WHERE email = ?";
        pstmt = conn.prepareStatement(updateQuery);
        pstmt.setString(1, newPassword); // Use hashed password for security in real apps
        pstmt.setString(2, email);
        int updatedRows = pstmt.executeUpdate();

        if (updatedRows > 0) {
            response.sendRedirect("changepassword.jsp?message=Password updated successfully!");
        } else {
            response.sendRedirect("changepassword.jsp?message=Error updating password. Try again.");
        }
    } else {
        response.sendRedirect("changepassword.jsp?message=User not found. Please check your email.");
    }
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("changepassword.jsp?message=Error: " + e.getMessage());
} finally {
    if (rs != null) rs.close();
    if (pstmt != null) pstmt.close();
    if (conn != null) conn.close();
}
%>
