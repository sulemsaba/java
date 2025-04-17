import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/Updatenews")
public class Updatenews extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newsId = request.getParameter("id");
        if (newsId == null || newsId.trim().isEmpty()) {
            response.sendRedirect("addednews.jsp?message=No news selected for editing.");
            return;
        }

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String name = request.getParameter("author");
        String category = request.getParameter("category");
        Part filePart = request.getPart("image");

        String url = "jdbc:mysql://localhost:3306/enews";
        String user = "root";
        String password = "";

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            Class.forName("com.mysql.cj.jdbc.Driver");

            StringBuilder sql = new StringBuilder("UPDATE news SET ");
            boolean isUpdated = false;

            if (title != null && !title.trim().isEmpty()) {
                sql.append("Title = ?, ");
                isUpdated = true;
            }
            if (content != null && !content.trim().isEmpty()) {
                sql.append("content = ?, ");
                isUpdated = true;
            }
            if (name != null && !name.trim().isEmpty()) {
                sql.append("name = ?, ");
                isUpdated = true;
            }
            if (category != null && !category.trim().isEmpty()) {
                sql.append("category = ?, ");
                isUpdated = true;
            }
            if (filePart != null && filePart.getSize() > 0) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();

                String fileName = filePart.getSubmittedFileName();
                filePart.write(uploadPath + File.separator + fileName);
                sql.append("videos = ?, ");
                isUpdated = true;
            }

            if (!isUpdated) {
                response.sendRedirect("addednews.jsp?message=No changes detected.");
                return;
            }

            sql.delete(sql.length() - 2, sql.length()); // Remove the trailing comma
            sql.append(" WHERE id = ?");

            PreparedStatement stmt = conn.prepareStatement(sql.toString());
            int index = 1;
            if (title != null && !title.trim().isEmpty()) stmt.setString(index++, title);
            if (content != null && !content.trim().isEmpty()) stmt.setString(index++, content);
            if (name != null && !name.trim().isEmpty()) stmt.setString(index++, name);
            if (category != null && !category.trim().isEmpty()) stmt.setString(index++, category);
            if (filePart != null && filePart.getSize() > 0) stmt.setString(index++, "uploads/" + filePart.getSubmittedFileName());
            stmt.setString(index, newsId);

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("addednews.jsp?message=News updated successfully!");
            } else {
                response.sendRedirect("addednews.jsp?message=Failed to update news.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addednews.jsp?message=Error: " + e.getMessage());
        }
    }
}
