<%-- 
    Document   : add_reserve
    Created on : 23 Dec 2021, 12:56:17
    Author     : nalindagamaarachchi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.DatabaseConnection"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Hotel Online Reservation</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css " />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<nav style="background-color: rgba(0, 0, 0, 0.1);"
		class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand">Hotel Online Reservation</a>
			</div>
		</div>
	</nav>
	<ul id="menu">
		<li><a href="HotelMainPage.jsp">Home</a></li> |
		<li><a href="aboutus.jsp">About us</a></li> |
		<li><a href="contactus.jsp">Contact us</a></li> |
		<li><a href="gallery.jsp">Gallery</a></li> |
		<li><a href="dineandlounge.jsp">Dine and Lounge</a></li> |
		<li><a href="reservation.jsp">Make a reservation</a></li> |
		<li><a href="rulesandregulation.jsp">Rules and Regulation</a></li>|
		<li><a href="adminLogin.jsp">Admin Login</a></li>
	</ul>
	<div class="container-fluid">
		<div class="row">
			<div class="panel panel-default"
				style="width: 1330px; margin-left: 15px;">
				<div class="panel-body">
					<div class="col-lg-6">
						<br />
						<%
							int room_id = Integer.parseInt(request.getParameter("room_id"));
							session.setAttribute("room_id", room_id);
							Connection con = DatabaseConnection.getConnection();
							Statement statement = con.createStatement();
							ResultSet resultset = statement
									.executeQuery("SELECT * FROM `room` WHERE `room_id` = '" + request.getParameter("room_id") + "'");
							while (resultset.next()) {
						%>
						<div style="height: 300px; width: 800px;">
							<div style="float: left;">
								<img src="uploads/<%=resultset.getString(4)%>" height="300px"
									width="400px">
							</div>

							<div style="float: left; margin-left: 10px;">
								<h3>
									<%=resultset.getString(2)%>
								</h3>
								<h4 style="color: #00ff00;">
									Price:&nbsp;<%=resultset.getString(3)%>&nbsp;Rs/- Day.
								</h4>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<div class="col-lg-6">
						<div class="panel panel-default">
							<div class="panel-heading">Make A Reservation</div>
							<div class="panel-body">
								<form method="post" action="MakeReservation">
									<div class="form-group">
										<label>Firstname</label> <input type="text"
											class="form-control" name="firstname" required="required" />
									</div>
									<div class="form-group">
										<label>Middlename</label> <input type="text"
											class="form-control" name="middlename" required="required" />
									</div>
									<div class="form-group">
										<label>Lastname</label> <input type="text"
											class="form-control" name="lastname" required="required" />
									</div>
									<div class="form-group">
										<label>Address</label> <input type="text" class="form-control"
											name="address" required="required" />
									</div>
									<div class="form-group">
										<label>Contact No</label> <input type="text"
											class="form-control" name="contactno" required="required" />
									</div>
									<div class="form-group">
										<label>Check in</label> <input type="date"
											class="form-control" name="date" required="required" />
									</div>
									<div class="form-group">
										<label>Stay Days</label> <input type="text"
											class="form-control" name="day" required="required" />
									</div>
									<br />
									<div class="form-group">
										<input type="submit" class="btn btn-info" name="add_guest"
											value="Make Reservation"> &nbsp;<input type="reset"
											class="btn btn-danger" name="add_guest" value="Reset">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
</html>