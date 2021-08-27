<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reservation.ReservationDAO" %>
<%@ page import="reservation.Reservation" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String reservationID = request.getParameter("id");
	String userID = (String)session.getAttribute("userID");
	session.setAttribute("userID", userID);
	ReservationDAO reservationDAO = new ReservationDAO();
	int result = -1;
	result = reservationDAO.Cancel(reservationID);
	
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삭제성공 !')");
		script.println("location.href = 'viewReservation.jsp'");
		script.println("</script>");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삭제실패 !')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
</body>
</html>