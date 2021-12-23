<%-- 
    Document   : logout
    Created on : 23 Dec 2021, 13:10:46
    Author     : nalindagamaarachchi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	session.invalidate();
	response.sendRedirect("adminLogin.jsp");
%>

