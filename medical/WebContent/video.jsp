<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="reservation.ReservationDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>WebRTC Demo</title>

    <link rel="stylesheet" href="css/main.css" />

</head>

<body>
	<%
	String userID = (String)session.getAttribute("userID");
	session.setAttribute("userID", userID);
	
	String reser_id = request.getParameter("reser_id");
	System.out.println("reser_id " + reser_id);
	
	ReservationDAO reservationDAO = new ReservationDAO();
	int result = -1;
	result = reservationDAO.update_reser(Integer.parseInt(reser_id));
	System.out.println("수정" + result);
	
	%>
    <h1>Connecting !!!</h1>

    <div id="buttons">
        <button id="startCall" type="button">Start Call</button>
        <button id="endCall" type="button">End Call</button>
    </div>

    <div id="videos">
        <video id="localVideo" autoplay muted playsinline></video>
        <video id="remoteVideo" autoplay playsinline></video>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.2.0/socket.io.js"></script>
    <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
    <script src="js/main1.js"></script>
</body>
</html>