<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="reservation.ReservationDAO" %>
<%@ page import="reservation.Reservation" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userID = (String)session.getAttribute("userID");
	String Dnumber = (String)session.getAttribute("Dnumber");
	String whatdate = (String)session.getAttribute("whatdate");
	String yy = (String)session.getAttribute("yy");
	String mm = (String)session.getAttribute("mm");
	String dd = (String)session.getAttribute("dd");
	
	 session.setAttribute("userID", userID);
	 
		ReservationDAO reservationDAO = new ReservationDAO();
		String time = request.getParameter("time");
		int result = reservationDAO.input_Reservation(userID,Dnumber,whatdate,time, yy,mm,dd);
		
		
		
		//예약 성공
		if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('예약 성공 !')");
			script.println("location.href = 'viewReservation.jsp'");
			script.println("</script>");
			
		}
		//예약 실패
		else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('예약 실패 !')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		
		
		%>
</body>
</html>