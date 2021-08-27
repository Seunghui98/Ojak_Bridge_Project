<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="wideth=device-width", initial-scale="1">

<link rel="stylesheet" href="css/bootstrap.css"> 

<title>JSP게시판 웹 사이트</title>
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
  <div class="main_container"> 

  <div class="container">

  	<div class="row">

  	<form method="post" action="writeAction.jsp">

  	<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">

  			<thead>

  				<tr>

  					<th colspan="2" style="background-color: #eeeeee; text-align:center;">게시판 글쓰기 양식</th>

  					

  				</tr>

  				</thead>

  				<tbody>

  					<tr>

  						<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td></tr>

  						<tr>

  						 <td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="heigt: 350px;"></textarea></td>

  						</tr>

  							</tbody>

  					

  				

  				

  				</table>

  					<input type="submit" class="btn btn-primary pull-right" value="글쓰기">

  	</form>

  		

  				</div></div><

         

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
</div>
 
   <footer> <div class="footer_container">
<div class="footA"> If's </div> 
<div class="footB"> Copyright © If's All Rights Reserved. </div> 
</div> 
</footer> 
</body>

</html> 