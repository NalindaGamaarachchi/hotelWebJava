<%-- 
    Document   : confirm_reserve
    Created on : 23 Dec 2021, 13:01:28
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
	<nav style="background-color: rgba(0, 0, 0, 0.1);"
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
				<br />
				<div class="container-fluid">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="alert alert-info">Fill up form</div>
							<%
								int travel_id = Integer.parseInt(request.getParameter("id"));
								session.setAttribute("travel_id", travel_id);
								Connection con = DatabaseConnection.getConnection();
								Statement statement = con.createStatement();
								ResultSet resultset = statement.executeQuery("SELECT * FROM travel NATURAL JOIN guest NATURAL JOIN room WHERE id = '"+ request.getParameter("id") + "'");
								while (resultset.next()) {
							%>
							<br />
							<div class="container-fluid">
								<div class="panel panel-default">
									<div class="panel-body">
										<form method="post" action="confirm_reserve_process.jsp">
											<div class="form-group" style="float: left;">
												<label>First Name:</label> <input type="text"
													value="<%=resultset.getString(11)%>" class="form-control"
													size="40" disabled="disabled" />
											</div>
											<div class="form-group"
												style="float: left; margin-left: 20px;">
												<label>Middle Name:</label> <br /> <input type="text"
													value="<%=resultset.getString(12)%>" class="form-control"
													size="40" disabled="disabled" />
											</div>
											<div class="form-group"
												style="float: left; margin-left: 20px;">
												<label>Last Name:</label> <br /> <input type="text"
													value="<%=resultset.getString(13)%>" class="form-control"
													size="40" disabled="disabled" />
											</div>
											<br style="clear: both;" /> <br />
											<div class="form-group" style="float: left;">
												<label>Room Type</label> <br /> <input type="text"
													value="<%=resultset.getString(16)%>" class="form-control"
													size="20" disabled="disabled" />
											</div>
											<div class="form-group"
												style="float: left; margin-left: 20px;">
												<label>Days</label> <br /> <input type="text" name="days"
													value="<%=resultset.getString(5)%>" class="form-control"
													readonly />
											</div>
											<%
												}
											%>
											<div class="form-group"
												style="float: left; margin-left: 20px;">
												<label>Room No</label> <br /> <input type="number" min="0"
													max="999" name="room_no" class="form-control"
													required="required" />
											</div>
											<div class="form-group"
												style="float: left; margin-left: 20px;">
												<label>Extra Bed</label> <br /> <input type="number"
													min="0" max="99" name="extra_bed" class="form-control" />
											</div>
											<div class="form-group"
												style="float: left; margin-left: 20px;">
												<label style="color: #ff0000;">*Extra Bed cost 800</label>
											</div>
											<br style="clear: both;" /> <br />
											<button name="add_form" class="btn btn-primary">
												<i class="glyphicon glyphicon-save"></i> Submit
											</button>
										</form>
									</div>
								</div>
							</div>
						</div>
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
<script src="../js/jquery.js"></script>
<script src="../js/bootstrap.js"></script>
</html>
