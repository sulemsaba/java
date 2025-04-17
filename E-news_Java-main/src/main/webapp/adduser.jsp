<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

	<!-- title -->
	<title>Contact</title>

	<!-- favicon -->
	<link rel="shortcut icon" type="image/png" href="assets/img/favicon.png">
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
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
								<li class="current-list-item"><a href="index_2.jsp">Dashboard</a>

								</li>
								<li><a href="about.jsp">News</a></li>

								<li><a href="news.jsp">Users</a></li>
								<li><a href="contact.jsp">Contact</a></li>

								<li class="profile-menu">
									<div class="header-icons">
										<a class="shopping-cart" href="#"><i class="fas fa-user"></i></a>
										<ul class="sub-menu">
											<li><a href="login.jsp">Login</a></li>
											<li><a href="registerationform.jsp">Register</a></li>
											<li><a href="adminindex.jsp">Admin</a></li>
										</ul>
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
						
						<h1>Add New user</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- end breadcrumb section -->
    <!-- News Form -->
  <section class="py-5">
    <div class="container">
        <div class="form-container">
            <h2>Add User</h2>
            <form action="adduserprocess.jsp" method="POST" enctype="multipart/form-data">
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <input type="text" class="form-control" name="user_name" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" name="user_email" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Role</label>
                    <select class="form-control" name="user_role" required>
                        <option value="Admin">Admin</option>
                        <option value="Editor">Editor</option>
                        <option value="Subscriber">Subscriber</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Upload Profile Photo</label>
                    <input type="file" class="form-control" name="user_photo">
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" class="form-control" name="user_password" required>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-orange">Add User</button>
                </div>
            </form>
        </div>
    </div>
    <a href="adminindex.jsp" class="go-back-link text-orange">Go Back</a>
</section>

    
       
   
	<!-- end copyright -->
    
    <script src="assets/js/jquery-1.11.3.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>   
    <script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
