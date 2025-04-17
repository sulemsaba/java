<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
			<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>
	<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.util.ArrayList, java.util.List" %>
	
		<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>
		<%@ page import="java.sql.*, java.io.*, jakarta.servlet.http.*, jakarta.servlet.*" %>
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
	margin-top: 15px;
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
								<li class="current-list-item"><a href="index.jsp">Home</a></li>
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
						<p>We Share fresh News</p>
						<h1>About Us</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<!-- Featured Section -->
	<div class="mt-5">
		<div class="container mt-5">
			<div class="row">
				<!-- Left Container - Why E-News Section -->
				<div class="col-lg-6">
					<div class="featured-text">
						<h2 class="pb-3">
							Why <span class="orange-text">E-News</span>?
						</h2>
						<div class="row">
							<div class="col-lg-6 col-md-6 mb-4 mb-md-5">
								<div class="list-box d-flex">
									<div class="list-icon">
										<i class="fas fa-newspaper"></i>
									</div>
									<div class="content">
										<h3>Latest Updates</h3>
										<p>Stay informed with real-time news updates from around
											the world.</p>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 mb-5 mb-md-5">
								<div class="list-box d-flex">
									<div class="list-icon">
										<i class="fas fa-users"></i>
									</div>
									<div class="content">
										<h3>Trusted Sources</h3>
										<p>Our news is sourced from verified and credible
											journalists worldwide.</p>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 mb-5 mb-md-5">
								<div class="list-box d-flex">
									<div class="list-icon">
										<i class="fas fa-globe"></i>
									</div>
									<div class="content">
										<h3>Global Coverage</h3>
										<p>Get news from every corner of the world, covering all
											major events.</p>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-6">
								<div class="list-box d-flex">
									<div class="list-icon">
										<i class="fas fa-clock"></i>
									</div>
									<div class="content">
										<h3>24/7 Access</h3>
										<p>Read news anytime, anywhere, with our seamless online
											platform.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Right Container - YouTube Video Section -->
				<div class="col-lg-6">
					<div class="video-section">
						<h3 class="pb-3">Watch Our Introduction</h3>
						<iframe width="100%" height="315"
							src="https://www.youtube.com/embed/dQw4w9WgXcQ" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- End Featured Section -->


	<!-- News Banner -->
	<section class="news-banner">
		<div class="container">
			<h3>
				Stay Updated! <br> Get the <span class="orange-text">Latest
					News...</span>
			</h3>
			<div class="breaking-news">
				<span>Breaking! <br> Top
				</span> Stories <span>Now</span>
			</div>
			<a href="news.jsp" class="cart-btn btn-lg">Read Now</a>
		</div>
	</section>
	<!-- End News Banner -->


	<!-- team section -->
	<div class="mt-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="section-title">
						<h3>
							Our <span class="orange-text">Team</span>
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Aliquid, fuga quas itaque eveniet beatae optio.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="single-team-item">
						<div class="team-bg team-bg-1"></div>
						<h4>
							Jimmy Doe <span>Farmer</span>
						</h4>
						<ul class="social-link-team">
							<li><a href="#" target="_blank"><i
									class="fab fa-facebook-f"></i></a></li>
							<li><a href="#" target="_blank"><i
									class="fab fa-twitter"></i></a></li>
							<li><a href="#" target="_blank"><i
									class="fab fa-instagram"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-team-item">
						<div class="team-bg team-bg-2"></div>
						<h4>
							Marry Doe <span>Farmer</span>
						</h4>
						<ul class="social-link-team">
							<li><a href="#" target="_blank"><i
									class="fab fa-facebook-f"></i></a></li>
							<li><a href="#" target="_blank"><i
									class="fab fa-twitter"></i></a></li>
							<li><a href="#" target="_blank"><i
									class="fab fa-instagram"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0">
					<div class="single-team-item">
						<div class="team-bg team-bg-3"></div>
						<h4>
							Simon Joe <span>Farmer</span>
						</h4>
						<ul class="social-link-team">
							<li><a href="#" target="_blank"><i
									class="fab fa-facebook-f"></i></a></li>
							<li><a href="#" target="_blank"><i
									class="fab fa-twitter"></i></a></li>
							<li><a href="#" target="_blank"><i
									class="fab fa-instagram"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end team section -->

	  <!-- Testimonial Sliders -->
        <div class="row mt-4">
            <div class="col-lg-10 offset-lg-1 text-center">
                <div class="testimonial-sliders">
                    <%
                    // Database connection parameters
                    String urll = "jdbc:mysql://localhost:3306/enews";
                    String userr = "root";
                    String pass = "";
                    boolean hasReviews = false;
                    
                    try {
                        // Load JDBC driver
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        
                        // Create connection
                        Connection conn = DriverManager.getConnection(urll, userr, pass);
                        
                        // SQL query to fetch reviews
                        String sql = "SELECT name, profession, review, pic FROM review ORDER BY id DESC";
                        PreparedStatement stmt = conn.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();
                        
                        // Process results
                        while (rs.next()) {
                            hasReviews = true;
                            String clientName = rs.getString("name");
                            String clientProfession = rs.getString("profession");
                            String clientReview = rs.getString("review");
                            String clientImage = rs.getString("pic");
                            
                            // Set default image if none provided
                            if (clientImage == null || clientImage.isEmpty()) {
                                clientImage = "assets/img/team/team-1.jpg";
                            }
                    %>
                    <div class="single-testimonial-slider">
                        <div class="client-avater">
                            <img src="<%= clientImage %>" alt="<%= clientName %>">
                        </div>
                        <div class="client-meta">
                            <h3>
                                <%= clientName %> <span><%= clientProfession != null ? clientProfession : "Customer" %></span>
                            </h3>
                            <p class="testimonial-body orange-text">"<%= clientReview %>"</p>
                            <div class="last-icon">
                                <i class="fas fa-quote-right"></i>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                        
                        // Close resources
                        rs.close();
                        stmt.close();
                        conn.close();
                        
                    } catch (Exception e) {
                        e.printStackTrace();
                        // You might want to add error handling here
                    }
                    
                    // Show message if no reviews found
                    if (!hasReviews) {
                    %>
                    <div class="single-testimonial-slider">
                        <div class="client-avater">
                            <img src="assets/img/team/team-1.jpg" alt="No reviews">
                        </div>
                        <div class="client-meta">
                            <h3>No Reviews Yet <span>Be the first to review!</span></h3>
                            <p class="testimonial-body orange-text">"We would love to hear your feedback about our services."</p>
                            <div class="last-icon">
                                <i class="fas fa-quote-right"></i>
                            </div>
                        </div>
                    </div>
                    <%
                    }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end testimonial-section -->


	<!-- media partners carousel -->
	<div class="media-partners-carousel">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="logo-carousel-inner">
						<div class="single-logo-item">
							<img src="assets/img/media/news8.png" alt="Media Partner 1">
						</div>
						<div class="single-logo-item">
							<img src="assets/img/media/news2.png" alt="Media Partner 2">
						</div>
						<div class="single-logo-item">
							<img src="assets/img/media/news3.png" alt="Media Partner 3">
						</div>
						<div class="single-logo-item">
							<img src="assets/img/media/news6.png" alt="Media Partner 4">
						</div>
						<div class="single-logo-item">
							<img src="assets/img/media/news7.png" alt="Media Partner 5">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end media partners carousel -->
	<!-- footer -->
	<div class="footer-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="footer-box about-widget">
						<h2 class="widget-title">About us</h2>
						<p>Ut enim ad minim veniam perspiciatis unde omnis iste natus
							error sit voluptatem accusantium doloremque laudantium, totam rem
							aperiam, eaque ipsa quae.</p>
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


<!-- jQuery and Owl Carousel JS -->
<script src="assets/js/jquery-1.11.3.min.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<script>
//2. TESTIMONIAL SLIDER
$(".testimonial-slider").owlCarousel({
    loop: true,
    margin: 30,
    nav: false,
    dots: true,
    autoplay: true,
    responsive: {
        0: { items: 1 },
        600: { items: 2 },
        1000: { items: 3 }
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