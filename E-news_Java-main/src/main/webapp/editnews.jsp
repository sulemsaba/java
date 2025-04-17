<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*" %>
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
	<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

	<!-- title -->	
	<title>E-news</title>

	<!-- favicon -->
	<link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
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
@media (max-width: 991px) {
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
.table-container {
    width: 90%;
    max-width: 900px;
    margin: 20px auto;
    padding: 20px;
    flex: 1;
    margin-top: 200px;
    margin-bottom: 100px;
}

.order-list {
    overflow-x: auto;
}

.table {
    width: 100%;
    table-layout: auto;
    min-width: 600px;
    border-collapse: collapse;
}

th, td {
    white-space: nowrap;
    text-align: center;
    vertical-align: middle;
    padding: 10px;
}



td button {
    border: none;
    padding: 8px 12px;
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer;
}

.btn-orange a, .bg-danger a {
    color: white !important;
    text-decoration: none;
    display: block;
    padding: 5px 10px;
}

.btn-orange {
    background-color: #FF7300 !important;
}

.bg-danger {
    background-color: #dc3545 !important;
}

.go-back-link {
    display: block;
    margin-top: 20px;
    text-align: center;
    font-size: 16px;
}

/* Mobile Responsiveness */
@media (max-width: 768px) {
    .table-container {
        width: 95%;
        margin-top: 150px;
        padding: 10px;
    }

    .table {
        min-width: 100%;
    }

    th, td {
        padding: 8px;
        font-size: 14px;
    }

    td button {
        font-size: 12px;
        padding: 6px 10px;
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

	
	<!-- breadcrumb-section -->
	<div class="breadcrumb-section breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="breadcrumb-text">
						
												<h1>Edit News</h1>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->
    <div class="container mt-5">
        <h1 class="text-center text-orange mb-4">Edit News</h1>
        <form action="UpdateNewsServlet" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<%= request.getAttribute("id") %>">
            <div class="mb-3">
                <label for="title" class="form-label">Title</label>
                <input type="text" class="form-control" id="title" name="title" value="<%= request.getAttribute("title") %>" required>
            </div>
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="<%= request.getAttribute("name") %>" required>
            </div>
            <div class="mb-3">
                <label for="content" class="form-label">Content</label>
                <textarea class="form-control" id="content" name="content" rows="5" required><%= request.getAttribute("content") %></textarea>
            </div>
            <div class="mb-3">
                <label for="category" class="form-label">Category</label>
                <input type="text" class="form-control" id="category" name="category" value="<%= request.getAttribute("category") %>" required>
            </div>
            <div class="mb-3">
                <label for="date" class="form-label">Date</label>
                <input type="date" class="form-control" id="date" name="date" value="<%= request.getAttribute("date") %>" required>
            </div>
           
            <div class="mb-3">
                <label for="image" class="form-label">Current Image</label>
                <% String currentImage = (String) request.getAttribute("image"); %>
                <% if (currentImage != null && !currentImage.isEmpty()) { %>
                    <img src="<%= currentImage %>" class="preview-image d-block" id="currentImagePreview">
                <% } else { %>
                    <p>No image currently set</p>	
                <% } %>
            </div>
            <div class="mb-3">
                <label for="image" class="form-label">Upload New Image (Leave blank to keep current)</label>
                <input type="file" class="form-control" id="image" name="image" accept="image/*">
                <img src="#" class="preview-image d-none" id="imagePreview">
            </div>
            <button type="submit" class="btn btn-primary mb-5">Update News</button>
                    <a href="adminindex.jsp" class="btn btn-primary mb-5">Cancel</a>

            
        </form>
    </div>

    <script>
        // Image preview functionality
        document.getElementById('image').addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(event) {
                    const preview = document.getElementById('imagePreview');
                    preview.src = event.target.result;
                    preview.classList.remove('d-none');
                }
                reader.readAsDataURL(file);
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
	<!-- form validation js -->
	<script src="assets/js/form-validate.js"></script>
	<!-- main js -->
	<script src="assets/js/main.js"></script>
	

</body>
</html>