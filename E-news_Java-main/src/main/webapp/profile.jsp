<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.util.ArrayList, java.util.List" %>
	
		<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>
		<%@ page import="java.sql.*, java.io.*, jakarta.servlet.http.*, jakarta.servlet.*" %>
		<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>
		<%  
// Check if the user session exists
if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp?message=Please login to access this page.");
    return;
} 
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

<!-- title -->
<title>E-news</title>

<!-- favicon -->
<link rel="shortcut icon" type="image/png" href="assets/img/A3.png">
<!-- google font -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap"
	rel="stylesheet">
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
<style>
/* Logo Styling */
.site-logo a h5 {
	margin-top: 15px;
}

/* Orange Color for "E" */
.text-orange {
	color: #ff6600; /* Orange color */
	font-weight: bold; /* Makes the text bold */
}

/* Profile Menu */
.profile-menu {
	position: relative;
	display: inline-block;
}

/* Dropdown Menu */
.profile-menu .sub-menu {
	display: none;
	position: absolute;
	top: 100%;
	right: 0;
	background: #fff !important; /* Ensure white background */
	list-style: none;
	padding: 10px;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	min-width: 150px;
	z-index: 1000;
}

/* Show dropdown on hover */
.profile-menu:hover .sub-menu {
	display: block;
}

/* Dropdown items */
.profile-menu .sub-menu li {
	padding: 5px 10px;
}

/* Dropdown links */
.profile-menu .sub-menu li a {
	text-decoration: none;
	color: #000 !important; /* Ensure black text */
	display: block;
	font-weight: 600;
}

/* Hover effect */
.profile-menu .sub-menu li a:hover {
	color: #ff6600;
}

/* Mobile Styles */
@media ( max-width : 991px) {
	.profile-menu .sub-menu {
		position: absolute !important; /* Keep dropdown positioning */
		background: #fff !important; /* Ensure white background */
		width: auto;
		right: 0;
	}
	.profile-menu .sub-menu li a {
		color: #000 !important; /* Ensure black text */
	}
}

.fixed-header {
	position: fixed;
	top: 0;
	width: 100%;
	background: white;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}
.breadcrumb-section {
    margin-bottom: 40px; /* Increase space below the breadcrumb */
    padding-bottom: 20px; /* Optional: Adjust padding */
}

h3.text-uppercase.text-center {
    margin-top: 40px; /* Increase space above the first heading */
}
/* Profile Section Styling */
#profilesec {
    margin-top: 50px;
    margin-bottom: 250px;
}

.profile-section {
    background: #fff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    margin-bottom: 30px;
}

/* Left Column Styles */
.profile-section .img {
    text-align: center;
    margin-bottom: 20px;
}

.profile-section .img img {
    border: 3px solid #ff6600;
    padding: 3px;
}

.profile-section .username {
    text-align: center;
    font-size: 1.2rem;
    font-weight: 600;
    margin-bottom: 2px;
}

.profile-section .profile,
.profile-section .login-details,
.profile-section .logout {
    padding: 12px 20px;
    border-radius: 5px;
    transition: all 0.3s ease;
}

.profile-section .profile:hover,
.profile-section .login-details:hover {
    background: #f8f9fa;
}

.profile-section .logout {
    border-top: 1px solid #eee;
    padding-top: 15px;
}

/* Right Column Styles */
#p1 .profile-section {
    min-height: 100%;
}

#p1 h2 {
    font-weight: 700;
    color: #333;
    margin-bottom: 25px;
}

.form-group.row {
    align-items: center;
    margin-bottom: 1.5rem;
}

.form-control:disabled {
    background: #f8f9fa;
    border-color: #e9ecef;
}

/* Edit Button Styles */
.btn-toggle {
    border: 1px solid #ff6600;
    padding: 8px 20px;
    transition: all 0.3s ease;
}

.btn-toggle:hover {
    background: #ff6600;
    color: white !important;
}

/* Edit Form Styles */
.edit-form {
    border-top: 1px solid #eee;
    padding-top: 25px;
    margin-top: 20px; /* Add margin to separate it from the above content */
    background: #f9f9f9; /* Light background for the edit form */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add a subtle shadow */
}

/* Ensure the form fields are styled properly */
.edit-form .form-group {
    margin-bottom: 15px;
}

.edit-form .form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
}

.edit-form .btn {
    margin-right: 10px; /* Add spacing between buttons */
}

/* Responsive Styles */
@media (max-width: 768px) {
    #profilesec {
        margin-top: 30px;
    }
    
    .profile-section {
        padding: 20px;
    }
    
    .col-md-3 {
        margin-bottom: 30px;
    }
    
    .form-group.row label {
        margin-bottom: 0.5rem;
    }
    
    .btn-toggle {
        width: 100%;
        margin-top: 10px;
    }
}

@media (max-width: 576px) {
    .form-group.row {
        flex-direction: column;
        align-items: flex-start;
    }
    
    .form-group.row .col-sm-10 {
        width: 100%;
        max-width: 100%;
    }
    
    .form-group.row label {
        margin-bottom: 0.5rem;
    }
}
.space{
margin-bottom:300px;


}

</style>

</head>
<body>

	<!--PreLoader-->
	<div class="loader">
		<div class="loader-inner">
			<div class="circle"></div>
		</div>
	</div>
	<!--PreLoader Ends-->
</head>
<body>

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
                String urll = "jdbc:mysql://localhost:3306/enews";
                String userr = "root";
                String passwordd = "";

                // Query to fetch unique categories
                String query = "SELECT DISTINCT category FROM news";

                try {
                    // Load the JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish the database connection
                    Connection conn = DriverManager.getConnection(urll, userr, passwordd);

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
				
									<li><a href="contact.jsp">Contact</a></li>
						<li class="profile-menu">
    <div class="header-icons">
        <%
        String userEmail = (String) session.getAttribute("user");
        String profileImage = (String) session.getAttribute("profile_image");

        if (userEmail != null && profileImage != null && !profileImage.isEmpty()) { 
        %>
            <a class="shopping-cart" href="#">
                <img src="<%= profileImage %>" alt="Profile" style="width: 40px; height: 40px; border-radius: 50%;">
            </a>
        <% } else { %>
            <a class="shopping-cart" href="#"><i class="fas fa-user"></i></a>
        <% } %>

        <ul class="sub-menu">
            <% if (userEmail == null) { %>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="registrationform.jsp">Register</a></li>
            <% } else { %>
                <li><a href="profile.jsp">Profile</a></li>
                
                
                <li><a href="logout.jsp">Logout</a></li>
            <% } %>
            <li><a href="adminindex.jsp">Admin</a></li>
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
						
						<h1>Your Personal Details</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->
     <div class="container  "id="profilesec">
                <div class="row">
                    <!-- Left Column - Profile Section -->
                    
                    <div class="col-md-3 ">
                        <div class="profile-section ">
                            <!-- User Icon with Background Gradient -->
                            <div class="img">
    <img src="<%= session.getAttribute("profile_image") %>" class="rounded-circle" style="width: 110px; height: 110px;" alt="User Image">
    <form action="" method="post" enctype="multipart/form-data" >
        <div class="middle-profilepic text-center  d-none ">
            <input type="file" class="form-control" id="image" name="image" onchange="submitForm()">
        </div>
    </form>
</div>

                            
                            <!-- Username -->
                            <div class="username">
                
                                <p><%= session.getAttribute("fname") %>  <%= session.getAttribute("mname") %>  <%= session.getAttribute("lname") %></p>
                            
                            </div>
                            
                            <!-- Profile with Icon -->
                            <div class="profile">
                                <a href="#p1" class="text-dark text-decoration-none"><i class="fas fa-user"></i> Profile</a>
                            </div>
                            <!-- Profile with Icon -->
                            <div class="profile">
                                <a href="useraddednews.jsp" class="text-dark text-decoration-none"><i class="fas fa-newspaper"></i> News</a>
                            </div>
                            <!-- Login Details -->
                            <div class="login-details">
                                <a href="#p2" class="text-dark text-decoration-none"><i class="fas fa-sign-in-alt"></i> Login Details</a>
                            </div>
                            
                            <!-- Logout -->
                            <div class="logout">
                                <a href="index.php" class="text-dark text-decoration-none"><i class="fas fa-sign-out-alt"></i> Logout</a>
                            </div>
                        </div>
                    </div>
                    
                  <!-- Right Column - Form Section -->
              
<div class="col-md-9" id="p1">
    <div class="profile-section">
        <div class="row">
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
            <!-- Profile Heading -->
            <div class="col-md-2">
                <h2>Profile</h2>
            </div>
            <!-- Button -->
            <div class="col-auto ml-auto">
                 <button class="btn-orange">
	                                <a href="EditUserServlet?id=<%= session.getAttribute("user_id") %>" class="btn-orange">Edit</a>
	                            </button>
            </div>
        </div>

        <!-- Profile Details -->
        <div class="row align-items-center">
            <div class="col">
                <div class="form-group row">
                    <label for="name" class="col-sm-2 col-form-label">Name:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" value="<%= session.getAttribute("fname") %> <%= session.getAttribute("mname") %> <%= session.getAttribute("lname") %>" disabled>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="birthday" class="col-sm-2 col-form-label">Birthday:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="birthday" value="<%= session.getAttribute("dob") %>" disabled>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="address" class="col-sm-2 col-form-label">Address:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="address" value="<%= session.getAttribute("address") %>" disabled>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="email" class="col-sm-2 col-form-label">Email:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="email" value="<%= session.getAttribute("userEmail") %>" disabled>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="state" class="col-sm-2 col-form-label">Gender:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="state" value="<%= session.getAttribute("gender") %>" disabled>
                    </div>
                </div>
            </div>
        </div>

       
    </div>
</div>
            
                    </div>
                </div>
            </div>
            <div class="container mt-5">
                <div class="row">
                    <!-- Left Column - Profile Section -->
                    <div class="col-md-3">
                    
                    
                        </div>
                
                    
                    <!-- Right Column - Form Section -->
                    <div class="col-md-9" id="p2">
                        <div class="profile-section s">
                            <div class="row">
                                <div class="col-md-4">
                                    <h2>Login Details</h2>
                                </div>
                            </div>
                        
                            
                        
                            
                        <!-- Login Details Form -->
                    <div class="form-group row">
        <label for="mobile" class="col-sm-2 col-form-label">Number:</label>
        <div class="col-sm-8">
            <div class="input-group">
                <input type="text" class="form-control" style="width:500px;" id="mobile" value="<%= session.getAttribute("contact") %>" disabled>
                <div class="input-group-append">
                    <!-- <a href="#" class="btn text-primary">Change Number?</a> -->
                </div>
            </div>
        </div>
        <div class="col-sm-2"></div>
    </div>
    <div class="form-group row">
        <label for="email" class="col-sm-2 col-form-label">Email:</label>
        <div class="col-sm-8">
            <div class="input-group">
                <input type="email" class="form-control" style="width:500px;" id="email" value="<%= session.getAttribute("userEmail") %>" disabled>
                <div class="input-group-append">
                    <!-- <a href="#" class="btn text-primary">Change Email?</a> -->
                </div>
            </div>
        </div>
        <div class="col-sm-2"></div>
    </div>
    <div class="form-group row">
        <label for="password" class="col-sm-2 col-form-label">Password:</label>
        <div class="col-sm-8">
            <div class="input-group">
                <input type="password" class="form-control" style="width:500px;"id="password" value="<%= session.getAttribute("password") %>" disabled >
                <div class="input-group-append">
                    <a href="changepassword.jsp" class="btn text-primary">Change Password?</a>
                </div>
            </div>
        </div>
        <div class="col-sm-2"></div>
    </div>



                            
                            <!-- Buttons -->
                        
                                
                                
                            
                            </div>
                            
                            
                        </div>
                    </div>
                </div>
                <?php
    }
    ?>
    
<!-- footer -->
	<div class="footer-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="footer-box about-widget">
						<h2 class="widget-title">About us</h2>
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
							<li><a href="about.jsp">About</a></li>
							<li><a href="services.jsp">Shop</a></li>
							<li><a href="news.jsp">News</a></li>
							<li><a href="contact.jsp">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="footer-box subscribe">
						<h2 class="widget-title">Subscribe</h2>
						<p>Subscribe to our mailing list to get the latest updates.</p>
						<form action="index.jsp">
							<input type="email" placeholder="Email">
							<button type="submit"><i class="fas fa-paper-plane"></i></button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end footer -->
	


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
	<!-- form validation js -->
	<script src="assets/js/form-validate.js"></script>
	<!-- main js -->
	<script src="assets/js/main.js"></script>
	
<script>
    $(document).ready(function() {
        // Toggle edit form when the edit button is clicked
        $('.edit-profile.btn-toggle').click(function() {
            $('.edit-form').toggle(); // Toggle the visibility of the edit form
        });
    });

    function submitForm() {
        document.querySelector('form').submit();
    }

    document.addEventListener("DOMContentLoaded", function() {
        var navLinks = document.querySelectorAll("a.nav-link");

        navLinks.forEach(function(link) {
            link.addEventListener("click", function(event) {
                // Remove any existing "active" class from all links
                navLinks.forEach(function(item) {
                    item.classList.remove("active");
                });

                // Add "active" class to the clicked link
                this.classList.add("active");

                // Navigate to the link's href after adding the "active" class
                window.location.href = this.getAttribute("href");

                // Prevent default link behavior (e.g., navigating to the href)
                // event.preventDefault();
            });
        });
    });
</script>
	
</body>
</html>