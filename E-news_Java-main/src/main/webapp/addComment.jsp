<%@ page import="java.sql.*" %>
<%
    // Retrieve form data
    String newsId = request.getParameter("news_id");
    String userId = request.getParameter("user_id");
    String author = request.getParameter("author");
    String email = request.getParameter("email");
    String profilePicture = request.getParameter("profile_picture");
    String comment = request.getParameter("comment");

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/enews";
    String user = "root";
    String password = "";

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the database connection
        Connection conn = DriverManager.getConnection(url, user, password);

        // Insert the comment into the database
        String query = "INSERT INTO comments (news_id, user_id, author, email, profile_picture, content, comment_date) VALUES (?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, Integer.parseInt(newsId));
        pstmt.setInt(2, Integer.parseInt(userId));
        pstmt.setString(3, author);
        pstmt.setString(4, email);
        pstmt.setString(5, profilePicture);
        pstmt.setString(6, comment);

        int rowsInserted = pstmt.executeUpdate();

        // Close the database resources
        pstmt.close();
        conn.close();

        // Redirect back to the news article page
        if (rowsInserted > 0) {
            response.sendRedirect("single-news.jsp?id=" + newsId);
        } else {
            out.println("<p class='text-danger'>Failed to add comment. Please try again.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
    }
%>