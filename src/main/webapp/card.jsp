<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.beans.StudentCommunionBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Holy Communion Invitation</title>
  <style>
    body, html {
      margin: 0;
      padding: 0;
      height: 100%;
      width: 100%;
      font-family: 'Georgia', serif;
      background: linear-gradient(to bottom right, #fff8e7, #f5f0d7);
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }

    .card-container {
      width: 90%;
      max-width: 800px;
      padding: 60px 40px;
      background-color: #ffffff;
      border: 3px solid #b38900;
      border-radius: 20px;
      box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
      text-align: center;
      transition: transform 0.3s ease;
    }

    .card-container:hover {
      transform: scale(1.01);
    }

    .cross {
      font-size: 3rem;
      color: #b38900;
      margin-bottom: 15px;
    }

    h1 {
      font-size: 2.2rem;
      color: #b38900;
      margin-bottom: 10px;
    }

    .invitee-name {
      font-size: 1.5rem;
      margin: 20px 0;
      color: #444;
    }

    .message {
      font-size: 1.2rem;
      margin: 10px 0 20px;
      color: #555;
    }

    .church {
      font-size: 1.1rem;
      font-weight: bold;
      color: #333;
      margin-bottom: 10px;
    }

    .download-btn {
      margin-top: 20px;
      padding: 12px 25px;
      font-size: 1rem;
      background-color: #b38900;
      color: white;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: background 0.3s;
    }

    .download-btn:hover {
      background-color: #8a6e00;
    }
  </style>
</head>
<body>
	<% String studentname = (String) session.getAttribute("studentName"); 
		String firstName = studentname.split(" ")[0];
	%>
  <!-- Card content -->
  <div id="card" class="card-container">
    <h1>Holy Communion Invitation</h1>
    <p class="invitee-name">You are warmly invited to celebrate the Holy Communion of 
      <br><br><strong><%=studentname %></strong><br><br></p>
    <p class="message">Join us for this blessed occasion as <%=firstName %> receives her First Holy Communion, surrounded by faith, love, and joy.</p>
    <p class="church">At<br><br> St. John Baptist Church, Monummuri</p><br>
    <p class="message">We look forward to sharing this spiritual milestone with you!</p>
  </div>

  <!-- Download Image Button -->
  <button class="download-btn" onclick="downloadAsImage()">Download Card</button>

  <!-- Include html2canvas library -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
  <script>
    function downloadAsImage() {
      const card = document.getElementById("card");
      html2canvas(card).then(canvas => {
        const link = document.createElement('a');
        link.download = 'HolyCommunionCard.png';
        link.href = canvas.toDataURL("image/png");
        link.click();
      });
    }
  </script>

</body>
</html>
