<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.mvc.beans.StudentCommunionBean"%>
<%@page import="com.mvc.dao.CommunionDAO"%>

<%@ page import="java.net.URLEncoder" %>

<%
	String studentName = request.getParameter("studentName");
	String studentPassword = request.getParameter("studentPassword");
	StudentCommunionBean studentBean = new StudentCommunionBean();
	studentBean.setStudentName(studentName);
	studentBean.setStudentPassword(studentPassword);
	boolean flag = CommunionDAO.checkStudentLogin(studentBean);
	if(flag){
		 	session.setAttribute("studentName", studentName); 
	        response.sendRedirect("holycommunionstudenthomepage.jsp");
	}else{
		response.sendRedirect("holycommunionregister.html"); 
	}
%>