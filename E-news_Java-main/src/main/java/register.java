import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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

@WebServlet("/register")
@MultipartConfig(maxFileSize = 16177215) // 16MB limit for file uploads
public class register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public register() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String firstName = request.getParameter("firstName");
        String middleName = request.getParameter("middleName");
        String lastName = request.getParameter("lastName");
        String contactNumber = request.getParameter("contactNumber");
        String email = request.getParameter("email");
        String password = request.getParameter("Password");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");

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

            // **Check if email already exists**
            String checkEmailQuery = "SELECT COUNT(*) FROM registrationform WHERE email = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkEmailQuery);
            checkStmt.setString(1, email);
            ResultSet rs = checkStmt.executeQuery();
            rs.next();

            if (rs.getInt(1) > 0) {
                conn.close();
                response.sendRedirect("registrationform.jsp?message=User already exists! Try a different email.");
                return;
            }

            // Insert query
            String sql = "INSERT INTO registrationform (fname, mname, lname, contact, email, password, dob, gender, address, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, firstName);
            stmt.setString(2, middleName);
            stmt.setString(3, lastName);
            stmt.setString(4, contactNumber);
            stmt.setString(5, email);
            stmt.setString(6, password);
            stmt.setString(7, dob);
            stmt.setString(8, gender);
            stmt.setString(9, address);
            stmt.setString(10, "uploads/" + imageFileName);

            int rowsInserted = stmt.executeUpdate();
            conn.close();

            // Redirect based on result
            if (rowsInserted > 0) {
                response.sendRedirect("registrationform.jsp?message=Registration completed! You can login now.");
            } else {
                response.sendRedirect("registrationform.jsp?message=Registration failed. Please try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("registrationform.jsp?message=Error: " + e.getMessage());
        }
    }
}
