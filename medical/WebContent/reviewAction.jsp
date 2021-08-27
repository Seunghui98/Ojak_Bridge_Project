<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="review.reviewDAO" %>
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
request.setCharacterEncoding("utf-8");
String comment = request.getParameter("comment");
String rating = request.getParameter("rating");

System.out.println("shsvu" + comment);
System.out.println("dfkd" + rating);
String userID = (String)session.getAttribute("userID");
String id = (String)session.getAttribute("id");
String Dnumber = (String)session.getAttribute("Dnumber");
session.setAttribute("userID", userID);

System.out.println("Dnumber " + Dnumber);
reviewDAO reviewDAO = new reviewDAO();
String time = request.getParameter("time");
int result = reviewDAO.input_review(userID, Integer.parseInt(Dnumber), Integer.parseInt(rating), comment, Integer.parseInt(id));



//예약 성공
if(result == 0){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('리뷰 작성 성공 !')");
	script.println("location.href = 'viewReservation.jsp'");
	script.println("</script>");
	
}
//예약 실패
else if(result == -1){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert(리뷰 작성 실패 !')");
	script.println("location.href = 'viewReservation.jsp'");
	script.println("</script>");
}

%>
</body>
</html>