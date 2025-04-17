<%@ page import="java.sql.*" %>
<%
    String userId = (String) session.getAttribute("userId");
    int newsId = Integer.parseInt(request.getParameter("newsId"));

    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection conn = null;
    PreparedStatement checkStmt = null;
    PreparedStatement updateStmt = null;
    ResultSet rs = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enews", "root", "");

        // Check if the user already liked the post
        checkStmt = conn.prepareStatement("SELECT * FROM likes WHERE user_id = ? AND news_id = ?");
        checkStmt.setString(1, userId);
        checkStmt.setInt(2, newsId);
        rs = checkStmt.executeQuery();

        boolean liked = rs.next();
        int newLikeCount = 0;

        if (liked) {
            // Unlike the post
            updateStmt = conn.prepareStatement("DELETE FROM likes WHERE user_id = ? AND news_id = ?");
            updateStmt.setString(1, userId);
            updateStmt.setInt(2, newsId);
            updateStmt.executeUpdate();
            
            // Decrease like count
            updateStmt = conn.prepareStatement("UPDATE news SET likes = likes - 1 WHERE id = ?");
            updateStmt.setInt(1, newsId);
            updateStmt.executeUpdate();
        } else {
            // Like the post
            updateStmt = conn.prepareStatement("INSERT INTO likes (user_id, news_id) VALUES (?, ?)");
            updateStmt.setString(1, userId);
            updateStmt.setInt(2, newsId);
            updateStmt.executeUpdate();
            
            // Increase like count
            updateStmt = conn.prepareStatement("UPDATE news SET likes = likes + 1 WHERE id = ?");
            updateStmt.setInt(1, newsId);
            updateStmt.executeUpdate();
        }

        // Get the updated like count
        updateStmt = conn.prepareStatement("SELECT likes FROM news WHERE id = ?");
        updateStmt.setInt(1, newsId);
        rs = updateStmt.executeQuery();

        if (rs.next()) {
            newLikeCount = rs.getInt("likes");
        }

        out.print(newLikeCount);
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (checkStmt != null) checkStmt.close();
        if (updateStmt != null) updateStmt.close();
        if (conn != null) conn.close();
    }
%>
