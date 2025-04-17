<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete User</title>
</head>
<body>
    <%
    // Retrieve the 'id' parameter from the request
    String id = request.getParameter("id");

    if (id != null && !id.isEmpty()) {
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/enews"; // Replace with your database name
        String user = "root"; // Replace with your database username
        String password = ""; // Replace with your database password

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            con = DriverManager.getConnection(url, user, password);

            // Prepare the SQL DELETE query
            String sql = "DELETE FROM registrationform WHERE id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(id));

            // Execute the query
            int rowsDeleted = pstmt.executeUpdate();

            if (rowsDeleted > 0) {
                // If deletion is successful, redirect to the main page
                response.sendRedirect("checkuser.jsp"); // Replace with your main page URL
            } else {
                // If no rows were deleted, display an error message
                out.println("<p>No user found with the specified ID.</p>");
            }
        } catch (Exception e) {
            // Handle any exceptions
            e.printStackTrace();
            out.println("<p>An error occurred while deleting the user.</p>");
        } finally {
            // Close the database resources
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    } else {
        // If no 'id' parameter is provided, display an error message
        out.println("<p>Invalid request. No user ID provided.</p>");
    }
    %>
</body>
</html>