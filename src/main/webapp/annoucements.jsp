<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.dao.CommunionDAO"%>
<%
String annoucements = request.getParameter("annoucements");
if (annoucements != null && !annoucements.trim().isEmpty()) {
    CommunionDAO.sendAnnoucements(annoucements);
%>
<html>
<body>
<h1><center>Your Annoucement Has Been Send</center></h1>
</body>
</html>
<% } else{
	%>
<html>
<body>
<h1><center>Your Annoucement Is Empty</center></h1>

</body>
</html>
<%}
%>

