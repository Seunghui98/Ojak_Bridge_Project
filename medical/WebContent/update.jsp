<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

 <%@ page import= "java.io.PrintWriter"%>

 <%@ page import="bbs.Bbs" %>

 <%@ page import="bbs.BbsDAO" %>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="wideth=device-width", initial-scale="1">

<link rel="stylesheet" href="css/bootstrap.css"> 
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
  <li class="menu_login"><a class="menu_title" href="logout.jsp">로그아웃<a></li> 
  <li class="menu_join"><a class="menu_title" href="join.jsp">회원가입</a></li> 
  </ul> 
  </div> 
  </div> 
  </div> 
  </header> 
  <div class="main_container"> 
<%

	String userID=null;

	if(session.getAttribute("userID")!=null){

		userID=(String) session.getAttribute("userID");

	}

	if(userID==null){

		PrintWriter script = response.getWriter();

		   script.println("<script>");

		   script.println("alert('로그인을 하세요.')");

		   script.println("location.href = 'login.jsp'");

		   script.println("</script>");  

		

	}

	int bbsID=0;

	if (request.getParameter("bbsID")!=null){

		bbsID=Integer.parseInt(request.getParameter("bbsID"));

	}

	if (bbsID==0){

		 PrintWriter script = response.getWriter();

		   script.println("<script>");

		   script.println("alert('유효하지 않은 글입니다.')");

		   script.println("location.href = 'bbs.jsp'");

		   script.println("</script>");  

	}

	Bbs bbs=new BbsDAO().getBbs(bbsID);

	if (!userID.equals(bbs.getUserID())){

		PrintWriter script = response.getWriter();

		   script.println("<script>");

		   script.println("alert('권한이 없습니다.')");

		   script.println("location.href = 'bbs.jsp'");

		   script.println("</script>");  

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

        </div>

  </nav> 

  <div class="container">

  	<div class="row">

  	<form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">

  	<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">

  			<thead>

  				<tr>

  					<th colspan="2" style="background-color: #eeeeee; text-align:center;">게시판 글 수정 양식</th>

  				</tr>

  			</thead>

  			<tbody>

  					<tr>

  						<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td>

  						</tr>

  						<tr>

  						 <td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="heigt: 350px;"><%= bbs.getBbsContent() %></textarea></td>

  						</tr>

  							</tbody>

  					

  				

  				

  			</table>

  		 <input type="submit" class="btn btn-primary pull-right" value="글수정">

 

  		</form>

  				</div></div>

         

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