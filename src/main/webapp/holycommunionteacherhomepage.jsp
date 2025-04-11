<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.dao.CommunionDAO"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Attendance Dashboard</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap" rel="stylesheet">
  <style>
    body {
            font-family: 'Andika New Basic', sans-serif;
            margin: 0;
            padding: 0;
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
            background-color: #0f2c54;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 5px;
            font-weight: bold;
        }
        .logout-btn:hover {
            background-color:green;
            color: white;
        }

        /* Hero Image */
        .hero {
            width: 100%;
            height: 550px;
            background: url('images/teacherwallpaper.jpg') no-repeat center center;
            background-size: cover;
            position: relative;
        }
		     .quote-on-image {
      position: absolute;
      bottom: 20px;
	  left:10%;
      transform: translateX(-600%);
	  transform: translateY(-800%);
      color: gray;
      font-size: 18px;
      text-align: center;
      max-width: 80%;
      text-shadow: 2px 2px 5px rgba(0,0,0,0.7);
      font-style: italic;
    }

    . .quote-on-image span {
      display: block;
      margin-top: 5px;
      font-size: 16px;
      font-weight: 400;
    }

    .attendance-section {
      padding: 60px 20px;
      background-color: #ffffff;
      text-align: center;
    }

    .section-title {
      font-size: 50px;
	  font-family: 'Poppins', sans-serif;
      font-weight: 100;
	  margin-top: 5px;
      margin-bottom: 40px;
      letter-spacing: 1px;
    }

    .attendance-box {
      display: flex;
      justify-content: center;
      align-items: center;
      max-width: 3000px;
      margin: 0 auto;
      padding: 30px;
      background-color: #ffffff;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
    }

    .attendance-left {
      flex: 1;
      font-size: 48px;
      font-weight: 500;
      color: #000;
      border-right: 2px solid #e0e0e0;
      padding-right: 30px;
    }

    .attendance-right {
      flex: 2;
      padding-left: 30px;
      text-align: left;
    }

    .attendance-desc {
      margin: 0 100px 50px;
      color: #555;
      font-size: 16px;
    }

    .attendance-link {
      font-size: 14px;
      font-weight: bold;
      color: #1a73e8;
      text-decoration: none;
	  margin: 0 100px 50px;
    }

    .attendance-link:hover {
      text-decoration: underline;
    }

    @media screen and (max-width: 600px) {
      .attendance-box {
        flex-direction: column;
        text-align: center;
      }

      .attendance-left {
        border: none;
        padding-right: 0;
        padding-bottom: 20px;
      }

      .attendance-right {
        padding-left: 0;
      }
    }
	 .title {
      text-align: center;
      margin-top: 20px;
      font-size: 32px;
      position: relative;
    }

    .line {
      width: 900px;
      height: 0.5px;
      background-color: #ccc;
      margin: 10px auto 20px;
    }

    .date {
      margin: 10px 15px 0;
    }
	
	.announcement-wrapper {
	  display: flex;
	  align-items: flex-start;
	  justify-content: center;
	  margin-top: 20px;
	  gap:20px;
	  
	}
    .announcement-box {
      width:95%;
     
      border: 1px solid #ccc;
      border-radius: 6px;
      padding: 20px;
      background-color: white;
      margin-right: 10px;
      margin-left:12px;
    }

    .profile-section {
		margin-left:2px;
		margin-bottom:2px;
    }

    .profile-pic {
      width:399px;
      height:273px;
      border-radius: 4px;
	  gap: 2px;
    }

    .announcement-content {
      flex: 1;
      
    }

    .announcement-content p {
      margin: 5px 0;
    }
	
	.announcement-form-flex {
    display: flex;
    gap: 10px;
    margin-top: 20px;
}

.announcement-input {
    flex: 1;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    height: 130px;
    width:92%;
    box-sizing: border-box;
}

.send-button {
    border: none;
    background: none;
    padding: 0;
    cursor: pointer;
 
}

    .view-link {
      display: block;
      text-align: center;
      margin-top: 35px;
	  margin-bottom: 45px;
      font-weight: bold;
      color: #007bff;
      text-decoration: none;
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
		}

		/* Style for each section (Contact, Download, About Church) */
		.footer div {
			flex: 1;          /* Distributes space equally */
			margin: 0 20px 0px;/* Adds spacing between sections */
			font-size: 17px;
		}

/* Ensure links look visible */
		.footer a {
			color: gray; /* Dark gray color */
			text-decoration: none;
			font-weight: bold;
			font-family: 'Poppins', sans-serif;
			font-weight: 400;
			font-size: 15px;
		}

		.footer a:hover {
			color: black; /* Darkens on hover */
			text-decoration: underline;
		}

   
  </style>
</head>

<body>

  <div class="hero">
  <%
String name = request.getParameter("teachername");
%>
  
        <div class="header">Hello <%=name%></div>
        <a href="holycommunionteacherlogin.html" class="logout-btn" style="text-decoration:none;">Log Out</a>
    </div>
	<div class="quote-on-image">
      "Not many of you should become teachers, my brothers, for you know that we who teach will be judged with greater strictness."
      <span>- James 3:1 (ESV)</span>
    </div>
  </div>

  <section class="attendance-section">
    <h2 class="section-title">ATTENDANCE</h2>
    <div class="attendance-box">
      <div class="attendance-left">
        <p class="attendance-number"><%=CommunionDAO.countStudents()%></p>
      </div>
      <div class="attendance-right">
        <p class="attendance-desc">Students enrolled for holy communion classes</p>
        <a href="attendence.jsp?name=<%= java.net.URLEncoder.encode(name, "UTF-8")%>" class="attendance-link">Take Attendance</a>
      </div>
    </div>
  </section>
  
   <div class="line"></div>
	<br>
  <div >
    <h1 class="title" style="font-family: 'Poppins', sans-serif;
			font-weight: 100; font-size: 50px;">ANNOUNCEMENTS</h1>
   
	<br><br>
    <p class="date">RECENT</p>
    <br>
    <div class="announcement-box">
	<div class="announcement-wrapper">
	 <div class="profile-section">
        <img src="https://nwlc.org/wp-content/uploads/2017/04/black-teacher.jpg" alt="Profile" class="profile-pic" />
      </div>
    
      <div class="announcement-content">
        <% 
        ArrayList<String> annouce = CommunionDAO.fetchAnnoucements();
        for(String annoucement:annouce){%>
        <p><%=annoucement%></p>	<br>
        <% }
        %>
        <br><br><br>
		<div class=".announcement-form-flex">
		<form action="annoucements.jsp" method="post">
        <input type="text" placeholder="WRITE AN ANNOUNCEMENT" class="announcement-input" name="annoucements" />
		<button type="submit" style="border:none; background:none;" class="send-button">
		<img src="https://media.istockphoto.com/id/1290684294/vector/send-message-icon.jpg?s=612x612&w=0&k=20&c=8vwd4PDMzEELKMUrTQ7LZnpngAN5Bzs55sRJ09sA8FU=" height='70px' width='70px'>
		</button>
		</form>
		</div>
	  </div>
    </div>
	</div>
   <br><br><br><br>
  
  <div class="footer">
    <div class="contact">
        <h3>Edit</h3>
        <p><a href="removekids.jsp">Remove Student</a></p>
        <p><a href="maintainance.html">Edit Profile Picture</a></p>
        <p><a href="maintainance.html">Edit Password</a></p>
		<p><a href="maintainance.html">Edit Contact Information</a></p>
    </div>
    
    <div class="download">
        <h3>VIEW</h3>
        <p><a href="books.html">Books</a></p>
        <p><a href="images/prayers.pdf" target="_blank">Prayer</a></p>
    </div>

    <div class="about">
        <h3>About Church</h3>
        <p><a href="church.html" style="color:black;">St John Baptist Church<br>
        Moonnumuri,Kodaly 680684</a></p>
    </div>
</div>

</body>
</html>







