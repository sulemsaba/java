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

@WebServlet("/addnewsbyadmin")
@MultipartConfig(maxFileSize = 1024 * 1024 * 50) // 16MB limit for file uploads
public class addnewsbyadmin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public addnewsbyadmin() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 HttpSession session = request.getSession(false);
         
         // 1. First check if user OR admin is logged in
         if (session == null || (session.getAttribute("user") == null && session.getAttribute("admin") == null)) {
             response.sendRedirect("login.jsp?message=Please login to post news");
             return;
         }
        
        	// Retrieve form data
             String title = request.getParameter("title");
             String content = request.getParameter("content");
             String author = request.getParameter("author");
             String category = request.getParameter("category");
             String otherCategory = request.getParameter("other_category");

             // If "Other" category is selected, use the custom category input
             if ("Other".equals(category) && otherCategory != null && !otherCategory.trim().isEmpty()) {
                 category = otherCategory;
             }

             // Get the current date
             String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
             // Handling file upload
             Part filePart = request.getPart("image");
             String imageFileName = filePart.getSubmittedFileName();
             String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

             File uploadDir = new File(uploadPath);
             if (!uploadDir.exists()) {
                 uploadDir.mkdir();
             }

             String imagePath = uploadPath + File.separator + imageFileName;
             filePart.write(imagePath);


             // Database connection details
             String url = "jdbc:mysql://localhost:3306/enews";
             String user = "root";
             String pass = "";

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

                 // Redirect based on result
                 if (rowsInserted > 0) {
                     response.sendRedirect("addnews.jsp?message=News Is Added! You can Check now.");
                 } else {
                     response.sendRedirect("addnews.jsp?message=Uploading News failed. Please try again.");
                 }
             } catch (Exception e) {
                 e.printStackTrace();
                 response.sendRedirect("addnews.jsp?message=Error: " + e.getMessage());
             }
         }

    	 
    }

