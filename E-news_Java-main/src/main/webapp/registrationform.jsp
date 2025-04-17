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

    #contactNumber {
        width: 100%;
    }
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
								
									<li><a href="news.jsp">News</a>
										
									</li>
									<li><a href="contact.jsp">Contact</a></li>
									
								<li class="profile-menu">
    <div class="header-icons">
        <a class="shopping-cart" href="#"><i class="fas fa-user"></i></a>
        <ul class="sub-menu">
            <li><a href="login.jsp">Login</a></li>
            <li><a href="registerationform.jsp">Register</a></li>
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
						
						<h1>Register and get latest news!</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->
<div class="container mt-5 mb-5" id="register">
<% 
    String message = request.getParameter("message");
    if (message != null) { 
%>
    <div id="alertBox" class="alert alert-warning alert-dismissible fade show text-center" role="alert" style="background-color: orange; color: white; font-weight: bold;">
        <strong><%= message %></strong>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<% } %>




    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card form-animation">
                
                <div class="card-header reg-header text-center" id="a1">
                    
                    <h4>Registration Form</h4>
                </div>
                <div class="card-body">
<form id="registrationForm" method="post" action="register" enctype="multipart/form-data" novalidate>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="firstName"><i class="fas fa-user text-warning"></i> First Name<span class="text-danger">*</span>:</label>
                                <input type="text" class="form-control" id="firstName" name="firstName"  style="background-color: transparent;">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="middleName"><i class="fas fa-user text-warning"></i> Middle Name<span class="text-danger"></span>:</label>
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
                            <input type="file"  accept="image/*" class="form-control " id="image" name="image" style="background-color: transparent;">
                        </div>
<div style="text-align: center; margin-top: 20px;">
    <button type="submit" style="background-color: orange; color: white; border: none; padding: 10px 15px; cursor: pointer;">
   Register
    </button>
</div>

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
						<h2 class="widget-title">About Us</h2>
						<p>We aim to provide high-quality services with integrity and
							dedication, ensuring satisfaction for all our clients and
							partners.</p>


					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="footer-box get-in-touch">
						<h2 class="widget-title">Get in Touch</h2>
						<ul>
							<li>36020, Katurbadam, Rajkot, Gujarat.</li>
							<li>support@enews.com</li>
							<li>+00 111 222 3333</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="footer-box pages">
						<h2 class="widget-title">Pages</h2>
						<ul>
							<li><a href="index.html">Home</a></li>
							<li><a href="about.jsp">About</a></li>
							<li><a href="news.jsp">News</a></li>
							<li><a href="contact.jsp">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="footer-box subscribe">
						<h2 class="widget-title">Subscribe</h2>
						<p>Subscribe to our mailing list to get the latest updates.</p>
						<form action="index.html">
							<input type="email" placeholder="Email">
							<button type="submit">
								<i class="fas fa-paper-plane"></i>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end footer -->

	<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("registrationForm").addEventListener("submit", function (event) {
            let valid = true;
            let messages = [];
            
            const firstName = document.getElementById("firstName").value.trim();
            const middleName = document.getElementById("middleName").value.trim();
            const lastName = document.getElementById("lastName").value.trim();
            const contactNumber = document.getElementById("contactNumber").value.trim();
            const email = document.getElementById("email").value.trim();
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmPassword").value;
            const dob = document.getElementById("dob").value;
            const gender = document.getElementById("gender").value;
            const address = document.getElementById("address").value.trim();

            if (!firstName && !middleName && !lastName && !contactNumber && !email && !password && !confirmPassword && !dob && !gender && !address) {
                alert("All fields are empty.");
                valid = false;
            } else {
                if (!firstName || !lastName) messages.push("Please enter your full name.");
                if (contactNumber.length !== 10 || isNaN(contactNumber)) messages.push("Please enter a valid 10-digit contact number.");
                if (!email.match(/^[^\s@]+@[^\s@]+\.[^\s@]+$/)) messages.push("Please enter a valid email address.");
                if (password.length < 6) messages.push("Password must be at least 6 characters long.");
                if (password !== confirmPassword) messages.push("Passwords do not match.");
                if (!dob) messages.push("Please select your date of birth.");
                if (!gender) messages.push("Please select your gender.");
                if (!address) messages.push("Please enter your address.");
            }

            if (messages.length > 0) {
                alert(messages.join("\n"));
                valid = false;
            }

            if (!valid) {
                event.preventDefault();
            }
        });
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