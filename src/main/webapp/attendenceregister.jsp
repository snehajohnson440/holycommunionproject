<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.beans.StudentCommunionBean"%>
<%@page import="com.mvc.beans.AttendenceBean"%>
<%@page import="com.mvc.dao.CommunionDAO"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.*" %>
<%
 String date = request.getParameter("date");
 ArrayList<StudentCommunionBean> stud= CommunionDAO.fetchStudentData();
 Collections.sort(stud);
 
 boolean isAlreadySubmitted = false;
 for (StudentCommunionBean student : stud) {
     if (CommunionDAO.attendanceExists(student.getStudentId(), Integer.parseInt(date))) {
         isAlreadySubmitted = true;
         break;
     }
 }
 HashMap<Integer, String> attendanceMap = new HashMap<>();
 if (date != null) {
     ArrayList<AttendenceBean> existing = CommunionDAO.getAttendanceByDate(Integer.parseInt(date));
     for (AttendenceBean att : existing) {
         attendanceMap.put(att.getStudentId(), att.getStatus());
     }
 }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attendance Register</title>
<style>
    .btn-selected {
        background-color: black;
        color: white;
    }
</style>
<script>
    function setStatus(index, value, clickedBtn) {
        document.getElementById('status' + index).value = value;
        const buttons = clickedBtn.parentElement.querySelectorAll('button');
        buttons.forEach(btn => btn.classList.remove('btn-selected'));
        clickedBtn.classList.add('btn-selected');
    }
</script>
</head>
<body>
<h1><center>Attendance</center></h1>
<br>
<p><b> <%=date %> May 2025</b></p>
<form method="post" action="beantable.jsp">

<table style="border:1px solid black;" width="100%" cellpadding="10">
<tr style="color:black; background-color:rgba(128, 128, 128, 0.3); height: 50px;">
    <th>Roll Number</th>
    <th>Name</th>
    <th>Attendance</th>
</tr>

<%
int i = 1;
for (StudentCommunionBean student : stud) {
    String rowColor = (i % 2 == 0) ? "rgba(128, 128, 128, 0.3)" : "white";
    String existingStatus = attendanceMap.getOrDefault(student.getStudentId(), "");
%>
<tr style="background-color:<%= rowColor %>; height: 50px;">
    <td style="width:10%;"><%= i %></td>
    
    <td style="width:50%;">
        <%= student.getStudentName() %>
        <input type="hidden" name="studentId" value="<%= student.getStudentId() %>">
        <input type="hidden" name="studentName" value="<%= student.getStudentName() %>">
        <input type="hidden" name="status" id="status<%= i %>" value="<%= existingStatus%>">
        <input type="hidden" name="date" value="<%=date%>">
    </td>
    
    <td style="width:40%;">
        <button type="button" onclick="setStatus(<%= i %>, 'present', this)"
        class="<%= "present".equals(existingStatus) ? "btn-selected" : "" %>">Present</button>
        <button type="button" onclick="setStatus(<%= i %>, 'absent', this)"
        class="<%= "absent".equals(existingStatus) ? "btn-selected" : "" %>">Absent</button>
    </td>
</tr>
<%
    i++;
}
%>
</table>
<br>
<center>
    <input type="submit" name="submitAttendance" value="<%= isAlreadySubmitted ? "Update Attendance" : "Submit Attendance" %>">
</center>
</form>
</body>
</html>
