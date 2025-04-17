<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>
	<%@ page import="java.sql.*, jakarta.servlet.http.*, jakarta.servlet.*" %>




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

</head>
<body>
	<style>
.excerpt {
    display: -webkit-box;
    -webkit-line-clamp: 3; /* Limit to 3 lines */
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: normal;
}
    .liked i {
    color: orange;
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
						<p>Organic Information</p>
						<h1>News Article</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

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
	<div class="col-lg-8 offset-lg-2 text-center">
		<div class="section-title">
			<h3>
				<span class="orange-text">Write Your</span> News
			</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
				Aliquid, fuga quas itaque eveniet beatae optio.</p>
		</div>
	</div>
<% if (session.getAttribute("user") == null) { %>
    <div class="alert alert-warning">
        You need to <a href="login.jsp">login</a> to post news.
    </div>
<% } %>

<!-- Then wrap your form in: -->
<% if (session.getAttribute("user") != null) { %>
<div class="container pb-8">
		<div class="row justify-content-center">
			<div class="col-md-8">
			<form action="addnews" method="post" enctype="multipart/form-data" class="bg-white p-4 rounded shadow-sm" onsubmit="return validateForm()">
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

<% } %>
	


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
	<!-- end media partners carousel -->

<!-- footer -->
<div class="footer-area">
    <div class="container-fluid px-0"> <!-- Use container-fluid and px-0 to remove horizontal padding -->
        <div class="row mx-0"> <!-- Use mx-0 to remove horizontal margin -->
            <div class="col-lg-3 col-md-6">
                <div class="footer-box about-widget">
                    <h2 class="widget-title">About Us</h2>
                    <p>We aim to provide high-quality services with integrity and dedication, ensuring satisfaction for all our clients and partners.</p>
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
document.querySelectorAll(".like-btn").forEach(button => {
    button.addEventListener("click", function(event) {
        event.preventDefault();
        let newsId = this.getAttribute("data-newsid");
        let likeIcon = this.querySelector("i");
        let likeCount = this.querySelector(".like-count");

        fetch("like_news.jsp?id=" + newsId)
            .then(response => response.json())
            .then(data => {
                if (data.redirect) {
                    window.location.href = "login.jsp"; // Redirect if not logged in
                } else {
                    likeCount.textContent = data.likes;
                    likeIcon.style.color = data.liked ? "orange" : "gray";
                }
            })
            .catch(error => console.error("Error:", error));
    });
});


// Function to validate the form and check login status
function validateForm() {
    if (!isUserLoggedIn()) {
        redirectToLogin();
        return false; // Prevent form submission
    }
    return true; // Allow form submission
}




function validateForm() {
    let isValid = true;

    // Validate News Title
    const title = document.getElementById("news-title").value.trim();
    if (title === "") {
        document.getElementById("title-error").innerText = "Please enter the news title.";
        isValid = false;
    } else {
        document.getElementById("title-error").innerText = "";
    }

    // Validate News Content
    const content = document.getElementById("news-content").value.trim();
    if (content === "") {
        document.getElementById("content-error").innerText = "Please enter the news content.";
        isValid = false;
    } else {
        document.getElementById("content-error").innerText = "";
    }

    // Validate Author Name
    const author = document.getElementById("author-name").value.trim();
    if (author === "") {
        document.getElementById("author-error").innerText = "Please enter your name.";
        isValid = false;
    } else {
        document.getElementById("author-error").innerText = "";
    }

    // Validate Image Upload
    const image = document.getElementById("news-image").value;
    if (image === "") {
        document.getElementById("image-error").innerText = "Please upload an image.";
        isValid = false;
    } else {
        document.getElementById("image-error").innerText = "";
    }

    // Validate Category
    const category = document.getElementById("news-category").value;
    if (category === "") {
        document.getElementById("category-error").innerText = "Please select a category.";
        isValid = false;
    } else {
        document.getElementById("category-error").innerText = "";
    }

    // Validate Other Category if "Other" is selected
    if (category === "Other") {
        const otherCategory = document.getElementById("other-category").value.trim();
        if (otherCategory === "") {
            document.getElementById("other-category-error").innerText = "Please enter a custom category.";
            isValid = false;
        } else {
            document.getElementById("other-category-error").innerText = "";
        }
    }

    return isValid;
}

function toggleOtherCategory() {
    const category = document.getElementById("news-category").value;
    document.getElementById("other-category-div").style.display = category === "Other" ? "block" : "none";
}




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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</body>
</html>