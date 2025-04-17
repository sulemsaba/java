	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>
	
	<%@ page import="java.sql.* , java.time.Year , java.time.Month" %>

	<!DOCTYPE html>
	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">
	
	    <!-- title -->
	    <title>Single News</title>
	
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
	     .comment-actions {
        margin-top: 10px;
    }

    .comment-actions button {
        background: none;
        border: none;
        cursor: pointer;
        margin-right: 10px;
        font-size: 14px;
        color: #555;
    }

    .comment-actions button:hover {
        color: #000;
    }

    .comment-actions .delete-btn {
        color: #ff0000;
    }

    .comment-actions .delete-btn:hover {
        color: #cc0000;
    }
	    .single-comment-body{
	    display:flex;
	    }
	    .comment-user-avatar{
	    margin:0;
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
	width: 5px;
	height: 25px; /* Increased for better visibility */
	background-color: rgba(0, 0, 0, 0.5);
}
y


:

 

inline-block


; /* Ensures it behaves as a visible block */
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
	                        <p>Read the details</p>
	                        <h1>Single Article</h1>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- end breadcrumb section -->
	
	    <!-- single article section -->
	    <div class="mt-150 mb-150">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-8">
	                    <div class="single-article-section">
	                        <%
    // Retrieve the id parameter from the URL
    String id = request.getParameter("id");

    if (id != null && !id.isEmpty()) {
        // Database connection details
        String urll = "jdbc:mysql://localhost:3306/enews";
        String userr = "root";
        String passwordd = "";

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            Connection conn = DriverManager.getConnection(urll, userr, passwordd);

            // Create a statement
            Statement stmt = conn.createStatement();

            // Execute the query to fetch the news article
            String queryy = "SELECT * FROM news WHERE id = " + id;
            ResultSet rs = stmt.executeQuery(queryy);

            if (rs.next()) {
                String title = rs.getString("Title");
                String content = rs.getString("content");
                String author = rs.getString("name");
                String image = rs.getString("videos");
                String date = rs.getString("date");
                String category = rs.getString("category");

                // Get current year dynamically
                java.util.Calendar calendar = java.util.Calendar.getInstance();
                int currentYear = calendar.get(java.util.Calendar.YEAR);

                // Query to count posts by the same author per month in the current year
                String countQuery = "SELECT MONTH(date) AS month, COUNT(*) AS post_count " +
                                    "FROM news " +
                                    "WHERE name = ? AND YEAR(date) = ? " +
                                    "GROUP BY MONTH(date) " +
                                    "ORDER BY MONTH(date)";
                
                PreparedStatement pstmt = conn.prepareStatement(countQuery);
                pstmt.setString(1, author);
                pstmt.setInt(2, currentYear);

                ResultSet countRs = pstmt.executeQuery();
%>
	                                        <div class="single-article-text">
	                                            <div class="single-artcile-bg" style="background-image: url('<%= image %>');"></div>
	                                            <p class="blog-meta">
	                                                <span class="author"><i class="fas fa-user"></i> <%= author %></span>
	                                                <span class="date"><i class="fas fa-calendar"></i> <%= date %></span>
	                                            </p>
	                                            <h2><%= title %></h2>
	                                            <p><%= content %></p>
	                                        </div>
	                       
	
	<div class="comments-list-wrap">
    <h3 class="comment-count-title">Comments</h3>
    <div class="comment-list">
        <%
        // Database connection details
        String urlll = "jdbc:mysql://localhost:3306/enews";
        String userrr = "root";
        String passworddd = "";

        if (id != null && !id.isEmpty()) {
            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connn = DriverManager.getConnection(urlll, userrr, passworddd);
                Statement stmtt = connn.createStatement();

                // Fetch comments for the current news article
                String commentQuery = "SELECT * FROM comments WHERE news_id = " + id + " ORDER BY comment_date DESC";
                ResultSet commentRs = stmtt.executeQuery(commentQuery);

                boolean hasComments = false;

                while (commentRs.next()) {
                    hasComments = true;
                    String commentId = commentRs.getString("id");
                    String commentAuthor = commentRs.getString("author");
                    String commentContent = commentRs.getString("content");
                    String commentDate = commentRs.getString("comment_date");
                    String commentProfilePicture = commentRs.getString("profile_picture");
                    int likes = commentRs.getInt("likes");
                    int dislikes = commentRs.getInt("dislikes");
                    String commentUserId = commentRs.getString("user_id"); // User who posted the comment

                    // Check if the logged-in user is the commenter
                    boolean isCommenter = false;
                    String loggedInUserId = (String) session.getAttribute("user_id");
                    if (loggedInUserId != null && loggedInUserId.equals(commentUserId)) {
                        isCommenter = true;
                    }
        %>
                    <div class="single-comment-body">
                        <div class="comment-user-avatar">
                            <img src="<%= commentProfilePicture %>" alt="<%= commentAuthor %>" style="width: 50px; height: 50px; border-radius: 50%;">
                        </div>
                        <div class="comment-text-body">
                            <h4><%= commentAuthor %> <span class="comment-date"><i class="fas fa-calendar"></i> <%= commentDate %></span></h4>
                            <p><%= commentContent %></p>
                            <div class="comment-actions">
                                <!-- Like Button -->
                                <button class="like-btn" data-comment-id="<%= commentId %>">
                                    <i class="fas fa-thumbs-up"></i> <span class="like-count"><%= likes %></span>
                                </button>
                                <!-- Dislike Button -->
                                <button class="dislike-btn" data-comment-id="<%= commentId %>">
                                    <i class="fas fa-thumbs-down"></i> <span class="dislike-count"><%= dislikes %></span>
                                </button>
                                <!-- Delete Button (only for the commenter) -->
                                <% if (isCommenter) { %>
                                    <button class="delete-btn" data-comment-id="<%= commentId %>">
                                        <i class="fas fa-trash"></i> Delete
                                    </button>
                                <% } %>
                            </div>
                        </div>
                    </div>
        <%
                }

                if (!hasComments) {
        %>
                    <div class="no-comments">
                        <p>No comments yet. <strong>Be the first to comment!</strong></p>
                    </div>
        <%
                }

                // Close the database resources
                commentRs.close();
                stmtt.close();
                connn.close();
            } catch (Exception e) {
                e.printStackTrace();
        %>
                <p class="text-danger">No comments Yet , Be the first Commentor</p>
        <%
            }
        }
        %>
    </div>
</div>
<div class="comment-template">
    <h4>Leave a Comment</h4>
    <%
        // Check if the user is logged in
        String email = (String) session.getAttribute("user");
        String userProfilePicture = (String) session.getAttribute("profile_image");
        String userId = (String) session.getAttribute("user_id"); // Corrected session attribute name
        String userName = (String) session.getAttribute("name");

        if (userId != null) {
            // User is logged in, pre-fill the form with user details
    %>
            <form action="addComment.jsp" method="POST">
                <input type="hidden" name="news_id" value="<%= id %>">
                <input type="hidden" name="user_id" value="<%= userId %>">
                <input type="hidden" name="author" value="<%= userName %>">
                <input type="hidden" name="email" value="<%= email %>">
                <input type="hidden" name="profile_picture" value="<%= userProfilePicture %>">
                <p>
                    <strong>Commenting as:</strong> <%= userName %>
                    <img src="<%= userProfilePicture %>" alt="Profile Picture" style="width: 50px; height: 50px; border-radius: 50%;">
                </p>
                <p>
                    <textarea name="comment" placeholder="Your Comment" rows="5" required></textarea>
                </p>
                <p>
                    <input type="submit" value="Submit">
                </p>
            </form>
    <%
        } else {
            // User is not logged in, show a message to log in
    %>
            <p class="text-danger">You must be logged in to comment. <a href="login.jsp">Login here</a>.</p>
    <%
        }
    %>
</div>
	                    </div>
	                </div>
	                <div class="col-lg-4">
	                    <div class="sidebar-section">
	                        <div class="recent-posts">
	                            <h4>Recent Posts</h4>
	                            <ul>
    <%
        // Query to fetch the 5 most recent posts by the same author
        String recentPostsQuery = "SELECT id, Title FROM news WHERE name = ? ORDER BY date DESC LIMIT 5";

        PreparedStatement recentStmt = conn.prepareStatement(recentPostsQuery);
        recentStmt.setString(1, author);
        ResultSet recentRs = recentStmt.executeQuery();

        while (recentRs.next()) {
            String postId = recentRs.getString("id");  // Get post ID
            String postTitle = recentRs.getString("Title");  // Get post title
    %>
            <li><a href="single-news.jsp?id=<%= postId %>"><%= postTitle %></a></li>
    <%
        }

        // Close resources
        recentRs.close();
        recentStmt.close();
    %>
</ul>
	                        </div>
	                        <div class="archive-posts">
	                            <h4>Total Posts</h4>
	                            <ul>
    <%
        // Array for month names
        String[] monthNames = {"JAN", "FEB", "MAR", "APR", "MAY", "JUN", 
                               "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"};

        while (countRs.next()) {
            int month = countRs.getInt("month"); // Get month (1-12)
            int postCount = countRs.getInt("post_count"); // Get post count
    %>
            <li>
                <a href="single-news.jsp"><%= monthNames[month - 1] %> <%= currentYear %> (<%= postCount %>)</a>
            </li>
    <%
        }
    %>
</ul>

	                        </div>
	                        <div class="tag-section">
	                            <h4>Category</h4>
	                            <ul>
	                                <li><a href="single-news.jsp"><%=category %></a></li>
	                               
	                            </ul>
	                        </div>
	                         <%
	                                    } else {
	                                        out.println("<p class='text-danger'>News article not found.</p>");
	                                    }
	
	                                    // Close the database resources
	                                    rs.close();
	                                    stmt.close();
	                                    conn.close();
	                                } catch (Exception e) {
	                                    e.printStackTrace();
	                                    out.println("<p class='text-danger'>Error fetching news article. Please try again later.</p>");
	                                }
	                            } else {
	                                out.println("<p class='text-danger'>Invalid news article ID.</p>");
	                            }
	                        %>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- end single article section -->
	
	    <!-- footer -->
	    <div class="footer-area">
	        <div class="container">
	            <div class="row">
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
	                            <li><a href="index.jsp">Home</a></li>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        // Like Button Click
        $(".like-btn").click(function () {
            const commentId = $(this).data("comment-id");
            likeDislikeComment(commentId, "like");
        });

        // Dislike Button Click
        $(".dislike-btn").click(function () {
            const commentId = $(this).data("comment-id");
            likeDislikeComment(commentId, "dislike");
        });

        // Delete Button Click
        $(".delete-btn").click(function () {
            const commentId = $(this).data("comment-id");
            deleteComment(commentId);
        });

        // Function to handle like/dislike
        function likeDislikeComment(commentId, action) {
            $.ajax({
                url: "likeDislikeComment.jsp",
                type: "POST",
                data: { comment_id: commentId, action: action },
                success: function (response) {
                    if (response.trim() === "Success") {
                        location.reload(); // Refresh the page to update counts
                    } else {
                        alert(response); // Show error message
                    }
                },
                error: function (xhr, status, error) {
                    alert("Error: " + error);
                }
            });
        }

        // Function to handle delete
        function deleteComment(commentId) {
            if (confirm("Are you sure you want to delete this comment?")) {
                $.ajax({
                    url: "deleteComment.jsp",
                    type: "POST",
                    data: { comment_id: commentId },
                    success: function (response) {
                        if (response.trim() === "Success") {
                            location.reload(); // Refresh the page after deletion
                        } else {
                            alert(response); // Show error message
                        }
                    },
                    error: function (xhr, status, error) {
                        alert("Error: " + error);
                    }
                });
            }
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