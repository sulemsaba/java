<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
// Check if the user is logged in
HttpSession userSession = request.getSession(false);
if (userSession == null || userSession.getAttribute("user") == null) {
    // User is not logged in, redirect to login page
    response.sendRedirect("login.jsp?message=Please login to submit the contact form.");
    return;
}

// Database connection details
String url = "jdbc:mysql://localhost:3306/enews";
String user = "root";
String password = "";

// Retrieve form data
String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String subject = request.getParameter("subject");
String message = request.getParameter("message");

// Validate required fields
if (name == null || name.trim().isEmpty() || email == null || email.trim().isEmpty()) {
    response.sendRedirect("contact.jsp?message=Name and Email are required fields.");
} else {
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the database connection
        conn = DriverManager.getConnection(url, user, password);

        // SQL query to insert data into the contact table
        String sql = "INSERT INTO contact (name, email, phone, subject, message) VALUES (?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);

        // Set the form data into the prepared statement
        pstmt.setString(1, name);
        pstmt.setString(2, email);
        pstmt.setString(3, phone);
        pstmt.setString(4, subject);
        pstmt.setString(5, message);

        // Execute the query
        int rowsInserted = pstmt.executeUpdate();

        if (rowsInserted > 0) {
            response.sendRedirect("contact.jsp?message=Thank you for contacting us! We will get back to you soon.");
        } else {
            response.sendRedirect("contact.jsp?message=Failed to submit your message. Please try again.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("contact.jsp?message=An error occurred while processing your request. Please try again later.");
    } finally {
        // Close the database resources
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
}
%>