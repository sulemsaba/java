<%@ page import="java.sql.*" %>
<%
    String commentId = request.getParameter("comment_id");
    String action = request.getParameter("action");
    String userId = (String) session.getAttribute("user_id"); // Retrieve user_id from session

    if (userId == null) {
        out.print("You must be logged in to like/dislike.");
        return;
    }

    String url = "jdbc:mysql://localhost:3306/enews";
    String user = "root";
    String password = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);

        // Debug: Print user_id and comment_id
        System.out.println("User ID: " + userId);
        System.out.println("Comment ID: " + commentId);

        // Check if the user has already liked/disliked this comment
        String checkQuery = "SELECT * FROM comment_likes WHERE comment_id = ? AND user_id = ?";
        PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
        checkStmt.setInt(1, Integer.parseInt(commentId));
        checkStmt.setInt(2, Integer.parseInt(userId));
        ResultSet rs = checkStmt.executeQuery();

        if (rs.next()) {
            // User has already liked/disliked this comment
            String previousAction = rs.getString("action");

            if (previousAction.equals(action)) {
                // User is trying to perform the same action again (e.g., like a comment they already liked)
                out.print("You have already " + action + "d this comment.");
            } else {
                // User is switching from like to dislike or vice versa
                // Step 1: Remove the previous action
                String deleteQuery = "DELETE FROM comment_likes WHERE comment_id = ? AND user_id = ?";
                PreparedStatement deleteStmt = conn.prepareStatement(deleteQuery);
                deleteStmt.setInt(1, Integer.parseInt(commentId));
                deleteStmt.setInt(2, Integer.parseInt(userId));
                deleteStmt.executeUpdate();

                // Step 2: Decrement the previous action count
                String decrementQuery = "UPDATE comments SET " + previousAction + "s = " + previousAction + "s - 1 WHERE id = ?";
                PreparedStatement decrementStmt = conn.prepareStatement(decrementQuery);
                decrementStmt.setInt(1, Integer.parseInt(commentId));
                decrementStmt.executeUpdate();

                // Step 3: Insert the new action
                String insertQuery = "INSERT INTO comment_likes (comment_id, user_id, action) VALUES (?, ?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
                insertStmt.setInt(1, Integer.parseInt(commentId));
                insertStmt.setInt(2, Integer.parseInt(userId));
                insertStmt.setString(3, action);
                insertStmt.executeUpdate();

                // Step 4: Increment the new action count
                String incrementQuery = "UPDATE comments SET " + action + "s = " + action + "s + 1 WHERE id = ?";
                PreparedStatement incrementStmt = conn.prepareStatement(incrementQuery);
                incrementStmt.setInt(1, Integer.parseInt(commentId));
                incrementStmt.executeUpdate();

                out.print("Success");
            }
        } else {
            // User has not liked/disliked this comment before
            // Insert the new action
            String insertQuery = "INSERT INTO comment_likes (comment_id, user_id, action) VALUES (?, ?, ?)";
            PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
            insertStmt.setInt(1, Integer.parseInt(commentId));
            insertStmt.setInt(2, Integer.parseInt(userId));
            insertStmt.setString(3, action);
            insertStmt.executeUpdate();

            // Increment the action count
            String incrementQuery = "UPDATE comments SET " + action + "s = " + action + "s + 1 WHERE id = ?";
            PreparedStatement incrementStmt = conn.prepareStatement(incrementQuery);
            incrementStmt.setInt(1, Integer.parseInt(commentId));
            incrementStmt.executeUpdate();

            out.print("Success");
        }

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.print("Error: " + e.getMessage());
    }
%>