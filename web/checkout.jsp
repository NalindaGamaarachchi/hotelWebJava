<%-- 
    Document   : checkout
    Created on : 23 Dec 2021, 12:59:45
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
						<li><a href="home.jsp">Home</a></li>
						<li><a href="account.jsp">Accounts</a></li>
						<li class="active"><a href="index.jsp">Reservation</a></li>
						<li><a href="room.jsp">Room</a></li>
						<li><a href="logout.jsp"><span class="label label-danger"><%=(String) session.getAttribute("uname")%></span>&nbsp;Logout</a></li>
					</ul>
				</div>
				<br>
				<%
					Connection con = DatabaseConnection.getConnection();
					Statement statement = con.createStatement();
					ResultSet resultset = statement.executeQuery("select count(*) from travel where status='CheckOut'");
					resultset.next();
				%>
				<div class="panel panel-default">
					<div class="panel-body">
						<a class="btn btn-success" href="index.jsp"><span
							class="badge"></span> Pendings</a> <a class="btn btn-info"
							href="checkin.jsp"><span class="badge"></span> Check In</a> <a
							class="btn btn-warning disabled" href="checkout.jsp"><span
							class="badge"><%=resultset.getInt(1)%></span> Check Out</a> <br>
						<br>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>Id</th>
									<th>Name</th>
									<th>Room Type</th>
									<th>Room No</th>
									<th>Check In</th>
									<th>Days</th>
									<th>Check Out</th>
									<th>Status</th>
									<th>Extra Bed</th>
									<th>Bill</th>
									<th>Remark</th>

								</tr>
							</thead>
							<%
								Statement st = con.createStatement();
								ResultSet rs = st.executeQuery("SELECT * FROM travel NATURAL JOIN guest NATURAL JOIN room WHERE status='CheckOut'");
								while (rs.next()) {
							%>
							<tbody>
								<tr>
									<td><%=rs.getInt(1)%></td>
									<td><%=rs.getString(11)%>&nbsp;<%=rs.getString(12)%>&nbsp;<%=rs.getString(13)%></td>
									<td><%=rs.getString(16)%></td>
									<td><%=rs.getString(8)%></td>
									<td><label style = 'color:#00ff00;'><%=rs.getString(4)%></label></td>
									<td><%=rs.getInt(5)%></td>
									<td><label style = 'color:#ff0000;'><%=rs.getString(6)%></label></td>
									<td><%=rs.getString(7)%></td>
									<td><%=rs.getInt(9)%></td>
									<td><%=rs.getInt(10)%>&nbsp;Rs</td>
									<td><label style = 'color:green;'>Paid</label></td>
								</tr>
							</tbody>

							<%
								}
							%>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br />
	<br />
	<div style="text-align: right; margin-right: 10px;"
		class="navbar navbar-default navbar-fixed-bottom">
		<label>&copy; Copyright HOR 2019 </label>
	</div>
</body>
</html>