<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- ... existing head content ... -->
	<style>
   body {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    margin: 0;
}

.table-container {
    width: 90%;
    max-width: 900px;
    margin: 20px auto;
    padding: 20px;
    flex: 1;
    margin-top: 200px;
    margin-bottom: 100px;
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

    .go-back-link {
        font-size: 14px;
    }
}

</style>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="table-container">
    <h1 class="text-center text-orange mb-4">Available Guides</h1>

    <div class="order-list">
        <table class="table table-striped">
            <!-- ... existing table structure ... -->
                        <thead>
                <tr>
                    <th scope="col" class="text-orange text-center">Name</th>
                    <th scope="col" class="text-orange text-center">Destination</th>
                    <th scope="col" class="text-orange text-center">Image</th>
                    <th scope="col" class="text-orange text-center">Edit</th>
                    <th scope="col" class="text-orange text-center">Delete</th>
                </tr>
            </thead>
            <?php
            $con = mysqli_connect("localhost", "root","", "project");
            $ans = mysqli_query($con, "select * from guide");

            while($row = mysqli_fetch_array($ans))
            {
            ?>
            <tr>
                <td class="text-center"><?php echo $row['gname']; ?></td>
                <td class="text-center"><?php echo $row['gdestination']; ?></td>
                <td class="text-center"><img style="width:100px;height:100px;" src="pictures/<?php echo $row['image']; ?>"></td>
                <td class="text-center">
                    <button class="btn-orange">
                        <a href="editguide.php?gdestination=<?php echo $row['gdestination']?>">Edit</a>
                    </button>
                </td>
                <td class="text-center">
                    <button class="bg-danger">
                        <a href="deleteguide.php?gdestination=<?php echo $row['gdestination']?>">Delete</a>
                    </button>
                </td>
            </tr>
            <?php
            }
            ?>
        </table>
        <a href="adminindex.php" class="go-back-link text-orange">Go Back</a>
    </div>
</div>

<%@ include file="footer.jsp" %> <!-- Add footer include if exists -->
<script src="assets/js/all.min.js"></script>
<!-- Bootstrap JS -->
<script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- FontAwesome JS (Ensure it's loaded properly) -->
<script src="assets/js/all.min.js"></script>

<!-- Main JavaScript -->
<script src="assets/js/main.js"></script>

</body>
</html>