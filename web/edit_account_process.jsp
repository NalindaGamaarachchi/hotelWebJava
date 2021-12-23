<%-- 
    Document   : edit_account_process
    Created on : 23 Dec 2021, 13:05:06
    Author     : nalindagamaarachchi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.DatabaseConnection"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	try {
		Connection con = DatabaseConnection.getConnection();
		Statement statement = con.createStatement();
		int edit_account = statement.executeUpdate("update admin set name='" + name + "',username='" + username+ "',password='" + password + "' where admin_id='" + id + "'");
		if (edit_account > 0) {
			response.sendRedirect("account.jsp");
		} else {
			response.sendRedirect("edit_account.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>