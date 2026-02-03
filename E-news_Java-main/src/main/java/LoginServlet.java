

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String email = request.getParameter("email");
	        String password = request.getParameter("password");

	        try {
	            // Database connection
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/enews", "root", " ");

	            // Check user's credentials
	            String query = "SELECT * FROM users WHERE email=? AND password=?";
	            PreparedStatement pst = con.prepareStatement(query);
	            pst.setString(1, email);
	            pst.setString(2, password);
	            ResultSet rs = pst.executeQuery();

	            if (rs.next()) {
	                // Store data in session
	                HttpSession session = request.getSession();
	                session.setAttribute("user_email", email);
	                session.setAttribute("user_name", rs.getString("name"));

	                // Redirect to profile page
	                response.sendRedirect("profile.jsp");
	            } else {
	                response.sendRedirect("login.jsp?error=Invalid credentials");
	            }

	            con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}


