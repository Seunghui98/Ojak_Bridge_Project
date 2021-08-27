<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="hospital.HospitalDAO" %>
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

<!-- script 선언 --> 
<!--

<script src="https://kit.fontawesome.com/a076d05399.js"></script>   -->
<script src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script> 
<script src="./js/script.js"></script> 

<link rel="stylesheet" href="styles.css">
<!-- 뷰포트 -->
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<!-- 스타일시트 참조 -->
	<link rel="stylesheet" href="css/bootstrap.min.css">

<title> If's </title> 
</head> 
<body> 
<header> 
<%



%>
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
  <li class="menu_login"><a class="menu_title" href="firstlogin.jsp">로그인<a></li> 
  <li class="menu_join"><a class="menu_title" href="join.jsp">회원가입</a></li> 
  </ul> 
  </div> 
  </div> 
  </div> 
  </header> 
  <div class="main_container"> 
  <div class="conA">
   <div class="slide img1"></div> 
  <div class="slide img2"></div> 
  <div class="slide img3"></div> </div> 
  <div class="conB"> <div class="conB_title"> 
  <h3>About</h3> </div>
   
	<!-- 로긴폼 -->	
	
		<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
		<!-- 점보트론 -->
		<div class="jumbotron" style="width:1000px;margin: 0 auto;padding-top: 20px;">
		<!-- 로그인 정보를 숨기면서 전송post -->
		<form method="post" action="firstloginAction.jsp">
		<h3 style="text-align: center;">로그인화면</h3>
		<div class="form-group">
			<input type="text" class="form-control" placeholder="아이디" name="userID" maxlengt="20">
		</div>
		
		<div class="form-group">
		<input type="password" class="form-control" placeholder="비밀번호" name="userPW" maxlength="20">
		</div>
		 
		 <div class="form-group" style="text-align:center;">
            <div class="btn-group" data-toggle="buttons">
                   <label class="btn btn-primary active">
                        <input type="radio" name="type" autocomplete="off" value="환자" checked> 환자
                    </label>
                    <label class="btn btn-primary">
                        <input type="radio" name="type" autocomplete="off" value="의사" unchecked> 의사
                    </label>
                    <label class="btn btn-primary">
                        <input type="radio" name="type" autocomplete="off" value="관리자" unchecked> 관리자
                    </label>
		 	</div>
		 </div>
		 
		<input type="submit" class="btn btn-primary form-control" value="로그인">
		 
		</form>
		</div>
		</div>
	</div>
	
	
	<!-- 애니매이션 담당 JQUERY -->

    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

    <!-- 부트스트랩 JS  -->

    <script src="js/bootstrap.js"></script>
	</div>
	

   <footer> <div class="footer_container">
<div class="footA"> If's </div> 
<div class="footB"> Copyright © If's All Rights Reserved. </div> 
</div> 
</footer> 

</body> 
</html>