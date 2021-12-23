<%-- 
    Document   : home
    Created on : 23 Dec 2021, 13:09:04
    Author     : nalindagamaarachchi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.DatabaseConnection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hotel Management System Dashboard</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<nav style="background-color:rgba(0, 0, 0, 0.1);"
		class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand">Hotel Online Reservation</a>
		</div>
	</div>
	</nav>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="container-fluid">
					<ul class="nav nav-pills">
						<li class="active"><a href="home.jsp">Home</a></li>
						<li><a href="account.jsp">Accounts</a></li>
						<li><a href="index.jsp">Reservation</a></li>
						<li><a href="room.jsp">Room</a></li>
						<li><a href="logout.jsp"><span class="label label-danger"><%=(String) session.getAttribute("uname")%></span>&nbsp;Logout</a></li>
					</ul>
				</div>
				<br />
				<div class="container-fluid">
					<div class="panel panel-default">
						<div class="panel-body">
							<center>
								<img src="images/welcome.jpg" width="1100px" height="350px" />
							</center>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="text-align: right; margin-right: 10px;"
		class="navbar navbar-default navbar-fixed-bottom">
		<label>&copy; Copyright HOR 2019 </label>
	</div>
</body>
<script src="../js/jquery.js"></script>
<script src="../js/bootstrap.js"></script>
</html>