<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>

<%@ page import="bbs.BbsDAO" %>

<%@ page import="bbs.Bbs" %>

<%@ page import="java.util.ArrayList" %>

 

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="wideth=device-width", initial-scale="1">
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
<link rel="stylesheet" href="css/bootstrap.css"> 

<title>JSP게시판 웹 사이트</title>

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
  <li class="menu_login"><a class="menu_title" href="loginout.jsp">로그아웃<a></li> 
  <li class="menu_join"><a class="menu_title" href="join.jsp">회원가입</a></li> 
  </ul> 
  </div> 
  </div> 
  </div> 
  </header> 
  <div class="main_container"> 

<% 	String userID=null;

	if(session.getAttribute("userID")!=null){

		userID=(String) session.getAttribute("userID");

	}

	int pageNumber=1; //기본페이지

	if(request.getParameter("pageNumber")!=null){

		pageNumber=Integer.parseInt(request.getParameter("pageNumber"));

	}

%>

  <nav class="navbar navbar-default">

      <div class="navbar-header"> 

           <button type="button" class="navbar-toggle collapsed"

                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"

                aria-expanded="false">          

                <span class="icon-bar"></span>

                <span class="icon-bar"></span>

                <span class="icon-bar"></span>

             </button>

            

      </div>

      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

         <ul class="nav navbar-nav">

           <li><a href="main.jsp">메인</a></li>

           <li class="active"><a href="bbs.jsp">게시판</a></li>

           </ul> 

           <%

				if(userID == null) {

			%>

           <ul class="nav navbar-nav navbar-right">

               <li class="dropdown">

                   <a href="#" class="dropdown-toggle"

                     data-toggle="dropdown" role="button" aria-haspopup="true"

                     aria-expanded="false">접속하기<span class="caret"></span></a>

                   <ul class="dropdown-menu">

                    <li class="active"><a href="login.jsp">로그인</a></li>

                    <li><a href="join.jsp">회원가입</a></li>

                    

                    </ul>

              </li>     

           </ul>

           

           <%

				} else { //로그인하면 로그인, 회원가입 대신 로그아웃창 보여줌

			%>

			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown">

					<a href="#" class="dropdown-toggle"

						data-toggle="dropdown" role="button" aria-haspopup="true"

						aria-expanded="false">회원관리<span class="caret"></span></a>

					<ul class="dropdown-menu">

						<li><a href="logoutAction.jsp">로그아웃</a></li>

					</ul>	

				</li>

			</ul>			

			<%

				}

			%>

        </div>

  </nav> 

  <div class="container">

  	<div class="row">

  		<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">

  			<thead>

  				<tr>

  					<th style="background-color: #eeeeee; text-align:center;">번호</th>

  					<th style="background-color: #eeeeee; text-align:center;">제목</th>

  					<th style="background-color: #eeeeee; text-align:center;">작성자</th>

  					<th style="background-color: #eeeeee; text-align:center;">작성일자</th>

  				</tr>

  				</thead>

  				<tbody>

  				<%

  					BbsDAO bbsDAO=new BbsDAO();

  					ArrayList<Bbs> list=bbsDAO.getList(pageNumber);

  					for(int i=0;i<list.size();i++){

  						

  					

  				%>

  					<tr>

  						<td><%=list.get(i).getBbsID() %></td>

  						 <td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%=list.get(i).getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></a></td>

  						<!-- view.jsp로 -->

  						<td><%=list.get(i).getUserID() %></td>

  						

  						<td><%=list.get(i).getBbsDate().substring(0,11)+list.get(i).getBbsDate().substring(11,13)+"시"+list.get(i).getBbsDate().substring(14,16)+"분" %></td>

  					</tr>

  			<%} %>

  						</tbody>

  				

  				</table>

  				<%

				if(pageNumber != 1) {

			%>

				<a href = "bbs.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arraw-left">이전</a>

			<%

				} if(bbsDAO.nextPage(pageNumber + 1)) {

			%>

				<a href = "bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left">다음</a>

			<%

				}

			%>

  				<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a></div></div>

         

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