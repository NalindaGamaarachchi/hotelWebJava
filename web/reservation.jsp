<%-- 
    Document   : reservation
    Created on : 23 Dec 2021, 13:11:17
    Author     : nalindagamaarachchi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.DatabaseConnection"%>

<!DOCTYPE html>
<html lang = "en">
	<head>
		<title>Hotel Online Reservation</title>
		<meta charset = "utf-8" />
		<meta name = "viewport" content = "width=device-width, initial-scale=1.0" />
		<link rel = "stylesheet" type = "text/css" href = "css/bootstrap.css " />
		<link rel = "stylesheet" type = "text/css" href = "css/style.css" />
	</head>
<body>
	<nav style = "background-color:rgba(0, 0, 0, 0.1);" class = "navbar navbar-default">
		<div  class = "container-fluid">
			<div class = "navbar-header">
				<a class = "navbar-brand" >Hotel Online Reservation</a>
			</div>
		</div>
	</nav>	
	<ul id = "menu">
		<li><a href = "HotelMainPage.jsp">Home</a></li> |
		<li><a href = "aboutus.jsp">About us</a></li> |
		<li><a href = "contactus.jsp">Contact us</a></li> |
		<li><a href = "gallery.jsp">Gallery</a></li> |
		<li><a href = "dineandlounge.jsp">Dine and Lounge</a></li> |			
		<li><a href = "reservation.jsp">Make a reservation</a></li> |
		<li><a href = "rulesandregulation.jsp">Rules and Regulation</a></li>|
		<li><a href = "adminLogin.jsp">Admin Login</a></li>
	</ul>
	<div style = "margin-left:0;" class = "container">
		<div class = "panel panel-default" style="width:1320px;">
			<div class = "panel-body">
				<strong><h3>Make A Reservation</h3></strong>
				<%
					Connection con = DatabaseConnection.getConnection();
					Statement statement = con.createStatement();
					ResultSet resultset = statement.executeQuery("SELECT * FROM `room` ORDER BY `price` ASC");
					while(resultset.next()){
				%>
					<div class = "well" style = "height:300px; width:100%;">
						<div style = "float:left;">
							<img src = "uploads/<%=resultset.getString(4)%>" height = "250" width = "350"/>
						</div>
						<div style = "float:left; margin-left:10px;">
							<h3><%=resultset.getString(2)%></h3>
							<h4 style = "color:#00ff00;">Price:&nbsp;<%=resultset.getString(3)%>&nbsp;Rs/- Day.</h4>
							<br /><br /><br /><br /><br /><br />
							<a style = "margin-left:580px;" href = "add_reserve.jsp?room_id=<%=resultset.getInt(1) %>" class = "btn btn-info"><i class = "glyphicon glyphicon-list"></i> Reserve</a>
						</div>
					</div>
				<%
					}
				%>
			</div>
		</div>
	</div>
</body>
<script src = "js/jquery.js"></script>
<script src = "js/bootstrap.js"></script>	
</html>