<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page %>
<%@ page import="reservation.ReservationDAO" %>
<%@ page import="reservation.Reservation" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="review.reviewDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
<link rel="stylesheet" href="./css/comment.css">

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
 <li class="menu_3"> <a class="menu_title" href="bbs.jsp">오작교 게시판</a>
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
<!-- Contenedor Principal -->
  <div class="comments-container">
    <h1> 리뷰 </h1>
<%
String reser_id = request.getParameter("reser_id");
String day = request.getParameter("day");
String name = request.getParameter("name");
String[] list = new String[3];
reviewDAO rDAO = new reviewDAO();
list = rDAO.select_review(reser_id);
System.out.println(list[0] + list[1] + list[2]);
%>
    <ul id="comments-list" class="comments-list">
      <li>
        <div class="comment-main-level">
          <!-- Avatar -->
         
          <!-- Contenedor del Comentario -->
          <div class="comment-box">
            <div class="comment-head">
              <h6 class="comment-name"><%=name %></a></h6>
              <span><%=day %></span>
              <i class="fa fa-reply"></i>
              <i class="fa fa-heart"></i>
              
            </div>
            <div class="comment-content">
            <span >rating : <%=list[1] %> / 5</span>
            <br/>
           <%=list[2] %>
            </div>
          </div>
        </div>
        
      </li>

      
    </ul>
  </div>
  
  </body>
</html>