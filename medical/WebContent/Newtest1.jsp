<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!-- 꼼수! 버튼 누르면 본문과 댓글 출력-->
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="commm.comm" %>
<%@ page import="commm.commDAO" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.util.ArrayList" %>

 

  

 

<!DOCTYPE html>
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
<script src="https://kit.fontawesome.com/f646252ccf.js" crossorigin="anonymous"></script>
<script src="./js/script.js"></script> 
<link rel="stylesheet" href="styles.css">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="wideth=device-width", initial-scale="1">

<link rel="stylesheet" href="./css/bootstrap.css"> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="wideth=device-width", initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css"> 
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
<li class="menu_3"> <a class="menu_title" href="bbs.jsp">오작교 게시판</a>
</li>
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

	int bbsID=2;

	/*int comNum=0;

	 if (request.getParameter("comNum")!=null){

			bbsID=Integer.parseInt(request.getParameter("comNum"));

		}

		if (comNum==0){

			 PrintWriter script = response.getWriter();

			   script.println("<script>");

			   script.println("alert('유효하지 않은 글입니다.')");

			   script.println("location.href = 'bbs.jsp'");

			   script.println("</script>");  

			

		}*/

	Bbs bbs=new BbsDAO().getBbs(bbsID);  //글자번호

	int comNum=2;

	comm com=new commDAO().getCom(comNum);

	//User user=new UserDAO().getUser(userID);  //아이디

	//User user=new UserDAO().getUser(userID);

	// 댓글 정보를 받아와야할거같은데요!

	int compageNumber=1; //기본페이지

	if(request.getParameter("compageNumber")!=null){

		compageNumber=Integer.parseInt(request.getParameter("compageNumber"));

	}

	commDAO comDAO=new commDAO();

		ArrayList<comm> list=comDAO.getList(compageNumber);

	%>

  

  <div class="containerZZZ"  style="width:100%;margin:0 auto;">

  	<div class="row">

  	<form method="post" action="writeAction.jsp" style="width:100%;margin:0 auto;">

  	<table class="table table-striped" style="text-align: center; border:1px solid #dddddd"  style="width:100%;margin:0 auto;">

  			<thead>

  				<tr>

  					<th colspan="3" style="background-color: #eeeeee; text-align:center;">게시판 글 보기</th>

  					

  				</tr>

  				</thead>

  				<tbody>

  					<tr>

  						<td style="width: 20%;">글 제목</td>

  						 <td colspan="2">안녕하세요</td>

  						

  						</tr>

  						<tr>

  						<td>작성자</td>

  						<td colspan="2">gildong</td>

  						</tr>

  						<tr>

  						<td>작성일자</td>

  						<td colspan="2">2020-12-23 10시 50분</td>

  					</tr>

  					<tr>

  						<td>내용</td>

  						<td colspan="2" style="min-height: 200px; text-align: left;">확인용</td>

  						</tr>

  							</tbody>

  					

  

  				</table>

  				<a href="bbs.jsp" class="btn btn-primary">목록</a>

  				<%

  				   if(userID !=null && userID.equals(bbs.getUserID())){

  					   

  				   

  				%>

  				

  				 <a href="update.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">수정</a>

  				 <a onclick="return confirm('정말 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">삭제</a>

  				 <% 

  				}

  				%>
				

  			</form>	

  	</div>
  	 <div id="comment">

  	 <form method="post" action="commentAction.jsp"  style="width:100%;margin:0 auto;">

         	<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">


            <tr>
               

  							<td colspan="2">gildong</td>

  							<!--  <div>${user.userID}</div>-->

  	
  						 <td><textarea class="form-control" placeholder="댓글 내용" name="comContent" maxlength="2048" style="heigt: 200px;"></textarea></td>

  					 	      

  					<!-- <% String comContent = (String) application.getAttribute("comContent"); // 댓글입력시 comment_writeAction.jsp로 값 전달%>-->

                <!-- 버튼 -->

                <td width="100">

                    <div id="btn" style="text-align:center;">

                        <br></div>

              <a href="check.jsp" class="btn btn-primary pull-right">글쓰기</a>

              

             <!--  <input class="btn btn-success pull-right" name="comContent type="submit" value="댓글달기"/>-->

             <tr></tr>

			

  						<td colspan="2"><%=com.getUserID()  %></td> <!-- 로그인한 아이디 출력 -->

  						

  						<td colspan="2" style="min-height: 200px; text-align: left;"><%=com.getComContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")  %></td>

  						

  				</table>

        </div>
       
        </div>
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