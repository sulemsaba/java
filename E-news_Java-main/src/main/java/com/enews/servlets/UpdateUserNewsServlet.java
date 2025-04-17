package com.enews.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/UpdateUserNewsServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class UpdateUserNewsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Directory where uploaded files will be saved
    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp?message=Please login as admin to access this page.");
            return;
        }

        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String name = request.getParameter("name");
        String content = request.getParameter("content");
        String category = request.getParameter("category");
        String date = request.getParameter("date");
        String likeCount = request.getParameter("like_count");
        
        // Get the current image path from the database
        String currentImagePath = getCurrentImagePath(id);
        
        // Handle file upload
        Part filePart = request.getPart("image");
        String imagePath = currentImagePath; // Default to current image
        
        if (filePart != null && filePart.getSize() > 0) {
            // Get the application's real path
            String appPath = request.getServletContext().getRealPath("");
            
            // Construct the upload directory path
            String uploadPath = appPath + UPLOAD_DIR;
            
            // Create the directory if it doesn't exist
            Path uploadDir = Paths.get(uploadPath);
            if (!Files.exists(uploadDir)) {
                Files.createDirectories(uploadDir);
            }
            
            // Get the submitted file name
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            
            // Generate a unique file name to prevent overwriting
            String uniqueFileName = System.currentTimeMillis() + "_" + fileName;
            
            // Save the file
            try (InputStream fileContent = filePart.getInputStream()) {
                Path filePath = uploadDir.resolve(uniqueFileName);
                Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);
            }
            
            // Set the new image path (relative to webapp)
            imagePath = UPLOAD_DIR + "/" + uniqueFileName;
        }

        String url = "jdbc:mysql://localhost:3306/enews";
        String user = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);

            String query = "UPDATE news SET Title = ?, name = ?, content = ?, category = ?, date = ?, like_count = ?, videos = ? WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, title);
            pstmt.setString(2, name);
            pstmt.setString(3, content);
            pstmt.setString(4, category);
            pstmt.setString(5, date);
            pstmt.setInt(6, Integer.parseInt(likeCount));
            pstmt.setString(7, imagePath);
            pstmt.setInt(8, Integer.parseInt(id));
            pstmt.executeUpdate();

            response.sendRedirect("useraddednews.jsp?message=News updated successfully.");

            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("useraddednews.jsp?message=Error updating news.");
        }
    }
    
    private String getCurrentImagePath(String id) {
        String url = "jdbc:mysql://localhost:3306/enews";
        String user = "root";
        String password = "";
        String currentImagePath = "";
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);

            String query = "SELECT videos FROM news WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(id));
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                currentImagePath = rs.getString("videos");
            }

            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return currentImagePath;
    }
}