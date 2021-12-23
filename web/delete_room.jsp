<%-- 
    Document   : delete_room
    Created on : 23 Dec 2021, 13:03:53
    Author     : nalindagamaarachchi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.DatabaseConnection"%>

<%
	String id = request.getParameter("room_id");
	Connection con = DatabaseConnection.getConnection();
	Statement statement = con.createStatement();
	int deleteAccount = statement.executeUpdate("delete from room where room_id='" + id + "'");
	if (deleteAccount > 0) {
		response.sendRedirect("room.jsp");
	} else {
		response.sendRedirect("room.jsp");
	}
%>