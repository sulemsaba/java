<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    String userId = (String) session.getAttribute("user_id");
    if (userId == null) {
        out.print("{\"redirect\": true}");
        return;
    }

    String newsId = request.getParameter("id");
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    boolean liked = false;
    int likeCount = 0;

    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enews", "root", "");

        // Check if the user already liked the post
        stmt = conn.prepareStatement("SELECT 1 FROM likes WHERE user_id = ? AND news_id = ?");
        stmt.setString(1, userId);
        stmt.setString(2, newsId);
        rs = stmt.executeQuery();

        if (rs.next()) {
            // Unlike
            stmt = conn.prepareStatement("DELETE FROM likes WHERE user_id = ? AND news_id = ?");
            stmt.setString(1, userId);
            stmt.setString(2, newsId);
            stmt.executeUpdate();

            stmt = conn.prepareStatement("UPDATE news SET like_count = like_count - 1 WHERE id = ?");
            stmt.setString(1, newsId);
            stmt.executeUpdate();

            liked = false;
        } else {
            // Like
            stmt = conn.prepareStatement("INSERT INTO likes (user_id, news_id) VALUES (?, ?)");
            stmt.setString(1, userId);
            stmt.setString(2, newsId);
            stmt.executeUpdate();

            stmt = conn.prepareStatement("UPDATE news SET like_count = like_count + 1 WHERE id = ?");
            stmt.setString(1, newsId);
            stmt.executeUpdate();

            liked = true;
        }

        // Fetch updated like count
        stmt = conn.prepareStatement("SELECT like_count FROM news WHERE id = ?");
        stmt.setString(1, newsId);
        rs = stmt.executeQuery();
        if (rs.next()) {
            likeCount = rs.getInt("like_count");
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }

    out.print("{\"liked\": " + liked + ", \"likes\": " + likeCount + "}");
%>
