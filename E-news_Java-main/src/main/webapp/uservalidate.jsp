<%@ page import="java.sql.*, jakarta.servlet.http.Cookie" %>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("Password");

    // Check for admin credentials
    if ("asraflosted@gmail.com".equals(email) && "Najmin@@@786".equals(password)) {
        session.setAttribute("admin", email);
        session.setAttribute("email", email);
        session.setAttribute("role", "admin");

        Cookie adminCookie = new Cookie("userRole", "admin");
        adminCookie.setMaxAge(60 * 60 * 24);
        response.addCookie(adminCookie);

        Cookie emailCookie = new Cookie("userEmail", email);
        emailCookie.setMaxAge(60 * 60 * 24);
        response.addCookie(emailCookie);

        response.sendRedirect("adminindex.jsp");
        return;
    }

    // Database Connection
    String url = "jdbc:mysql://localhost:3306/enews";
    String dbUser = "root"; 
    String dbPassword = ""; 

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(url, dbUser, dbPassword);

    String query = "SELECT * FROM registrationform WHERE email = ? AND password = ?";
    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1, email);
    ps.setString(2, password);

    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        session.setAttribute("user", email);
        session.setAttribute("email", email);
        session.setAttribute("profile_image", rs.getString("image"));
        session.setAttribute("userEmail", rs.getString("email"));
        session.setAttribute("fname", rs.getString("fname"));
        session.setAttribute("mname", rs.getString("mname"));
        session.setAttribute("lname", rs.getString("lname"));
        session.setAttribute("dob", rs.getString("dob"));
        session.setAttribute("address", rs.getString("address"));
        session.setAttribute("gender", rs.getString("gender"));
        session.setAttribute("contact", rs.getString("contact"));
        session.setAttribute("password", rs.getString("password"));
        session.setAttribute("name", rs.getString("fname"));
        session.setAttribute("user_id", rs.getString("id"));
        
        

        Cookie userCookie = new Cookie("userRole", "user");
        userCookie.setMaxAge(60 * 60 * 24);
        response.addCookie(userCookie);

        Cookie userEmailCookie = new Cookie("userEmail", email);
        userEmailCookie.setMaxAge(60 * 60 * 24);
        response.addCookie(userEmailCookie);

        response.sendRedirect("index.jsp");
    } else {
        response.sendRedirect("login.jsp?message=Invalid email or password!");
    }

    rs.close();
    ps.close();
    con.close();
%>
