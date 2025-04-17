<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.util.ArrayList, java.util.List" %>
	
		<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>
		<%@ page import="java.sql.*, java.io.*, jakarta.servlet.http.*, jakarta.servlet.*" %>
		<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>
		<%@ page import="java.util.Calendar" %>
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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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
<link rel="stylesheet" href="assets/css/owl.carousel.css">
<link rel="stylesheet" href="assets/css/owl.theme.default.css">
<style>
.excerpt {
    display: -webkit-box;
    -webkit-line-clamp: 3; /* Limit to 3 lines */
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: normal;
}

.video-bg {
    position: relative;
    width: 100%;
    height: 100vh; /* Full screen */
    overflow: hidden;
}

.background-video {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 100%;
    height: 100%;
    object-fit: cover;
    z-index: -1;
}

/* Add to your style section */
.testimonial-slider .owl-stage {
    display: flex;
    align-items: center;
}

.testimonial-slider-item {
    background: #fff;
    padding: 30px;
    margin: 15px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    border-radius: 5px;
    text-align: center;
}

.client-avater img {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    margin: 0 auto 15px;
    display: block;
    object-fit: cover;
}
 .carousel-item {
            position: relative;
            height: 100vh;
            background-size: cover;
            background-position: center;
        }
           .carousel-caption {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            text-align: center;
            color: white;
        }
        .carousel-caption .btn {
            margin: 10px;
        }

.alert {
    margin: 20px auto;
    max-width: 600px;
    text-align: center;
}
    .liked i {
    color: orange;
}
 /* Custom styles for the alert box */
        .alert {
            margin: 20px auto;
            max-width: 600px;
            text-align: center;
        }
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

.action-btn {
	text-decoration: none;
	color: #333;
	font-weight: bold;
	padding: 4px 10px;
	border-radius: 5px;
	transition: 0.3s;
}

.action-btn:hover {
	background: #f0f0f0;
}

.read-more-btn {
	margin-left: auto;
}

.separator-line {
	width: 100%;
	height: 1px;
	background-color: rgba(0, 0, 0, 0.2);
	margin-bottom: 10px;
}

.news-actions {
	display: flex;
	align-items: center;
	gap: 10px; /* Ensures proper spacing */
}

.vertical-separator {
	width: 1px;
	height: 25px; /* Increased for better visibility */
	background-color: rgba(0, 0, 0, 0.5);
}
y


:

 

inline-block


; /* Ensures it behaves as a visible block */
}
h2 .greeting-text {
    color: white;
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


 <%
    String messagee = request.getParameter("messagee");
    if (messagee != null) { 
    %>
        <div id="alertBox" class="alert alert-warning alert-dismissible fade show text-center" role="alert" 
             style="background-color: orange; color: white; font-weight: bold;">
            <strong><%= messagee %></strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <% } %>

	
     
       		<!-- Home Page Slider -->
<div class="homepage-slider">
    <!-- Single Home Slider with Video Background -->
    <div class="single-homepage-slider video-bg">
        <video autoplay muted loop class="background-video">
            <source src="assets/img/v1.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-7 offset-lg-1 offset-xl-0">
                    <div class="hero-text">
                        <div class="hero-text-tablecell">
                            <p class="subtitle">Top Stories</p>
                            <h1>Stay Updated with the Latest News</h1>
                            
<%
    String greet = (String) session.getAttribute("user_id");
    String name = (String) session.getAttribute("name");

    if (greet != null) {
        java.util.Calendar cal = java.util.Calendar.getInstance();
        int hour = cal.get(java.util.Calendar.HOUR_OF_DAY);
        String greeting = "";

        if (hour >= 0 && hour < 12) {
            greeting = "Good Morning";
        } else if (hour >= 12 && hour < 16) {
            greeting = "Good Afternoon";
        } else {
            greeting = "Good Evening";
        }
%>
    <h2 style="color: white;"><%= greeting %> <%= name %>!</h2>
<%
    }
%>

                            <div class="hero-btns">
                                <a href="shop.html" class="boxed-btn">Live Updates</a>
                                <a href="contact.jsp" class="bordered-btn">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
   <!-- Second Slider with Image Background -->
    <div class="single-homepage-slider image-bg" style="background-image: url('assets/img/c1.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 offset-lg-2 text-center">
                    <div class="hero-text">
                        <div class="hero-text-tablecell">
                            <p class="subtitle">Breaking News</p>
                            <h1>Latest Updates and Headlines</h1>
                            <%
    String greet1 = (String) session.getAttribute("user_id");
    String name1 = (String) session.getAttribute("name");

    if (greet1 != null) {
        java.util.Calendar cal = java.util.Calendar.getInstance();
        int hour = cal.get(java.util.Calendar.HOUR_OF_DAY);
        String greeting = "";

        if (hour >= 0 && hour < 12) {
            greeting = "Good Morning";
        } else if (hour >= 12 && hour < 16) {
            greeting = "Good Afternoon";
        } else {
            greeting = "Good Evening";
        }
%>
    <h2 style="color: white;"><%= greeting %> <%= name1 %>!</h2>
<%
    }
%>
                            <div class="hero-btns">
                                <a href="news.jsp" class="boxed-btn">News Collection</a>
                                <a href="contact.jsp" class="bordered-btn">Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Third Slider with Image Background -->
    <div class="single-homepage-slider image-bg" style="background-image: url('assets/img/c2.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1 text-right">
                    <div class="hero-text">
                        <div class="hero-text-tablecell">
                            <p class="subtitle">You Can Share</p>
                            <h1>Interesting News Around You</h1>
                            <%
    String greet2 = (String) session.getAttribute("user_id");
    String name2 = (String) session.getAttribute("name");

    if (greet2 != null) {
        java.util.Calendar cal = java.util.Calendar.getInstance();
        int hour = cal.get(java.util.Calendar.HOUR_OF_DAY);
        String greeting = "";

        if (hour >= 0 && hour < 12) {
            greeting = "Good Morning";
        } else if (hour >= 12 && hour < 16) {
            greeting = "Good Afternoon";
        } else {
            greeting = "Good Evening";
        }
%>
    <h2 style="color: white;"><%= greeting %> <%= name2 %>!</h2>
<%
    }
%>
                            <div class="hero-btns">
                                <a href="shop.html" class="boxed-btn">Write News</a>
                                <a href="contact.jsp" class="bordered-btn">Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Home Page Slider -->


	<!-- features list section -->
	<div class="list-section pt-80 pb-80">
		<div class="container">

			<div class="row">
				<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
					<div class="list-box d-flex align-items-center">
						<div class="list-icon">
							<i class="fas fa-newspaper"></i>
						</div>
						<div class="content">
							<h3>Latest News</h3>
							<p>Stay updated with real-time headlines.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
					<div class="list-box d-flex align-items-center">
						<div class="list-icon">
							<i class="fas fa-clock"></i>
						</div>
						<div class="content">
							<h3>24/7 Coverage</h3>
							<p>News anytime, anywhere.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div
						class="list-box d-flex justify-content-start align-items-center">
						<div class="list-icon">
							<i class="fas fa-share-alt"></i>
						</div>
						<div class="content">
							<h3>Share Stories</h3>
							<p>Easily share news with your network.</p>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- end features list section -->

	<%
    String urlll = "jdbc:mysql://localhost:3306/enews";
    String userrr = "root";
    String passworddd = "";

    String userId = (String) session.getAttribute("user_id");

    String categoryFilter = request.getParameter("category");
    String searchText = request.getParameter("searchText");
    String searchDate = request.getParameter("searchDate");
    String searchYear = request.getParameter("searchYear");

    boolean hasSearchText = searchText != null && !searchText.trim().isEmpty();
    boolean hasSearchDate = searchDate != null && !searchDate.trim().isEmpty();
    boolean hasSearchYear = searchYear != null && !searchYear.trim().isEmpty();

    String queryy = "SELECT news.*, " +
                    "  (SELECT COUNT(*) FROM likes WHERE news_id = news.id) AS like_count, " +
                    "  (SELECT COUNT(*) FROM comments WHERE news_id = news.id) AS comment_count, " +
                    "  EXISTS (SELECT 1 FROM likes WHERE user_id = ? AND news_id = news.id) AS liked " +
                    "FROM news WHERE 1=1";

    if (categoryFilter != null && !categoryFilter.isEmpty()) {
        queryy += " AND category = ?";
    }
    if (hasSearchText) {
        queryy += " AND (Title LIKE ? OR content LIKE ? OR name LIKE ?)";
    }
    if (hasSearchDate) {
        queryy += " AND DATE(date) = ?";
    }
    if (hasSearchYear) {
        queryy += " AND YEAR(date) = ?";
    }

    queryy += " ORDER BY date DESC";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(urlll, userrr, passworddd);
        PreparedStatement stmt = conn.prepareStatement(queryy);

        int paramIndex = 1;
        stmt.setString(paramIndex++, userId);

        if (categoryFilter != null && !categoryFilter.isEmpty()) {
            stmt.setString(paramIndex++, categoryFilter);
        }
        if (hasSearchText) {
            String searchPattern = "%" + searchText.trim() + "%";
            stmt.setString(paramIndex++, searchPattern);
            stmt.setString(paramIndex++, searchPattern);
            stmt.setString(paramIndex++, searchPattern);
        }
        if (hasSearchDate) {
            stmt.setString(paramIndex++, searchDate.trim());
        }
        if (hasSearchYear) {
            stmt.setString(paramIndex++, searchYear.trim());
        }

        ResultSet rs = stmt.executeQuery();
%>
<!-- Latest News Section -->
<div class="latest-news pt-150 pb-50">
    <div class="container">
      <!-- Search Form -->
        <form method="GET" action="" class="mb-5">
    <% if (categoryFilter != null && !categoryFilter.isEmpty()) { %>
        <input type="hidden" name="category" value="<%= categoryFilter %>">
    <% } %>
    <div class="input-group">
        <input type="text" name="searchText" class="form-control" placeholder="Search by title, author, or content" 
               value="<%= hasSearchText ? searchText : "" %>">
        <span class="mx-2">OR</span>
        <input type="date" name="searchDate" class="form-control" 
               value="<%= hasSearchDate ? searchDate : "" %>">
        <span class="mx-2">OR</span>
        <input type="text" name="searchYear" class="form-control" placeholder="Search by Year (e.g. 2023)" 
               value="<%= searchYear != null ? searchYear : "" %>">
        <button class="btn btn-outline-secondary" type="submit">Search</button>
        <% if (hasSearchText || hasSearchDate || hasSearchYear) { %>
            <a href="news.jsp<% if (categoryFilter != null && !categoryFilter.isEmpty()) { %>?category=<%= categoryFilter %><% } %>" 
               class="btn btn-outline-danger">Clear Search</a>
        <% } %>
    </div>
</form>

        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="section-title">
                    <h3><span class="orange-text">Our</span> News</h3>
                    <p>Stay updated with the latest news and updates.</p>
                </div>
            </div>
        </div>

        <% if (!rs.isBeforeFirst()) { %>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="alert alert-info">
                        No news found matching your search criteria.
                    </div>
                </div>
            </div>
        <% } else { %>
            <div class="row">
                <%
                    while (rs.next()) {
                        String title = rs.getString("Title");
                        String content = rs.getString("content");
                        String author = rs.getString("name");
                        String image = rs.getString("videos");
                        String category = rs.getString("category");
                        String date = rs.getString("date");
                        int likeCount = rs.getInt("like_count");
                        boolean liked = rs.getInt("liked") > 0;
                        int comment_count = rs.getInt("comment_count");
                %>
                <!-- News item display code remains the same -->
                <div class="col-lg-4 col-md-6">
                    <div class="single-latest-news">
                        <a href="single-news.jsp?id=<%= rs.getInt("id") %>">
                            <img src="<%= image %>" alt="<%= title %>" class="news-image">
                        </a>
                        <div class="news-text-box">
                            <h3><a href="single-news.jsp?id=<%= rs.getInt("id") %>"><%= title %></a></h3>
                            <p class="blog-meta">
                                <span class="author"><i class="fas fa-user"></i> <%= author %></span>
                                <span class="date"><i class="fas fa-calendar"></i> <%= date %></span>
                            </p>
                            <p class="excerpt"><%= content.length() > 100 ? content.substring(0, 100) + "..." : content %></p>
                            <div class="separator-line"></div>
                            <div class="news-actions">
                                <a href="#" class="action-btn like-btn" data-newsid="<%= rs.getInt("id") %>">
                                    <i class="fas fa-thumbs-up" style="color: <%= liked ? "orange" : "gray" %>"></i>
                                    <span class="like-count"><%= likeCount %></span>
                                </a>
                                <div class="vertical-separator"></div>
                                <a href="single-news.jsp?id=<%= rs.getInt("id") %>" class="action-btn">
                                    <i class="fas fa-comment"></i> <span class="comment-count"><%= comment_count %></span>
                                </a>
                                <div class="vertical-separator"></div>
                                <a href="#" class="action-btn"><i class="fas fa-share"></i> Share</a>
                                <div class="vertical-separator"></div>
                                <a href="single-news.jsp?id=<%= rs.getInt("id") %>" class="action-btn"><i class="fas fa-book-open"></i> Read</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        <% } %>
        
        <div class="row">
            <div class="col-lg-12 text-center">
                <a href="news.jsp<% if (categoryFilter != null && !categoryFilter.isEmpty()) { %>?category=<%= categoryFilter %><% } %>" class="boxed-btn">More News</a>
            </div>
        </div>
        <br><br>
    </div>
</div>

<%
        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p class='text-danger'>Error fetching news items. Please try again later.</p>");
    }
%>


	<!-- news banner section -->
	<section class="news-banner pt-100 ">
		<div class="container">
			<div class="row clearfix align-items-center">
				<!--Image Column-->
				<div class="image-column col-lg-6 d-flex align-items-stretch">
					<div class="image w-100">
						<div class="breaking-news-box">
							<div class="inner-news">
								<span class="headline"> <strong>Breaking:</strong> Major
									Event Unfolding
								</span>
							</div>
						</div>
						<img src="assets/img/media/n3.jpg" alt="Breaking News"
							class="img-fluid h-100 w-100 object-fit-cover">
					</div>
				</div>
				<!--Content Column-->
				<div class="content-column col-lg-6 d-flex align-items-stretch">
					<div
						class="content-box d-flex flex-column justify-content-center w-100">
						<h3>
							<span class="orange-text">Highlight</span> of the Day
						</h3>
						<h4>Top Story: Global Headlines</h4>
						<div class="text">Stay informed with in-depth reporting on
							the latest developments happening around the world. From politics
							to technology, we've got you covered with verified news stories.
						</div>
						<!--Countdown Timer-->
						<div class="time-counter mt-4">
    <div id="calendar-time" class="time-countdown clearfix">
        <div class="counter-column">
            <div class="inner">
                <span id="year" class="count">0000</span> Year
            </div>
        </div>
        <div class="counter-column">
            <div class="inner">
                <span id="month" class="count">00</span> Month
            </div>
        </div>
        <div class="counter-column">
            <div class="inner">
                <span id="day" class="count">00</span> Day
            </div>
        </div>
        <div class="counter-column">
            <div class="inner">
                <span id="hours" class="count">00</span> Hours
            </div>
        </div>
        <div class="counter-column">
            <div class="inner">
                <span id="minutes" class="count">00</span> Mins
            </div>
        </div>
        <div class="counter-column">
            <div class="inner">
                <span id="seconds" class="count">00</span> Secs
            </div>
        </div>
    </div>
</div>
						<a href="news.jsp" class="news-btn mt-4 align-self-start"><i
							class="fas fa-book-open"></i> Read More</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end news banner section -->

	<!-- featured video section -->
	<div class="featured-section ">
		<div class="container">
			<div class="row">
				<!-- Video Section -->
				<div class="col-lg-6 col-md-12">
					<div class="video-bg">
						<a href="https://youtube.com/@abcnews?si=oN10zWbbEgAHD3O7"
							class="video-play-btn popup-youtube"> <i class="fas fa-play"></i>
						</a>
					</div>
				</div>
				<!-- Text Content Section -->
				<div class="col-lg-6 col-md-12">
					<div class="featured-text">
						<p class="top-sub">Since 1999</p>
						<h2>
							Your Trusted <span class="orange-text">News Source</span>
						</h2>
						<p>Stay informed with reliable, unbiased reporting. From
							breaking news to in-depth analysis, we cover stories that matter
							most to you. Explore global and local events with context and
							clarity.</p>
						<p>Our mission is to deliver news that informs, educates, and
							empowers the community. Join millions who trust us for daily
							updates, insights, and storytelling.</p>
						<a href="about.jsp" class="boxed-btn mt-4">Learn More</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end featured video section -->
<!-- testimonial-section -->
<div class="testimonail-section  ">
    <div class="container">
        <!-- Heading -->
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-title">
                    User <span class="orange-text">Reviews</span> Around the World
                </h2>
                <p class="section-subtitle">Hear what our customers have to say about their experiences.</p>
            </div>
        </div>
        
        <!-- Testimonial Sliders -->
        <div class="row mt-4">
            <div class="col-lg-10 offset-lg-1 text-center">
                <div class="testimonial-sliders">
                    <%
                    // Database connection parameters
                    String url = "jdbc:mysql://localhost:3306/enews";
                    String user = "root";
                    String pass = "";
                    boolean hasReviews = false;
                    
                    try {
                        // Load JDBC driver
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        
                        // Create connection
                        Connection conn = DriverManager.getConnection(url, user, pass);
                        
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

<section class="review-section py-5" style="background-color: #f8f9fa;">
    <div class="container">
        <h2 class="text-center text-dark mb-4">
            Share Your <span class="orange-text">Review</span>
        </h2>
        
        <% if (session.getAttribute("user") == null) { %>
    <div class="alert alert-warning">
        You need to <a href="login.jsp">login</a> to post your review.
    </div>
<% } %>

<!-- Then wrap your form in: -->
<% if (session.getAttribute("user") != null) { %>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <form action="review" method="post" enctype="multipart/form-data" class="bg-white p-4 rounded shadow-sm" onsubmit="return validateForm()">
        <!-- Review Textarea -->
        <div class="form-group mb-4">
            <label for="review" class="font-weight-bold text-dark">Your Review</label>
            <textarea name="review" class="form-control border-light" style="padding: 25px;" placeholder="Write your review here..." rows="5" maxlength="500" id="review" required></textarea>
        </div>

        <!-- Name, Profession, and Image Upload -->
        <div class="row">
            <!-- Name -->
            <div class="col-md-4 mb-3">
                <div class="form-group">
                    <label for="cname" class="font-weight-bold text-dark">Your Name</label>
                    <input type="text" class="form-control border-light" style="padding: 20px;" placeholder="Enter your name" name="name" id="cname" required>
                </div>
            </div>

            <!-- Profession -->
            <div class="col-md-4 mb-3">
                <div class="form-group">
                    <label for="profession" class="font-weight-bold text-dark">Your Profession</label>
                    <input type="text" class="form-control border-light" style="padding: 20px;" placeholder="Enter your profession" name="profession" id="profession" required>
                </div>
            </div>

            <!-- Image Upload -->
            <div class="col-md-4 mb-3">
                <div class="form-group">
                    <label for="image" class="font-weight-bold text-dark">Upload Your Picture</label>
                    <input type="file" name="pic" class="form-control border-light text-center" id="image" required>
                </div>
            </div>
        </div>

        <!-- Submit Button -->
        <div class="text-center">
            <button type="submit" class="btn btn-orange px-4 py-2 rounded">Submit Review</button>
        </div>
    </form>

            </div>
        </div>
        <% } %>
    </div>
</section>







<!-- logo carousel -->
	<!-- media partners carousel -->
	<div class="media-partners-carousel pt-5">
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
<!-- Place this just before your closing </body> tag -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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

<!-- Main JavaScript -->
<script>
$(document).ready(function() {
    // 1. TIME COUNTER - Continuous real-time clock
    function updateRealTimeClock() {
        const now = new Date();
        
        // Update the elements with proper zero-padding
        $('#year').text(now.getFullYear());
        $('#month').text(String(now.getMonth() + 1).padStart(2, '0'));
        $('#day').text(String(now.getDate()).padStart(2, '0'));
        $('#hours').text(String(now.getHours()).padStart(2, '0'));
        $('#minutes').text(String(now.getMinutes()).padStart(2, '0'));
        $('#seconds').text(String(now.getSeconds()).padStart(2, '0'));
        
        // Continue updating every second
        setTimeout(updateRealTimeClock, 1000);
    }
    updateRealTimeClock(); // Initialize immediately

    // 2. TESTIMONIAL SLIDER
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

    // 3. LIKE BUTTON FUNCTIONALITY
    $(".like-btn").on("click", function(event) {
        event.preventDefault();
        let $button = $(this);
        let newsId = $button.data("newsid");
        
        $.ajax({
            url: "like_news.jsp?id=" + newsId,
            type: "GET",
            dataType: "json",
            success: function(data) {
                if (data.redirect) {
                    window.location.href = "login.jsp";
                } else {
                    $button.find(".like-count").text(data.likes);
                    $button.find("i").css("color", data.liked ? "orange" : "gray");
                }
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
            }
        });
    });

    // 4. LOGIN CHECK FUNCTIONS
    function checkLoginStatus() {
        // This should be replaced with your actual session check
        // Example using a meta tag (set by server)
        const loggedIn = $('meta[name="user-logged-in"]').attr("content") === "true";
        return loggedIn;
    }

    function redirectToLogin() {
        window.location.href = "login.jsp?message=Please login to submit a review or upload a picture.";
    }

   

    // Image upload check
    $("#image").on("change", function() {
        if (!checkLoginStatus()) {
            redirectToLogin();
            $(this).val("");
        }
    });
});

// Initialize other plugins after window load
$(window).on('load', function(){
    $(".testimonial-slider").trigger('refresh.owl.carousel');
    // Initialize other plugins if needed
});

</script>

<!-- main js -->
<script src="assets/js/main.js"></script>

</body>
</html>