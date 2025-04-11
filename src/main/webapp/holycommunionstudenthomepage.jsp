<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.beans.StudentCommunionBean"%>
<%@page import="com.mvc.dao.CommunionDAO"%>
<%@page import="java.util.*"%>


<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    String studentName = (String) session.getAttribute("studentName");
    if (studentName == null) {
        response.sendRedirect("holycommunionstudentlogin.html"); // force login
    }
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Expires" content="0">
    <title>Holy Communion Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Andika+New+Basic&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
	<style>
        body {
            font-family: 'Andika New Basic', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #F5F5F5;
        }

        /* Header */
        .header {
            position: absolute;
            top: 10px;
            left: 20px;
            color: white;
            font-size: 18px;
            font-weight: bold;
        }

        .logout-btn {
            position: absolute;
            top: 10px;
            right: 20px;
            background-color: #b89d5b;
            color: #fffef2;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 5px;
            font-weight: bold;
        }
        .logout-btn:hover {
            background-color: black;
            color: white;
        }

        /* Hero Image */
        .hero {
            width: 100%;
            height: 550px;
            background: url('images/jesusnew.jpg') no-repeat center center;
            background-size: cover;
            position: relative;
        }
		 .quote-on-image {
			  position: absolute;
			  bottom: 20px;
			  left:20%;
			  transform: translateX(-800%);
			  transform: translateY(-250%);
			  color: white;
			  font-size: 18px;
			  text-align: center;
			  max-width: 80%;
			  font-style: italic;
			}

     .quote-on-image span {
		  display: block;
		  margin-top: 5px;
		  font-size: 16px;
		  font-weight: 400;
		}
		 .announcements {
            text-align: center;
            padding: 20px;
            font-size: 40px;
            font-weight: bold;
			font-family: 'Poppins', sans-serif;
			font-weight: 400;
        }

        .announcement-box {
            width: 90%;
            background: white;
            border-radius: 10px;
            padding: 20px;
            display: flex;
            align-items: center;
            border: 1px solid #ccc;
            margin-top: 15px;
			margin-left:60px;
			gap:5px;
        }

        .announcement-image {
            width: 300px;
            height: 300px;
            border-radius: 5px;
            object-fit: cover;
        }

        .announcement-content {
            margin-left: 15px;
            text-align: left;
            font-size: 16px;
            margin-bottom:auto;
        }

        .see-all {
            text-align: center;
            margin-top: 15px;
            color: blue;
            cursor: pointer;
        }
        .see-all:hover {
            text-decoration: none;
        }
		    /* Calendar Section */
    .calendar {
    width: 100%;
    margin: 10px;
    text-align: center;
    overflow-x: auto; /* Allow horizontal scrolling */
    white-space: nowrap; /* Keep boxes in one line */
    padding-bottom: 10px;
}

    .month {
        font-size: 20px;
        font-weight: bold;
        text-align: left;
        margin-bottom: 10px;
		margin-left: 10px;
    }


.calendar-grid {
    display: flex;
    flex-wrap: nowrap; /* Prevent wrapping */
    gap: 5px;
    padding: 10px;
    width: max-content; /* Fit content width */
}

.date-box {
    flex: 1 1 calc(16.66% - 10px); /* Each box takes 1/6th of the row minus spacing */
    min-width: 120px; /* Ensure a minimum width */
    height: 80px; /* Increase height for better visibility */
    padding: 10px;
    color: white;
    text-align: center;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
    text-decoration: none;
    display: flex;
    align-items: center;
    justify-content: center;
}


    .green { background-color: green; }
    .red { background-color: red; }
    .gray { background-color: gray; }

    .date-box:hover {
        opacity: 0.8;
    }
	
        .attendance {
			text-align:center;
            font-size: 30px;
            color: green;
        }

        .homework {
            font-size: 18px;
            text-align: left;
			margin-left:10px;
			
      
        }
		.text{
			font-size:17px;
			text-align:left;
			color:gray;
			margin-left:10px;
		}
        .countdown-section {
			position: relative;
			margin-top: 30px;
			padding: 100px 50px; /* Increase padding to move text down */
			background: url('https://i0.wp.com/jerseycatholic.org/wp-content/uploads/2024/05/communion.jpg?resize=765%2C500&ssl=1') rgba(0, 0, 0, 0.5) no-repeat center;
			background-size: cover;
			width:100%;
			height:200px;
			color: black;
			font-size: 30px;
			font-weight: bold;
			text-align: center;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;

		}
		.countdown-section::before {
			content: "";
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background: rgba(255, 255, 255, 0.4); /* Dark overlay (50% opacity) */
			z-index: 0;
		}
		
		
        .countdown-section .number {
            font-size: 50px;
            font-weight: bold;
			text-align:center;
			position: relative;
			z-index: 1;
        }
		.footer {
			display: flex;          /* Align sections side by side */
			justify-content: space-between; /* Space them out evenly */
			background-color: #c4965b; /* Match your footer background */
			padding: 20px;
			color: black;
			font-family: 'Poppins', sans-serif;
			font-weight: 600;
			height:400px;
			width:100%;
		}

/* Style for each section (Contact, Download, About Church) */
		.footer div {
			flex: 1;          /* Distributes space equally */
			margin: 0 20px;   /* Adds spacing between sections */
		}

/* Ensure links look visible */
		.footer a {
			color: gray; /* Dark gray color */
			text-decoration: none;
			font-weight: bold;
			font-family: 'Poppins', sans-serif;
			font-weight: 400;
		}

		.footer a:hover {
			color: black; /* Darkens on hover */
			text-decoration: underline;
		}

    </style>


</head>
<body>
    <div class="hero">
    <%String firstName = studentName.split(" ")[0];
    
    %>
        <div class="header">Hello <%=firstName%></div>
        <button class="logout-btn" onclick="window.location.href='logout.jsp';">Log Out</button>
    </div>
	<div class="quote-on-image">
      "Let the little children come to me, and do not hinder them, for the kingdom of heaven belongs to such as these."
      <span>- Matthew 19:14</span>
    </div>
  </div>
	 <div class="announcements">ANNOUNCEMENTS</div>

    <div class="announcement-box">
        <img src="https://nwlc.org/wp-content/uploads/2017/04/black-teacher.jpg" alt="Person" class="announcement-image">
        <div class="announcement-content">
            <p style="font-size:19px;"><strong>Recent</strong></p>
        <% 
	        ArrayList<String> annouce = CommunionDAO.fetchAnnoucements();
	        for(String annoucement:annouce){%>
	        <p><%=annoucement%></p>
	        	<% }
        %>
        </div>
    </div>
    
    
    <p class ="announcements"> ATTENDANCE </p>
	<div class="month">MAY</div>
	<div class="calendar">
    
    <div class="calendar-grid">
       <%
       	int i= 12;
        String s ="";
        while(i<=26){
        	s=CommunionDAO.attendence(studentName,i);
        	if("present".equals(s)){
        	%>
        		<a href="#" class="date-box green">
        		<%=i %> 
        		<br> 09:00-10:00</a>
        	<% }
        	else if("absent".equals(s)){ %>
        		<a href="#" class="date-box red">
    		<%=i %> 
    		<br> 09:00-10:00</a>
        	<% }
        	else{%>
        		<a href="#" class="date-box gray">
    		<%=i %> 
    		<br> 09:00-10:00</a>
        	<% }
        	i++;
        }
       %>
    </div>
	
	</div>
	<br>
	<div class="see-all"><p style="color:red">ABSENT</p><p style="color:green">PRESENT</p></div>
	<br><br>
	<div class="image">
    <div class="countdown-section">
        <div class="number">CELEBRATING ON</div>
        <div class="number" style="font-size:48px;">28th May 2025</div>
    </div>
	</div>
	<div class="footer">
    <div class="contact">
        <h3>CONTACT</h3>
        <p><a href="contact.html#teacher">Teacher</a></p>
        <p><a href="contact.html#father">Father</a></p>
        <p><a href="contact.html#kid">Leader</a></p>
        <p><a href="contact.html#team">Holy Communion Team</a></p>
    </div>
    
    <div class="download">
        <h3>DOWNLOAD</h3>
        <p><a href="card.jsp">Holy Communion Card</a></p>
        <p><a href="images/prayers.pdf" target="_blank">Prayer</a></p>
    </div>

    <div class="about">
        <h3>About Church</h3>
        <p><a href="church.html" style="color:black;">St John Baptist Church<br>
        Moonnumuri, Kodaly 680684</a></p>
    </div>
</div>

</body>
</html>
