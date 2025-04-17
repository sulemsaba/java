
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
    margin-bottom: 25px;
}

.profile-section .profile,
.profile-section .login-details,
.profile-section .logout {
    padding: 12px 20px;
    margin: 8px 0;
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
								<h5 class="text-light">
									<span class="text-orange">E</span>-News
								</h5>
							</a>
						</div>
						<!-- logo -->

						<!-- menu start -->
						<nav class="main-menu">
							<ul>
								<li class="current-list-item"><a href="adminindex.jsp">Dashboard</a>

								</li>
								<li><a href="addednews.jsp">News</a></li>

								<li><a href="checkuser.jsp">users</a></li>
								<li><a href="users.jsp">Contact</a></li>

								<li class="profile-menu">
									<div class="header-icons">
										<a class="shopping-cart" href="#"><i class="fas fa-user"></i></a>
										<ul class="sub-menu">
											<li><a href="login.jsp">Login</a></li>
											<li><a href="registrationform.jsp">Register</a></li>
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
						
						<h1>Profile page</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->
    <!-- Profile Section -->
    <div class="container" id="profilesec">
        <div class="row">
            <!-- Left Column - Profile Section -->
            <div class="col-md-3">
                <div class="profile-section">
                    <div class="img">
                        <img src="pictures/<?php echo $row['image']; ?>" class="rounded-circle" style="width: 110px; height: 110px;" alt="User Image">
                        <form action="" method="post" enctype="multipart/form-data">
                            <div class="middle-profilepic text-center d-none">
                                <input type="file" class="form-control" id="image" name="image" onchange="submitForm()">
                            </div>
                        </form>
                    </div>
                    <div class="username">
                        <p><?php echo $row['firstname']?> <?php echo $row['middlename']?> <?php echo $row['lastname']?></p>
                    </div>
                    <div class="profile">
                        <a href="#p1" class="text-dark text-decoration-none"><i class="fas fa-user"></i> Profile</a>
                    </div>
                    <div class="login-details">
                        <a href="#p2" class="text-dark text-decoration-none"><i class="fas fa-sign-in-alt"></i> Login Details</a>
                    </div>
                    <div class="logout">
                        <a href="index.php" class="text-dark text-decoration-none"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    </div>
                </div>
            </div>
            <!-- Right Column - Form Section -->
            <div class="col-md-9" id="p1">
                <div class="profile-section">
                    <div class="row">
                        <div class="col-md-2">
                            <h2>Profile</h2>
                        </div>
                        <div class="col-auto ml-auto">
                            <button class="btn edit-profile btn-toggle text-primary" id="transparent"><i class="fas fa-edit"></i> Edit</button>
                        </div>
                    </div>
                    <div class="row align-items-center">
                        <div class="col">
                            <div class="form-group row">
                                <label for="name" class="col-sm-2 col-form-label">Name:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="name" value="<?php echo $row['firstname']; ?> <?php echo $row['middlename']; ?> <?php echo $row['lastname']; ?>" disabled>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="birthday" class="col-sm-2 col-form-label">Birthday:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="birthday" value="<?php echo $row['dob']; ?>" disabled>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="address" class="col-sm-2 col-form-label">Address:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="address" value="<?php echo $row['address']; ?>" disabled>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="email" class="col-sm-2 col-form-label">Email:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="email" value="<?php echo $row['email']; ?>" disabled>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="state" class="col-sm-2 col-form-label">Gender:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="state" value="<?php echo $row['gender']; ?>" disabled>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="edit-form mt-3" style="display: none;">
                        <form action="editprofile.php?email=<?php echo $row['email']?>" method="post">
                            <input type="hidden" name="email" value="<?php echo $row['email']; ?>">
                            <div class="form-group">
                                <label for="name">FName</label>
                                <input type="text" class="form-control" id="name" name="firstname" value="<?php echo $row['firstname']?>">
                            </div>
                            <div class="form-group">
                                <label for="middlename">MName</label>
                                <input type="text" class="form-control" id="middlename" name="middlename" value="<?php echo $row['middlename']?>">
                            </div>
                            <div class="form-group">
                                <label for="lastname">LName</label>
                                <input type="text" class="form-control" id="lastname" name="lastname" value="<?php echo $row['lastname']?>">
                            </div>
                            <div class="form-group">
                                <label for="dob">Birthday</label>
                                <input type="date" class="form-control" id="dob" name="dob" value="<?php echo $row['dob']?>">
                            </div>
                            <div class="form-group">
                                <label for="address">Address</label>
                                <input type="text" class="form-control" id="address" name="address" value="<?php echo $row['address']?>">
                            </div>
                            <div class="form-group">
                                <label for="gender">Gender</label>
                                <input type="text" class="form-control" id="gender" name="gender" value="<?php echo $row['gender']?>">
                            </div>
                            <button type="submit" class="btn text-primary" id="transparent" name="submit">Save</button>
                            <a href="profile.php" class="btn text-primary">Cancel</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div class="space">


</div>
 

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
