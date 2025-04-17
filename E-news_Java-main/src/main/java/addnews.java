import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
@WebServlet("/addnews")
@MultipartConfig(maxFileSize = 1024 * 1024 * 50) // 50MB limit for file uploads
public class addnews extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // 1. First check if user OR admin is logged in
        if (session == null || (session.getAttribute("user") == null && session.getAttribute("admin") == null)) {
            response.sendRedirect("login.jsp?message=Please login to post news");
            return;
        }
        
        // 2. Get all form parameters
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        String otherCategory = request.getParameter("other_category");
        Part filePart = request.getPart("image");
        
        // 3. Validate all required fields
        if (title == null || title.trim().isEmpty() ||
            content == null || content.trim().isEmpty() ||
            author == null || author.trim().isEmpty() ||
            category == null || category.trim().isEmpty() ||
            filePart == null || filePart.getSize() == 0) {
            
            response.sendRedirect("news.jsp?message=All fields are required");
            return;
        }
        
        // 4. Handle "Other" category selection
        if ("Other".equals(category)) {
            if (otherCategory == null || otherCategory.trim().isEmpty()) {
                response.sendRedirect("news.jsp?message=Please specify custom category");
                return;
            }
            category = otherCategory;
        }
        
        // 5. Process file upload
        String imageFileName = filePart.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        
        // Create upload directory if it doesn't exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        
        // Save the file
        String imagePath = uploadPath + File.separator + imageFileName;
        try {
            filePart.write(imagePath);
        } catch (IOException e) {
            response.sendRedirect("news.jsp?message=Error uploading image");
            return;
        }
        
        // 6. Database operations
        String url = "jdbc:mysql://localhost:3306/enews";
        String user = "root";
        String pass = "";
        
        // Get current date
        String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            
            // Get email from session - check both user and admin cases
            String userEmail = (String) session.getAttribute("email");
            
            // Insert news with email from session
            String sql = "INSERT INTO news (Title, content, name, videos, category, date, email) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, title);
            stmt.setString(2, content);
            stmt.setString(3, author);
            stmt.setString(4, "uploads/" + imageFileName);
            stmt.setString(5, category);
            stmt.setString(6, currentDate);
            stmt.setString(7, userEmail);
            
            int rowsInserted = stmt.executeUpdate();
            conn.close();
            
            if (rowsInserted > 0) {
                response.sendRedirect("news.jsp?message=News added successfully");
            } else {
                response.sendRedirect("news.jsp?message=Failed to add news");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            // Delete the uploaded file if database operation failed
            new File(imagePath).delete();
            response.sendRedirect("news.jsp?message=Database error: " + e.getMessage());
        }
    }
}