<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.dao.CommunionDAO"%>
<%
String sid = request.getParameter("studentId");
int id = Integer.parseInt(sid);
CommunionDAO.removekids(id);
%>
<html>
<body>
<h1><center>Student Has Been Removed</center></h1>
</body>
</html>