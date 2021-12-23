<%-- 
    Document   : delete_account
    Created on : 23 Dec 2021, 13:03:11
    Author     : nalindagamaarachchi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.DatabaseConnection"%>

<%
	String id = request.getParameter("admin_id");
	Connection con = DatabaseConnection.getConnection();
	Statement statement = con.createStatement();
	int deleteAccount = statement.executeUpdate("delete from admin where admin_id='" + id + "'");
	if (deleteAccount > 0) {
		response.sendRedirect("account.jsp");
	} else {
		response.sendRedirect("account.jsp");
	}
%>