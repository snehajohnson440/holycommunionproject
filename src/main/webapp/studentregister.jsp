<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.mvc.beans.StudentCommunionBean"%>
<%@page import="com.mvc.dao.CommunionDAO"%>


<%
String studentName = request.getParameter("studentName");
String studentPassword = request.getParameter("studentPassword");
StudentCommunionBean student = new StudentCommunionBean();
student.setStudentName(studentName);
student.setStudentPassword(studentPassword);
boolean flag = CommunionDAO.register(student);
if(flag){
	response.sendRedirect("welcome.jsp"); 
}else{
	response.sendRedirect("error.jsp"); 
}
%>