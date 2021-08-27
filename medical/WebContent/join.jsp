<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="wideth=device-width", initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css"> 
<!-- link 선언 --> 
<link rel="stylesheet" href="./css/style.css"> 
<link rel="stylesheet" href="./css/style_index.css"> 

<!-- script 선언 --> 
<!--

<script src="https://kit.fontawesome.com/a076d05399.js"></script>   -->
<script src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script> 
<script src="https://kit.fontawesome.com/f646252ccf.js" crossorigin="anonymous"></script>
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
  <li class="menu_login"><a class="menu_title" href="firstlogin.jsp">로그인<a></li> 
  <li class="menu_join"><a class="menu_title" href="join.jsp">회원가입</a></li> 
  </ul> 
  </div> 
  </div> 
  </div> 
  </header> 
  <div class="main_container"> 
	
    <div class="container">
       <div class="col-lg-4"></div>
       <div class="col-lg-4">
           <div class="jumbotron" style="width:1000px;margin: 0 auto;padding-top: 20px;">
             <form method="post" action="joinAction.jsp">
               <h3 style="text-align: center;">회원가입 화면</h3>
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
                  </div>
                <div class="form-group">
                  <input type="password" class="form-control" placeholder="비밀번호" name="userPW" maxlength="20">
                  </div>
                   <div class="form-group">
                  <input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
                  </div>
                 <div class="form-group">
                  <input type="text" class="form-control" placeholder="주민번호" name="userNum" maxlength="20">
                  </div>
                  <div class="form-group">
                  <input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
                  </div>
                     
                  <div class="form-group" style="text-align: center;">
                     <div class="btn-group" data-toggle="buttons">
                        <label class="btn btn-primary active">
                           <input type="radio" name="sex" autocomplete="off" value="M" checked>남자</label>
                           <label class="btn btn-primary">
                           <input type="radio" name="sex" autocomplete="off" value="F" checked>여자</label>
                           
                           </div>
                        </div>
                  <div class="form-group">
                  <input type="number" class="form-control" placeholder="나이" name="age" maxlength="20">   
                  </div>
                  <div class="form-group">
                  <input type="text" class="form-control" placeholder="주소" name="address" maxlength="20">
                           </div>
                     
                 <input type="submit" class="btn btn-primary form-control" value="회원가입">
                  
                  </form>
           
           </div></div></div>
         <div class="col-lg-4"></div>
         </div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
  
   <footer> <div class="footer_container">
<div class="footA"> If's </div> 
<div class="footB"> Copyright © If's All Rights Reserved. </div> 
</div> 
</footer> 
</body>
</html>