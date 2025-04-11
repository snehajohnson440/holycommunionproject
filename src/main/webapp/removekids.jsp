<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.beans.StudentCommunionBean"%>
<%@page import="com.mvc.beans.AttendenceBean"%>
<%@page import="com.mvc.dao.CommunionDAO"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1><center>Students</center></h1>
<h4><center>Refresh To See Action</center></h4>
<table border="1" width=100% cellpadding="10px"  style="border-collapse:collapse;">
<tr>
<th>Roll No</th>
<th>Name</th>
<th>Action</th>
</tr>
<%
int i=1;
ArrayList<StudentCommunionBean> student = CommunionDAO.fetchStudentData();
Collections.sort(student);
for(StudentCommunionBean students:student){
%>
<tr>
<td width=20%><%=i%></td>
<td width=50%><%=students.getStudentName()%></td>
<td width=30%> <form method="post" action="removeStudent.jsp">
      <input type="hidden" name="studentId" value="<%=students.getStudentId()%>">
      <input type="submit" value="REMOVE"></form></td>
</tr>
<%
i++;
}
%>
</table>
</body>
</html>