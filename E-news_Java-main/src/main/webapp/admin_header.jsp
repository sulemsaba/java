<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">

<!-- FontAwesome -->
<link rel="stylesheet" href="assets/css/all.min.css">

<!-- Main Style -->
<link rel="stylesheet" href="assets/css/main.css">

<!-- Navbar & Search Area CSS -->
<style>
.top-header-area {
	background-color: #333; /* Set default color */
    transition: background-color 0.3s ease;
	border-bottom: 1px solid #ddd;
	padding: 10px 0;
	margin-bottom:300px;
	position:fixed;
}

.main-menu-wrap {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.site-logo img {
	height: 100px; /* Adjust logo size */
}

.main-menu ul {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
	align-items: center;
}

.main-menu ul li {
	position: relative;
	margin-right: 20px;
}

.main-menu ul li a {
	text-decoration: none;
	color: #333;
	font-size: 16px;
	font-weight: 600;
	padding: 10px 15px;
	display: block;
	transition: 0.3s;
}

.main-menu ul li a:hover {
	color: #ff6600;
}

.sub-menu {
	display: none;
	position: absolute;
	top: 100%;
	left: 0;
	background: #fff;
	list-style: none;
	padding: 10px;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.main-menu ul li:hover .sub-menu {
	display: block;
}

.sub-menu li {
	padding: 5px 10px;
}

.profile-menu {
	position: relative;
	display: flex;
	align-items: center;
	gap: 15px;
}

.profile-menu .sub-menu {
	right: 0;
}

.profile-icon {
	font-size: 18px;
}

/* Search Area Styling */
.search-area {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	z-index: 1000;
	justify-content: center;
	align-items: center;
}

.search-bar {
	background: #fff;
	padding: 20px;
	border-radius: 10px;
	width: 50%;
	text-align: center;
	position: relative;
}

.search-bar h3 {
	margin-bottom: 10px;
	color: #333;
}

.search-bar input {
	width: 80%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 16px;
}

.search-bar button {
	padding: 10px 15px;
	background: #ff6600;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
}

.search-bar button i {
	margin-left: 5px;
}

.close-btn {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	font-size: 24px;
	color: #333;
}
/* Search Box Styling */
.search-container {
	display: none; /* Initially hidden */
	position: absolute;
	top: 100%;
	right: 0;
	background: #fff;
	border: 1px solid #ddd;
	padding: 5px;
	border-radius: 5px;
	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
	display: flex;
	align-items: center;
	transition: all 0.3s ease-in-out;
}

.search-input {
	border: 1px solid #ccc;
	padding: 5px 10px;
	width: 200px;
	border-radius: 5px;
	font-size: 14px;
	outline: none;
}

.search-button {
	background: #ff6600;
	color: #fff;
	border: none;
	padding: 5px 10px;
	border-radius: 5px;
	margin-left: 5px;
	cursor: pointer;
}

/* Mobile Responsiveness */
@media ( max-width : 991px) {
	.main-menu ul {
		flex-direction: column;
		align-items: flex-start;
	}
	.main-menu ul li {
		width: 100%;
		margin: 0;
	}
	.main-menu ul li a {
		width: 100%;
		padding: 10px;
	}
	.sub-menu {
		position: static;
		width: 100%;
	}
	.search-bar {
		width: 80%;
	}
}
</style>

<!-- Navbar Start -->
<div class="top-header-area" id="sticker">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-sm-12 text-center">
				<div class="main-menu-wrap">
					<!-- Logo -->
					<div class="site-logo">
						<a href="index.jsp"> <img src="assets/img/A3.png" alt="Logo">
						</a>
					</div>
					<!-- Logo -->

					<!-- Menu Start -->
					<nav class="main-menu">
						<ul>
							<li class="current-list-item"><a href="#">Home</a>
								<ul class="sub-menu">
									<li><a href="index.jsp">Static Home</a></li>
									<li><a href="index_2.jsp">Slider Home</a></li>
								</ul></li>
							<li><a href="news.jsp">News</a>
								<ul class="sub-menu">
									<li><a href="news.jsp">News</a></li>
									<li><a href="single-news.jsp">Single News</a></li>
								</ul></li>
							<li><a href="about.jsp">About</a></li>
							<li><a href="contact.jsp">Contact</a></li>
							<li class="profile-menu">
								<div class="header-icons">
									<a class="profile-icon" href="#"><i class="fas fa-user"></i></a>
									<ul class="sub-menu">
										<li><a href="login.jsp">Login</a></li>
										<li><a href="register.jsp">Register</a></li>
									</ul>
									
								</div>
							</li>

							<!-- Search Input in Navbar -->
							<li id="searchContainer" class="search-container"><input
								type="text" class="search-input" placeholder="Search..." />
								<button class="search-button">
									<i class="fas fa-search"></i>
								</button></li>


						</ul>
					</nav>
					<!-- Menu End -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Navbar End -->

<!-- Search Area Start -->


<!-- Search Area End -->

<!-- JavaScript for Search Functionality -->
<script>
	function toggleSearch() {
		var searchContainer = document.getElementById("searchContainer");
		if (searchContainer.style.display === "flex") {
			searchContainer.style.display = "none";
		} else {
			searchContainer.style.display = "flex";
		}
	}
</script>

<!-- Bootstrap JS -->
<script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>
