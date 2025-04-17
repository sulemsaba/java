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

@WebServlet("/review")
@MultipartConfig( fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10,      // 10MB
maxRequestSize = 1024 * 1024 * 50 )   // 50MB) // 16MB limit for file uploads
public class review extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp?message=Please login to add a review.");
            return;
        }
        else {
        	// Get form data
            String name = request.getParameter("name");
            String profession = request.getParameter("profession");
            String reviewText = request.getParameter("review");
            Part filePart = request.getPart("pic");

            // Server upload path
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            // Basic validation
            if (name == null || name.isEmpty() ||
                profession == null || profession.isEmpty() ||
                reviewText == null || reviewText.isEmpty() ||
                filePart == null || filePart.getSize() == 0) {
                response.sendRedirect("index_2.jsp?message=All fields are required, including the image!");
                return;
            }

            // Save the uploaded file
            String imageFileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
            String imagePath = uploadPath + File.separator + imageFileName;
            filePart.write(imagePath);

            // Database connection details
            String url = "jdbc:mysql://localhost:3306/enews";
            String user = "root";
            String pass = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, user, pass);
                String sql = "INSERT INTO review (name, profession, review, pic) VALUES (?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, name);
                stmt.setString(2, profession);
                stmt.setString(3, reviewText);
                stmt.setString(4, "uploads/" + imageFileName);

                int result = stmt.executeUpdate();
                conn.close();

                // Redirect to index_2.jsp with a success message
                if (result > 0) {
                    response.sendRedirect("index_2.jsp?message=Thank you for your review!");
                } else {
                    response.sendRedirect("index_2.jsp?message=Failed to submit the review.");
                }
            } catch (Exception e) {
            	 e.printStackTrace(); // Log the exception
            	    response.sendRedirect("index_2.jsp?message=Error: " + e.getMessage());
            }
        }

        
    }
}