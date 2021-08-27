<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page %>
<%@ page import="reservation.ReservationDAO" %>
<%@ page import="reservation.Reservation" %>
<%@ page import="doctor.DoctorDAO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<!-- meta 선언 --> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<!-- link 선언 --> 
<link rel="stylesheet" href="./css/style.css"> 
<link rel="stylesheet" href="./css/style_index.css"> 
<link rel="stylesheet" href="./css/reservation.css"> 

<!-- script 선언 --> 
<!--

<script src="https://kit.fontawesome.com/a076d05399.js"></script>   -->
<script src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script> 
<script src="./js/script.js"></script> 
<link rel="stylesheet" href="styles.css">

<title>Insert title here</title>
</head>
<body>
<header> 
<div class="header_container"> 
<div class="logo_container"> 
<a href="./index2.jsp">오작교.COM</a> 
</div> 
<div class="nav_container" id="nav_menu"> 
<div class="menu_container"> 
<ul class="menu">
<li class="menu_1"> <a class="menu_title">병원 검색</a> 

</li> 
<li class="menu_2"> 
<a class="menu_title">예약 조회</a> 

 </li> 
 <li class="menu_3"> <a class="menu_title">오작교 게시판</a>
  </div> 
  <div class="login_container"> 
  <ul class="login"> 
  <li class="menu_4"> 

<ul class="menu_4_content">  
 </ul> 
 </li> 
  <li class="menu_login"><a class="menu_title" href="logout.jsp">로그아웃<a></li> 
  <li class="menu_join"><a class="menu_title" href="join.jsp">회원가입</a></li> 
  </ul> 
  </div> 
  </div> 
  </div> 
  </header> 
  <%
  String userID = (String)session.getAttribute("userID");
	session.setAttribute("userID", userID);
  ReservationDAO reservationDAO = new ReservationDAO();
  UserDAO userDAO = new UserDAO();
  DoctorDAO doctorDAO = new DoctorDAO();
  String userName = "";
  userName = userDAO.userName(userID);
  ArrayList<Reservation> list = reservationDAO.ReservationList(userID);
  System.out.println(list.get(0).getHname());
  int whatdate = 0;
  int time1 = 0;
  String day = "";
  String time2 = "";
  String allday = "";
  int Dnum = 0;
  %>
 <div class="divcontainerG">
	<h2>예약 조회</h2>
<div class="table-wrapper">
    <table class="fl-table">
        <thead>
        <tr>
            <th>환자</th>
            <th>병원명</th>
            <th>진료과</th>
            <th>의사</th>
            <th>요일</th>
            <th>날짜</th>
            <th>시간</th>
            <th>입장</th>
            <th>리뷰작성</th>
            <th>예약취소</th>
        </tr>
        </thead>
        <tbody>
        <%for(int i=0;i<list.size();i++){ %>
        <tr>
            <td><%=userName %></td>
            <td><%=list.get(i).getHname() %></td>
            <td><%=list.get(i).getSubject() %></td>
            <td><%=list.get(i).getDname() %></td>
            <% whatdate = list.get(i).getWhatdate();
            switch(whatdate){
            	case 2:
            		day = "월";
            		break;
            	case 3:
            		day = "화";
            		break;
            	case 4:
            		day = "수";
            		break;
            	case 5:
            		day = "목";
            		break;
            	case 6:
            		day = "금";
            		break;
            }
            System.out.println(day);
            %>
            <td><%=day%></td>
            <% time1 = list.get(i).getTime();
            switch(time1){
            	case 1:
            		time2 = "09:00 ~ 09:15";
            		break;
            	case 2:
            		time2 = "09:20 ~ 09:35";
            		break;
            	case 3:
            		time2 = "09:40 ~ 09:55";
            		break;
            	case 4:
            		time2 = "10:00 ~ 10:15";
            		break;
            	case 5:
            		time2 = "10:20 ~ 10:35";
            		break;
            	case 6:
            		time2 = "10:40 ~ 10:55";
            		break;
            	case 7:
            		time2 = "11:00 ~ 11:15";
            		break;
            	case 8:
            		time2 = "11:20 ~ 11:35";
            		break;
            	case 9:
            		time2 = "11:40 ~ 11:55";
            		break;
            	case 10:
            		time2 = "13:00 ~ 13:15";
            		break;
            	case 11:
            		time2 = "13:20 ~ 13:35";
            		break;
            	case 12:
            		time2 = "13:40 ~ 13:55";
            		break;
            	case 13:
            		time2 = "14:00 ~ 14:15";
            		break;
            	case 14:
            		time2 = "14:20 ~ 14:35";
            		break;
            	case 15:
            		time2 = "14:40 ~ 14:55";
            		break;
            	case 16:
            		time2 = "15:00 ~ 15:15";
            		break;
            	case 17:
            		time2 = "15:20 ~ 15:35";
            		break;
            	case 18:
            		time2 = "15:40 ~ 15:55";
            		break;
            	case 19:
            		time2 = "16:00 ~ 16:15";
            		break;
            	case 20:
            		time2 = "16:20 ~ 16:35";
            		break;
            	case 21:
            		time2 = "16:40 ~ 16:55";
            		break;
            }
           
     		allday = Integer.toString(list.get(i).getYy()) + " / " + Integer.toString(list.get(i).getMm()) + " / " + Integer.toString(list.get(i).getDd());
     		
     		Dnum = doctorDAO.ToDnumber(list.get(i).getDname());
            %>
            <td><%=allday%></td>
            <td><%=time2%></td>
            
            
            <%
            if(list.get(i).getCondition() == 1){
            %>
            <td><a href="video.jsp?reser_id=<%=list.get(i).getId()%>">입장</a></td>
            <%}else{ %>
            <td>-</td>
            <%} %>
            <% 
            if(list.get(i).getCondition() == 0){
            %>
            <td><a href="review.jsp?id=<%=list.get(i).getId()%>&Dnumber=<%=Dnum%>">리뷰작성</a></td>
            <%}else{ %>
            <td>-</td>
            <%} %>
            <% 
            if(list.get(i).getCondition() == 1){
            %>
            <td><a href="reservationCancel.jsp?id=<%=list.get(i).getId()%>">예약취소</a></td>
            <%}else{ %>
            <td>-</td>
            <%} %>
            
        </tr>
        <%
        }
        %>
        
        <tbody>
    </table>
</div>
</div>
<footer> <div class="footer_container">
<div class="footA"> If's </div> 
<div class="footB"> Copyright © If's All Rights Reserved. </div> 
</div> 
</footer> 
</body>
</html>