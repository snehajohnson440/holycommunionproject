<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.mvc.beans.TeacherCommunionBean"%>
<%@page import="com.mvc.dao.CommunionDAO"%>

<%
String teacherName = request.getParameter("teacherName");
String teacherPassword = request.getParameter("teacherPassword");
TeacherCommunionBean teacherBean = new TeacherCommunionBean();
teacherBean.setTeacherName(teacherName);
teacherBean.setTeacherPassword(teacherPassword);
boolean flag = CommunionDAO.checkTeacherLogin(teacherBean);
if(flag){
	response.sendRedirect("holycommunionteacherhomepage.jsp?teachername="+teacherName);
}else{
	response.sendRedirect("contact.html");
}
%>