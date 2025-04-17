<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    		<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>

<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

		<!-- title -->
<title>E-news</title>

<!-- favicon -->
<link rel="shortcut icon" type="image/png" href="assets/img/A3.png">
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- fontawesome -->
	<link rel="stylesheet" href="assets/css/all.min.css">
	<!-- bootstrap -->
	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
	<!-- owl carousel -->
	<link rel="stylesheet" href="assets/css/owl.carousel.css">
	<!-- magnific popup -->
	<link rel="stylesheet" href="assets/css/magnific-popup.css">
	<!-- animate css -->
	<link rel="stylesheet" href="assets/css/animate.css">
	<!-- mean menu css -->
	<link rel="stylesheet" href="assets/css/meanmenu.min.css">
	<!-- main style -->
	<link rel="stylesheet" href="assets/css/main.css">
	<!-- responsive -->
	<link rel="stylesheet" href="assets/css/responsive.css">

</head>
<body>
<style>
		.site-logo a h5 {
   margin-top:15px;
}
	.text-orange {
    color: #ff6600; /* Orange color */
    font-weight: bold; /* Optional: Makes the text bold */
}	
.profile-menu {
    position: relative;
}

.profile-menu .sub-menu {
    display: none;
    position: absolute;
    top: 100%;
    right: 0;
    background: #fff;
    list-style: none;
    padding: 10px;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    min-width: 150px;
    z-index: 1000;
}

.profile-menu:hover .sub-menu {
    display: block;
}

.profile-menu .sub-menu li {
    padding: 5px 10px;
}

.profile-menu .sub-menu li a {
    text-decoration: none;
    color: #333;
    display: block;
    font-weight: 600;
}

.profile-menu .sub-menu li a:hover {
    color: #ff6600;
}
.loginbtn{
  background-color:orange;

}


		</style>

	
	<!--PreLoader-->
    <div class="loader">
        <div class="loader-inner">
            <div class="circle"></div>
        </div>
    </div>
    <!--PreLoader Ends-->
	
		<!-- header -->
		<div class="top-header-area" id="sticker">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-sm-12 text-center">
						<div class="main-menu-wrap">
							<!-- logo -->
							<div class="site-logo">
								<a href="index.jsp">
							<h5 class="text-light"><span class="text-orange">E</span>-News</h5>
								</a>
							</div>
							<!-- logo -->
	
							<!-- menu start -->
							<nav class="main-menu">
								<ul>
									<li class="current-list-item"><a href="index.jsp">Home</a>
										
									</li>
									<li><a href="about.jsp">About</a></li>
								
										<li class="profile-menu">
    <div class="header-icons">
        <a class="shopping-cart" href="news.jsp">News</a>
        <ul class="sub-menu">
            <%
                // Database connection details
                String url = "jdbc:mysql://localhost:3306/enews";
                String user = "root";
                String password = "";

                // Query to fetch unique categories
                String query = "SELECT DISTINCT category FROM news";

                try {
                    // Load the JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish the database connection
                    Connection conn = DriverManager.getConnection(url, user, password);

                    // Create a statement
                    Statement stmt = conn.createStatement();

                    // Execute the query
                    ResultSet rs = stmt.executeQuery(query);

                    // Loop through the result set and generate <li> elements
                    while (rs.next()) {
                        String category = rs.getString("category");
            %>
                        <li><a href="news.jsp?category=<%= category %>"><%= category %></a></li>
            <%
                    }

                    // Close the database resources
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
           
        </ul>
    </div>
</li>
		
										
									</li>
									<li><a href="contact.jsp">Contact</a></li>
									
								<li class="profile-menu">
    <div class="header-icons">
        <a class="shopping-cart" href="#"><i class="fas fa-user"></i></a>
        <ul class="sub-menu">
            <li><a href="login.jsp">Login</a></li>
            <li><a href="registrationform.jsp">Register</a></li>
        </ul>
    </div>
</li>
								</ul>
							</nav>
							<a class="mobile-show search-bar-icon" href="#"><i class="fas fa-profile"></i></a>
							<div class="mobile-menu"></div>
							<!-- menu end -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end header -->

	<!-- breadcrumb-section -->
	<div class="breadcrumb-section breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="breadcrumb-text">
						<p>login to your page</p>
						<h1>Login</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->
 <div class="container mt-5 mb-5" >
<%
String message = request.getParameter("message");
if (message != null) { 
%>
    <div id="alertBox" class="alert alert-warning alert-dismissible fade show text-center" role="alert" 
         style="background-color: orange; color: white; font-weight: bold;">
        <strong><%= message %></strong>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<% } %>
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card mt-5">
                    <div class="card-header travel-header"> <!-- Apply travel-header class -->
                        <h4>E-news</h4>
                    </div>
                    <div class="card-header login-header"> <!-- Apply login-header class -->
                        <h4>Login to Your Account</h4>
                    </div>
                    <div class="card-body">
                        <form  id="loginform" action="uservalidate.jsp" method="post">
                            <div class="form-group">
                                <label for="email">Email Address:</label>
                                <input type="email" class="form-control" id="email" name="email" style="background-color: transparent;">
                               
                            </div>
                            <div class="form-group">
                                <label for="password">Password:</label>
                                <input type="password" class="form-control" id="password" name="Password" style="background-color: transparent;">
                                
                            </div>
                            <div class="form-group form-check d-flex justify-content-between">
                                <div>
                                <a href="#" style="margin-left:-15px;font-size:15px;">Forgot Password?</a>
                                </div>
                                <a href="registrationform.jsp" class="text-danger" style="font-size:15px;">Don't Have account?</a>
                            </div>
                            <button type="submit" name="submit" id="submit" class="btn btn-block loginbtn">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	
	<!-- footer -->
	<div class="footer-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="footer-box about-widget">
						<h2 class="widget-title">Login</h2>
						<p>Ut enim ad minim veniam perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae.</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="footer-box get-in-touch">
						<h2 class="widget-title">Get in Touch</h2>
						<ul>
							<li>34/8, East Hukupara, Gifirtok, Sadan.</li>
							<li>support@fruitkha.com</li>
							<li>+00 111 222 3333</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="footer-box pages">
						<h2 class="widget-title">Pages</h2>
						<ul>
							<li><a href="index.jsp">Home</a></li>
							<li><a href="about.html">About</a></li>
							<li><a href="services.html">Shop</a></li>
							<li><a href="news.html">News</a></li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="footer-box subscribe">
						<h2 class="widget-title">Subscribe</h2>
						<p>Subscribe to our mailing list to get the latest updates.</p>
						<form action="index.html">
							<input type="email" placeholder="Email">
							<button type="submit"><i class="fas fa-paper-plane"></i></button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end footer -->
	<script>
document.getElementById("loginform").addEventListener("submit", function(event) {
    let email = document.getElementById("email").value.trim();
    let password = document.getElementById("password").value.trim();
    
    if (email === "" || password === "") {
        alert("Email and Password are required!");
        event.preventDefault(); // Prevent form submission
    } else if (!email.includes("@") || !email.includes(".")) {
        alert("Enter a valid email address!");
        event.preventDefault();
    } else if (password.length < 6) {
        alert("Password must be at least 6 characters long!");
        event.preventDefault();
    }
});
</script>
	

	<!-- jquery -->
	<script src="assets/js/jquery-1.11.3.min.js"></script>
	<!-- bootstrap -->
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<!-- count down -->
	<script src="assets/js/jquery.countdown.js"></script>
	<!-- isotope -->
	<script src="assets/js/jquery.isotope-3.0.6.min.js"></script>
	<!-- waypoints -->
	<script src="assets/js/waypoints.js"></script>
	<!-- owl carousel -->
	<script src="assets/js/owl.carousel.min.js"></script>
	<!-- magnific popup -->
	<script src="assets/js/jquery.magnific-popup.min.js"></script>
	<!-- mean menu -->
	<script src="assets/js/jquery.meanmenu.min.js"></script>
	<!-- sticker js -->
	<script src="assets/js/sticker.js"></script>
	<!-- main js -->
	<script src="assets/js/main.js"></script>

</body>
</html>