<%@ page import="java.sql.*" %>
<%
    // Check if the admin session exists
    if (session.getAttribute("admin") == null) {
        // Redirect to login page if the admin is not logged in
        response.sendRedirect("login.jsp?message=Please login as admin to access this page.");
        return;
    }

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/enews";
    String dbUser = "root";
    String dbPassword = "";

    // Variables to store counts
    int newsCount = 0;
    int userCount = 0;
    int reviewCount = 0;
    int contactCount = 0;
    int asrafNewsCount = 0; // New variable for asraflosted@gmail.com news count

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the database connection
        Connection con = DriverManager.getConnection(url, dbUser, dbPassword);

        // Query to count the number of news
        String newsQuery = "SELECT COUNT(*) AS news_count FROM news";
        PreparedStatement newsStmt = con.prepareStatement(newsQuery);
        ResultSet newsRs = newsStmt.executeQuery();
        if (newsRs.next()) {
            newsCount = newsRs.getInt("news_count");
        }
     // Query to count the number of users
        String userQuery = "SELECT COUNT(*) AS user_count FROM registrationform";
        PreparedStatement userStmt = con.prepareStatement(userQuery);
        ResultSet userRs = userStmt.executeQuery();
        if (userRs.next()) {
            userCount = userRs.getInt("user_count");
        }

        // Query to count the number of reviews
        String reviewQuery = "SELECT COUNT(*) AS review_count FROM review";
        PreparedStatement reviewStmt = con.prepareStatement(reviewQuery);
        ResultSet reviewRs = reviewStmt.executeQuery();
        if (reviewRs.next()) {
            reviewCount = reviewRs.getInt("review_count");
        }

        // Query to count the number of contact messages
        String contactQuery = "SELECT COUNT(*) AS contact_count FROM contact";
        PreparedStatement contactStmt = con.prepareStatement(contactQuery);
        ResultSet contactRs = contactStmt.executeQuery();
        if (contactRs.next()) {
            contactCount = contactRs.getInt("contact_count");
        }


        // Query to count news by asraflosted@gmail.com
        String asrafNewsQuery = "SELECT COUNT(*) AS asraf_count FROM news WHERE email = ?";
        PreparedStatement asrafNewsStmt = con.prepareStatement(asrafNewsQuery);
        asrafNewsStmt.setString(1, "asraflosted@gmail.com");
        ResultSet asrafNewsRs = asrafNewsStmt.executeQuery();
        if (asrafNewsRs.next()) {
            asrafNewsCount = asrafNewsRs.getInt("asraf_count");
        }

        
        // Close resources
        newsRs.close();
        newsStmt.close();
        asrafNewsRs.close();
        asrafNewsStmt.close();
        userRs.close();
        userStmt.close();
        reviewRs.close();
        reviewStmt.close();
        contactRs.close();
        contactStmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p class='text-danger'>Error fetching data from the database. Please try again later.</p>");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

    <!-- title -->
    <title>Admin</title>

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
        /* Add your custom styles here */
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
                        <a class="mobile-show search-bar-icon" href="#"><i class="fas fa-profile"></i></a>
                        <div class="mobile-menu"></div>
                        <!-- menu end -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end header -->

    <!-- breadcrumb-section -->
    <div class="breadcrumb-section breadcrumb-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 text-center">
                    <div class="breadcrumb-text">
                        <h1>Admin Site</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end breadcrumb section -->

    <h3 class="text-uppercase text-center my-4">Dashboard</h3>
    <div class="row gap-1">
        <!-- Welcome Section -->
        <div class="container p-3 col-12 col-sm-12 col-md-5 bg-white shadow-lg bg-body rounded text-center">
            <h4>Welcome!</h4>
            <p><%= session.getAttribute("admin") %></p>
            <p>
                <a href="adminprofile.jsp" class="w-auto rounded text-center">
                    <input type="submit" value="MD ASRAF ALI">
                </a>
            </p>
        </div>

        <!-- Add News Section -->
        <div class="container p-3 col-12 col-sm-12 col-md-5 bg-white shadow-lg bg-body rounded text-center">
            <h4><%=  asrafNewsCount  %></h4>
            <p>Add News</p>
            <p>
                <a href="addnews.jsp" class="w-auto rounded text-center">
                    <input type="submit" value="Add News">
                </a>
            </p>
        </div>

        <!-- Total Users Section -->
        <div class="container p-3 col-12 col-sm-12 col-md-5 bg-white shadow-lg bg-body rounded text-center my-3">
            <h4><%= userCount %></h4>
            <p>Total Users</p>
            <p>
                <a href="checkuser.jsp" class="w-auto rounded text-center">
                    <input type="submit" value="Check User">
                </a>
            </p>
        </div>

        <!-- Added News Section -->
        <div class="container p-3 col-12 col-sm-12 col-md-5 bg-white shadow-lg bg-body rounded text-center my-3">
            <h4><%= asrafNewsCount  %></h4>
            <p>Added News</p>
            <p>
                <a href="addednews.jsp" class="w-auto rounded text-center">
                    <input type="submit" value="Added News">
                </a>
            </p>
        </div>

        <!-- Messages Section -->
        <div class="container p-3 col-12 col-sm-12 col-md-5 bg-white shadow-lg bg-body rounded text-center my-3">
            <h4><%= contactCount %></h4>
            <p>Messages</p>
            <p>
                <a href="contactmessages.jsp" class="w-auto rounded text-center">
                    <input type="submit" value="Contact Messages">
                </a>
            </p>
        </div>

        <!-- Available News Section -->
        <div class="container p-3 col-12 col-sm-12 col-md-5 bg-white shadow-lg bg-body rounded text-center my-3">
            <h4><%= newsCount %></h4>
            <p>Available News</p>
            <p>
                <a href="availablenews.jsp" class="w-auto rounded text-center">
                    <input type="submit" value="Available News">
                </a>
            </p>
        </div>

        <!-- Review Section -->
        <div class="container p-3 col-12 col-sm-12 col-md-5 bg-white shadow-lg bg-body rounded text-center my-3">
            <h4><%= reviewCount %></h4>
            <p>Review</p>
            <p>
                <a href="checkreview.jsp" class="w-auto rounded text-center">
                    <input type="submit" value="Check Review">
                </a>
            </p>
        </div>
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
    <!-- main js -->
    <script src="assets/js/main.js"></script>
</body>
</html>