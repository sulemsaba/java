<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">

<!-- FontAwesome -->
<link rel="stylesheet" href="assets/css/all.min.css">

<!-- Main Style -->
<link rel="stylesheet" href="assets/css/main.css">

<!-- Meta Viewport Tag for Responsiveness -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Navbar & Search Area CSS -->
<style>
/* Adjusting Header for Responsiveness */
.top-header-area {
	background-color: #333; /* Set default color */
	transition: background-color 0.3s ease;
	border-bottom: 1px solid #ddd;
	padding: 10px 15px;
	position: fixed;
	width: 100%;
	z-index: 1000;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.main-menu-wrap {
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 100%;
}

/* Logo */
.site-logo img {
	height: 80px; /* Responsive logo size */
	max-width: 100%;
}

/* Navbar Links */
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
	color: #fff;
	font-size: 16px;
	font-weight: 600;
	padding: 10px 15px;
	display: block;
	transition: 0.3s;
}

.main-menu ul li a:hover {
	color: #ff6600;
}

/* Dropdown Menu */
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
	min-width: 150px;
}

.main-menu ul li:hover .sub-menu {
	display: block;
}

.sub-menu li {
	padding: 5px 10px;
}

/* Profile and Search Icons */
.profile-menu {
	display: flex;
	align-items: center;
	gap: 15px;
}

.profile-menu .sub-menu {
	right: 0;
}

/* Search Area */
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

/* Mobile Responsiveness */
@media (max-width: 991px) {
	.main-menu ul {
		flex-direction: column;
		align-items: flex-start;
		display: none; /* Hide menu initially */
		position: absolute;
		top: 60px;
		left: 0;
		width: 100%;
		background: #333;
		padding: 10px;
	}

	.main-menu ul.active {
		display: flex;
	}

	.main-menu ul li {
		width: 100%;
		margin: 0;
	}

	.main-menu ul li a {
		width: 100%;
		padding: 10px;
		color: #fff;
		display: block;
	}

	.sub-menu {
		position: static;
		width: 100%;
		background: none;
	}

	.site-logo img {
		height: 60px; /* Smaller logo on mobile */
	}

	.main-menu-wrap {
		flex-direction: row;
		align-items: center;
		justify-content: space-between;
		width: 100%;
	}

	.menu-toggle {
		display: block;
		cursor: pointer;
		font-size: 24px;
		color: #fff;
		margin-left: auto;
		padding: 10px;
	}

	.main-menu ul li a:hover {
		color: #ff6600;
	}

	.search-bar {
		width: 90%;
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

					<!-- Hamburger Menu for Mobile -->
					<div class="menu-toggle" onclick="toggleMenu()">
						<i class="fas fa-bars"></i>
					</div>

					<!-- Menu Start -->
					<nav class="main-menu">
						<ul>
							<li class="current-list-item"><a href="#">Home</a>
								<ul class="sub-menu">
									<li><a href="index.jsp">Static Home</a></li>
									<li><a href="index.jsp">Slider Home</a></li>
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

<!-- JavaScript for Search Functionality and Menu Toggle -->
<script>
function toggleSearch() {
	var searchContainer = document.getElementById("searchContainer");
	searchContainer.style.display = searchContainer.style.display === "flex" ? "none" : "flex";
}

function toggleMenu() {
	var menu = document.querySelector('.main-menu ul');
	menu.classList.toggle('active');
}


</script>

<!-- Bootstrap JS -->
<script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>