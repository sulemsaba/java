<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*" %>
	    		<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>
	 <%  // Check if the admin session exists
    if (session.getAttribute("admin") == null) {
        // Redirect to login page if the admin is not logged in
        response.sendRedirect("login.jsp?message=Please login as admin to access this page.");
        return;
    } %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

<!-- title -->
<title>Contact</title>

<!-- favicon -->
<link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
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

/* Centering the form */
.form-container {
	max-width: 600px;
	margin: 50px auto; /* Centers the form */
	padding: 30px;
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

/* Styling form elements */
.form-container h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #333;
}

.form-control {
	border-radius: 5px;
}

.btn-orange {
	background-color: #ff6600;
	color: white;
	padding: 10px 15px;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
}

.btn-orange:hover {
	background-color: #e65c00;
}

/* Back link styling */
.go-back-link {
	display: block;
	text-align: center;
	margin-top: 15px;
	font-weight: bold;
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
								<h5 class="text-light">
									<span class="text-orange">E</span>-News
								</h5>
							</a>
						</div>
						<!-- logo -->

						<!-- menu start -->
						<nav class="main-menu">
                            <ul>
                                <li class="current-list-item"><a href="adminindex.jsp">Dashboard</a></li>
                                <li><a href="addednews.jsp">News</a></li>
                                <li><a href="checkuser.jsp">Users</a></li>
                                <li><a href="contactmessages.jsp">Contact</a></li>

                                <!-- Logout Option -->
                                <li class="profile-menu">
                                    <div class="header-icons">
                                        <a class="shopping-cart" href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                                    </div>
                                </li>
                            </ul>
                        </nav>
						<a class="mobile-show search-bar-icon" href="#"><i
							class="fas fa-profile"></i></a>
						<div class="mobile-menu"></div>
						<!-- menu end -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end header -->
<div class="breadcrumb-section breadcrumb-bg">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 offset-lg-2 text-center">
				<div class="breadcrumb-text">

					<h1>Add news update</h1>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- end breadcrumb section -->
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
<!-- Title for Latest News Section -->
	<div class="col-lg-8 offset-lg-2 text-center mt-5">
		<div class="section-title">
			<h3>
				<span class="orange-text">Write Your</span> News
			</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
				Aliquid, fuga quas itaque eveniet beatae optio.</p>
		</div>
	</div>

	<div class="container pb-8">
		<div class="row justify-content-center">
			<div class="col-md-8">
			<form action="addnewsbyadmin" method="post" enctype="multipart/form-data" class="bg-white p-4 rounded shadow-sm" onsubmit="return validateForm()">
    <!-- News Title -->
    <div class="form-group mb-4">
        <label for="news-title" class="font-weight-bold text-dark">News Title</label>
        <input type="text" name="title" class="form-control border-light" style="padding: 20px;" placeholder="Enter news title" id="news-title">
        <span id="title-error" class="error text-danger"></span>
    </div>

    <!-- News Content -->
    <div class="form-group mb-4">
        <label for="news-content" class="font-weight-bold text-dark">News Content</label>
        <textarea name="content" class="form-control border-light" style="padding: 25px;" placeholder="Write your news here..." rows="6" maxlength="2000" id="news-content"></textarea>
        <span id="content-error" class="error text-danger"></span>
    </div>

    <!-- Author Name and Video Upload -->
    <div class="row">
        <!-- Author Name -->
        <div class="col-md-6 mb-3">
            <div class="form-group">
                <label for="author-name" class="font-weight-bold text-dark">Your Name</label>
                <input type="text" class="form-control border-light" style="padding: 20px;" placeholder="Enter your name" name="author" id="author-name">
                <span id="author-error" class="error text-danger"></span>
            </div>
        </div>

       <!-- Image Upload -->
<div class="col-md-6 mb-3">
    <div class="form-group">
        <label for="news-image" class="font-weight-bold text-dark">Upload Image</label>
        <input type="file" name="image" class="form-control border-light text-center" id="news-image" accept="image/*">
        <span id="image-error" class="error text-danger"></span>
    </div>
</div>
    </div>

    <!-- Category Dropdown -->
    <div class="form-group mb-4">
        <label for="news-category" class="font-weight-bold text-dark">Category</label>
        <select class="form-control" name="category" id="news-category" onchange="toggleOtherCategory()">
            <option value="">Select a category</option>
            <option value="Politics">Politics</option>
            <option value="Technology">Technology</option>
            <option value="Sports">Sports</option>
            <option value="Entertainment">Entertainment</option>
            <option value="Business">Business</option>
            <option value="Health">Health</option>
            <option value="Science">Science</option>
            <option value="Education">Education</option>
            <option value="Environment">Environment</option>
            <option value="Culture">Culture</option>
            <option value="Other">Other</option>
        </select>
        <span id="category-error" class="error text-danger"></span>
    </div>

    <!-- Custom Category Input (Hidden by Default) -->
    <div class="form-group mb-4" id="other-category-div" style="display: none;">
        <label for="other-category" class="font-weight-bold text-dark">Enter Your Category</label>
        <input type="text" class="form-control border-light" placeholder="Enter custom category" name="other_category" id="other-category">
        <span id="other-category-error" class="error text-danger"></span>
    </div>

    <!-- Submit Button -->
    <div class="text-center">
        <p>
            <input type="submit" value="Post News" class="btn btn-primary">
        </p>
    </div>
</form>
			</div>
		</div>
	</div>






<script src="assets/js/jquery-1.11.3.min.js"></script>
<script>
function toggleOtherCategory() {
    const categorySelect = document.getElementById("news-category");
    const otherCategoryDiv = document.getElementById("other-category-div");

    if (categorySelect.value === "Other") {
        otherCategoryDiv.style.display = "block";
    } else {
        otherCategoryDiv.style.display = "none";
        document.getElementById("other-category").value = ""; // Clear input if hidden
    }
}
</script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
