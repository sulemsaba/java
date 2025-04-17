package com.enews.servlets;

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
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/EditUserServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,    // 1 MB
    maxFileSize = 1024 * 1024 * 10,     // 10 MB
    maxRequestSize = 1024 * 1024 * 100  // 100 MB
)
public class EditUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id == null || id.isEmpty()) {
            response.sendRedirect("profile.jsp?message=Invalid user ID.");
            return;
        }

        String url = "jdbc:mysql://localhost:3306/enews";
        String user = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);

            String query = "SELECT * FROM registrationform WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(id));
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("id", rs.getInt("id"));
                request.setAttribute("fname", rs.getString("fname"));
                request.setAttribute("mname", rs.getString("mname"));
                request.setAttribute("lname", rs.getString("lname"));
                request.setAttribute("dob", rs.getString("dob"));
                request.setAttribute("gender", rs.getString("gender"));
                request.setAttribute("address", rs.getString("address"));
                request.setAttribute("image", rs.getString("image"));

                request.getRequestDispatcher("EditUser.jsp").forward(request, response);
            } else {
                response.sendRedirect("profile.jsp?message=User not found.");
            }

            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("profile.jsp?message=Error fetching user details.");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get all form parameters
        String id = request.getParameter("id");
        String fname = request.getParameter("fname");
        String mname = request.getParameter("mname");
        String lname = request.getParameter("lname");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String image = request.getParameter("image"); // Existing image path

        // Handle file upload
        Part filePart = request.getPart("imageFile");
        if (filePart != null && filePart.getSize() > 0) {
            // Only process if a new file was uploaded
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            
            // Create uploads directory if it doesn't exist
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            
            // Save the file
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
            
            // Update the image path to store in database
            image = "uploads/" + fileName;
        }

        // Database connection and update
        String url = "jdbc:mysql://localhost:3306/enews";
        String user = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);

            String query = "UPDATE registrationform SET fname=?, mname=?, lname=?, dob=?, gender=?, address=?, image=? WHERE id=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, fname);
            pstmt.setString(2, mname);
            pstmt.setString(3, lname);
            pstmt.setString(4, dob);
            pstmt.setString(5, gender);
            pstmt.setString(6, address);
            pstmt.setString(7, image);
            pstmt.setInt(8, Integer.parseInt(id));

            int rowsUpdated = pstmt.executeUpdate();
            
            pstmt.close();
            con.close();

            if (rowsUpdated > 0) {
                // Update session attributes
                HttpSession session = request.getSession();
                session.setAttribute("fname", fname);
                session.setAttribute("lname", lname);
                session.setAttribute("profile_image", image);
                
                response.sendRedirect("profile.jsp?message=Profile updated successfully.");
            } else {
                response.sendRedirect("EditUser.jsp?id=" + id + "&message=Failed to update profile.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("EditUser.jsp?id=" + id + "&message=Error updating profile: " + e.getMessage());
        }
    }
}