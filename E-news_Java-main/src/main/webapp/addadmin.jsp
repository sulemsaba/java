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
<link rel="shortcut icon" type="image/png" href="assets/img/A3.png">
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
											<li><a href="addduser.jsp">Register</a></li>
											<li><a href="adminprofile.jsp">Admin</a></li>
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


	<!-- breadcrumb-section -->
	<div class="breadcrumb-section breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="breadcrumb-text">
						
						<h1>Add new admin</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->
<div class="container mt-5 mb-5" id="register">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card form-animation">
                
                <div class="card-header reg-header text-center" id="a1">
                    
                    <h4>Registration Form</h4>
                </div>
                <div class="card-body">
                <form id="registrationForm" method="POST" action="register.php"  enctype="multipart/form-data" novalidate>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="firstName"><i class="fas fa-user text-warning"></i> First Name<span class="text-danger">*</span>:</label>
                                <input type="text" class="form-control" id="firstName" name="firstName"  style="background-color: transparent;">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="middleName"><i class="fas fa-user text-warning"></i> Middle Name<span class="text-danger">*</span>:</label>
                                <input type="text" class="form-control" id="middleName" name="middleName" style="background-color: transparent; ">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="lastName"><i class="fas fa-user text-warning"></i> Last Name<span class="text-danger">*</span>:</label>
                                <input type="text" class="form-control" id="lastName" name="lastName" style="background-color: transparent;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="contactNumber"><i class="fas fa-phone text-warning"></i> Contact Number<span class="text-danger">*</span>:</label>
                            <input type="number" class="form-control" id="contactNumber" name="contactNumber" style="background-color: transparent;">
                        </div>
                        <div class="form-group">
                            <label for="email"><i class="fas fa-envelope text-warning"></i> Email Address<span class="text-danger">*</span>:</label>
                            <input type="email" class="form-control" id="email" name="email"  style="background-color: transparent;"> 
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="password"><i class="fas fa-lock text-warning"></i> Password<span class="text-danger">*</span>:</label>
                                <input type="password" class="form-control" id="password" name="Password" style="background-color: transparent;">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="confirmPassword"><i class="fas fa-lock text-warning"></i> Confirm Password<span class="text-danger">*</span>:</label>
                                <input type="password" class="form-control" id="confirmPassword" name="ConfirmPassword"  style="background-color: transparent;">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="dob"><i class="far fa-calendar-alt text-warning"></i> Date of Birth<span class="text-danger">*</span>:</label>
                                <input type="date" class="form-control" id="dob" name="dob"  style="background-color: transparent;">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="gender"><i class="fas fa-venus text-warning"></i> Gender<span class="text-danger">*</span>:</label>
                                <select class="form-control" id="gender" name="gender"  style="background-color: transparent;">
                                    <option value="" selected disabled style="background-color: transparent;" >Select Gender</option>
                                    <option value="male" style="background-color: transparent;">Male</option>
                                    <option value="female" style="background-color: transparent;">Female</option>
                                    <option value="other" >Other</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="contactNumber"><i class="fas fa-map-marker-alt text-warning"></i> Address<span class="text-danger">*</span>:</label>
                            <input type="text" class="form-control" id="address" name="address" style="background-color: transparent;">
                        </div>
                        <div class="form-group">
                            <label for="contactNumber"><i class="fas fa-image text-warning"></i>Profile Picture<span class="text-danger">*</span>:</label>
                            <input type="file" class="form-control " id="image" name="image" style="background-color: transparent;">
                        </div>
                        <button type="submit" class="btn  btn-block" id="registerButton" name="submit">Register</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<br><br><br>
	
	
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