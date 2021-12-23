<%-- 
    Document   : edit_room_process
    Created on : 23 Dec 2021, 13:06:52
    Author     : nalindagamaarachchi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.DatabaseConnection"%>

<%
	int id = Integer.parseInt(request.getParameter("rid"));
	String rtype = request.getParameter("rtype");
	String price = request.getParameter("price");
	try {
		Connection con = DatabaseConnection.getConnection();
		Statement statement = con.createStatement();
		int edit_account = statement.executeUpdate("update room set room_type='" + rtype + "',price='" + price+ "' where room_id='" + id + "'");
		if (edit_account > 0) {
			response.sendRedirect("room.jsp");
		} else {
			response.sendRedirect("edit_room.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>