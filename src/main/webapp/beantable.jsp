<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.mvc.beans.AttendenceBean" %>
<%@ page import="com.mvc.dao.CommunionDAO" %>

<%
    String dateStr = request.getParameter("date");
    int date = Integer.parseInt(dateStr);
    String[] studentIds = request.getParameterValues("studentId");
    String[] studentNames = request.getParameterValues("studentName");
    String[] statuses = request.getParameterValues("status");

    boolean allSuccess = true;

    for (int i = 0; i < studentIds.length; i++) {
        AttendenceBean bean = new AttendenceBean();
        bean.setStudentId(Integer.parseInt(studentIds[i]));
        bean.setStudentName(studentNames[i]);
        bean.setDate(date);
        bean.setStatus(statuses[i]);

        boolean success = CommunionDAO.saveOrUpdateAttendance(bean); // This does the check inside
        if (!success) {
            allSuccess = false;
            break;
        }
    }

    if (allSuccess) {
        response.sendRedirect("attendencemarked.html");
    } else {
        response.sendRedirect("maintainance.html");
    }
%>
