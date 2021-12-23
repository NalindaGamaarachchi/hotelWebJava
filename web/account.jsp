<%-- 
    Document   : account
    Created on : 23 Dec 2021, 12:52:43
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
						<li><a href="home.jsp">Home</a></li>
						<li class="active"><a href="account.jsp">Accounts</a></li>
						<li><a href="index.jsp">Reservation</a></li>
						<li><a href="room.jsp">Room</a></li>
						<li><a href="logout.jsp"><span class="label label-danger"><%=(String) session.getAttribute("uname")%></span>&nbsp;Logout</a></li>
					</ul>
				</div>
				<br />
				<%
					Connection con = DatabaseConnection.getConnection();
					Statement statement = con.createStatement();
				%>
				<div class="container-fluid">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="alert alert-info">Accounts</div>
							<a class="btn btn-success" href="add_account.jsp"><i
								class="glyphicon glyphicon-plus"></i> Create New Account</a> <br />
							<br />
							<table id="table" class="table table-bordered">
								<thead>
									<tr>
										<th>Id</th>
										<th>Name</th>
										<th>Username</th>
										<th>Password</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<%
										ResultSet resultset = statement.executeQuery("select * from admin");
										while (resultset.next()) {
									%>
									<tr>
										<td><%=resultset.getInt(1)%></td>
										<td><%=resultset.getString(2)%></td>
										<td><%=resultset.getString(3)%></td>
										<td><%=resultset.getString(4)%></td>
										<td><center>
												<a class="btn btn-warning"
													href="edit_account.jsp?admin_id=<%=resultset.getInt(1)%>"><i
													class="glyphicon glyphicon-edit"></i> Edit</a> <a
													class="btn btn-danger"
													onclick="confirmationDelete(this); return false;"
													href="delete_account.jsp?admin_id=<%=resultset.getInt(1)%>"><i
													class="glyphicon glyphicon-remove"></i> Delete</a>
											</center></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
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
<script src="../js/jquery.dataTables.js"></script>
<script src="../js/dataTables.bootstrap.js"></script>
<script type="text/javascript">
	function confirmationDelete(anchor) {
		var conf = confirm("Are you sure you want to delete this record?");
		if (conf) {
			window.location = anchor.attr("href");
		}
	}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#table").DataTable();
	});
</script>
</html>