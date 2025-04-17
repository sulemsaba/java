<%@ page import="java.sql.*" %>
<%
    String commentId = request.getParameter("comment_id");
    String userId = (String) session.getAttribute("user_id");

    if (userId == null) {
        out.print("You must be logged in to delete a comment.");
        return;
    }

    String url = "jdbc:mysql://localhost:3306/enews";
    String user = "root";
    String password = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);

        // Debug: Print connection success
        System.out.println("Database connection successful.");

        // Delete the comment
        String deleteQuery = "DELETE FROM comments WHERE id = ? AND user_id = ?";
        PreparedStatement deleteStmt = conn.prepareStatement(deleteQuery);
        deleteStmt.setInt(1, Integer.parseInt(commentId));
        deleteStmt.setInt(2, Integer.parseInt(userId));
        int rowsDeleted = deleteStmt.executeUpdate();

        if (rowsDeleted > 0) {
            out.print("Success");
        } else {
            out.print("You can only delete your own comments.");
        }

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.print("Error: " + e.getMessage());
    }
%>