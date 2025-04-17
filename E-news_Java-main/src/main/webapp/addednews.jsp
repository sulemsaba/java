<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
// Check if the admin session exists
if (session.getAttribute("admin") == null) {
    response.sendRedirect("login.jsp?message=Please login as admin to access this page.");
    return;
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
        /* Add your custom CSS styles here */
        .btn-orange {
            background-color: #FF7300 !important;
            color: white !important;
            text-decoration: none;
            padding: 8px 12px;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
        }

        .bg-danger {
            background-color: #dc3545 !important;
            color: white !important;
            text-decoration: none;
            padding: 8px 12px;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            display: inline-block; /* Ensure it behaves like a button */
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
	    margin-top: 100px;
	    margin-bottom: 200px;
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
	
	td img {
	    max-width: 80px;
	    height: auto;
	    border-radius: 5px;
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
	
	    td img {
	        max-width: 60px;
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
                        <h1>News Added By admin</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end breadcrumb section -->

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

    <div class="table-container mt-0">
        <h1 class="text-center text-orange mb-4">News Added by Admin</h1>

        <div class="order-list">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col" class="text-orange text-center">ID</th>
                        <th scope="col" class="text-orange text-center">Title</th>
                        <th scope="col" class="text-orange text-center">Name</th>
                        <th scope="col" class="text-orange text-center">Content</th>
                        <th scope="col" class="text-orange text-center">Category</th>
                        <th scope="col" class="text-orange text-center">Date</th>
                        <th scope="col" class="text-orange text-center">Like Count</th>
                        <th scope="col" class="text-orange text-center">Image</th>
                        <th scope="col" class="text-orange text-center">Edit</th>
                        <th scope="col" class="text-orange text-center">Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    // Database connection and query execution
                    String url = "jdbc:mysql://localhost:3306/enews";
                    String user = "root";
                    String password = "";
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    
                    try {
                        con = DriverManager.getConnection(url, user, password);
                        String sql = "SELECT * FROM news WHERE email = ?";
                        pstmt = con.prepareStatement(sql);
                        pstmt.setString(1, "asraflosted@gmail.com");
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                    %>
                            <tr>
                                <td class="text-center"><%= rs.getInt("id") %></td>
                                <td class="text-center"><%= rs.getString("Title") %></td>
                                <td class="text-center"><%= rs.getString("name") %></td>
                                <td class="text-center"><%= rs.getString("content") %></td>
                                <td class="text-center"><%= rs.getString("category") %></td>
                                <td class="text-center"><%= rs.getString("date") %></td>
                                <td class="text-center"><%= rs.getString("like_count") %></td>
                                <td class="text-center"><img style="width:100px;height:100px;" src="<%= rs.getString("videos") %>"></td>
                                <td class="text-center">
                                    <a href="EditNewsServlet?id=<%= rs.getInt("id") %>" class="btn-orange  mt-2">Edit</a>
                                </td>
                                <td class="text-center">
                                    <a href="DeleteNewsServlet?id=<%= rs.getInt("id") %>" class="bg-danger">Delete</a>
                                </td>
                            </tr>
                    <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } finally {
                        // Close resources
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (con != null) con.close();
                    }
                    %>
                </tbody>
            </table>
            <a href="adminindex.jsp" class="go-back-link text-orange">Go Back</a>
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
    <!-- form validation js -->
    <script src="assets/js/form-validate.js"></script>
    <!-- main js -->
    <script src="assets/js/main.js"></script>
</body>
</html>