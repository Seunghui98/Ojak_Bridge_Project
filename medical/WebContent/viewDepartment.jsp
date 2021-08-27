<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="doctor.DoctorDAO" %>
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
	<link rel="stylesheet" href="css/grid.css">

<title> If's </title> 
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
<li class="menu_1"> <a class="menu_title">메뉴 1</a> 
<ul class="menu_1_content"> 
<li><a class="menu_index" href="#">메뉴 1 - 1</a></li> 
<li><a class="menu_index" href="#">메뉴 1 - 2</a></li> 
<li><a class="menu_index" href="#">메뉴 1 - 3</a></li> 
</ul> 
</li> 
<li class="menu_2"> 
<a class="menu_title">메뉴 2</a> 
<ul class="menu_2_content"> 
<li><a class="menu_index" href="#">메뉴 2 - 1</a></li> 
<li><a class="menu_index" href="#">메뉴 2 - 2</a></li> 
<li><a class="menu_index" href="#">메뉴 2 - 3</a></li>
 </ul> 
 </li> 
 <li class="menu_3"> <a class="menu_title">메뉴 3</a>
  <ul class="menu_3_content"> 
  <li><a class="menu_index" href="#">메뉴 3 - 1</a></li> 
  <li><a class="menu_index" href="#">메뉴 3 - 2</a></li> 
  <li><a class="menu_index" href="#">메뉴 3 - 3</a></li> 
  </ul> </li> </ul> </div> 
  <div class="login_container"> 
  <ul class="login"> 
  <li class="menu_login"><a class="menu_title" href="login.jsp">로그인</a></li> 
  <li class="menu_join"><a class="menu_title" href="#">회원가입</a></li> 
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
  <div class="conB" style="margin: 0 auto;" align="center"> 
  <div class="conB_title"> 
   
  <%
		String hospitalName = request.getParameter("hospitalName");
		System.out.println(hospitalName);
		DoctorDAO doctorDAO = new DoctorDAO();
		String[] result = doctorDAO.SearchSubject(hospitalName);
		PrintWriter script = response.getWriter();
		
		if(result[0].equals("0")){
			script.println("<script>");
			script.println("alert('검색된 병원이 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else{
			for(int i=0;i<result.length;i++){
				System.out.println(result[i]);
			}
			/**
 		    script.println(result[0]);
			script.println(result[1]);
			script.println(result[2]);
			**/
		}
		int[] sub_count = doctorDAO.CountSubject(hospitalName);
		System.out.println("조대" + sub_count);
		
		
	%>
	<h3><%=hospitalName %> 진료과목 </h3>
  </div>
  
  <div style="width:1000px;margin:0 auto;">
  <div class="containerC" style="text-align:center;margin:0 auto;">
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[0]%>&name=<%=result[0]%>';"><%=result[0]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[1]%>&name=<%=result[1]%>';"><%=result[1]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[2]%>&name=<%=result[2]%>';"><%=result[2]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[3]%>&name=<%=result[3]%>';"><%=result[3]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[4]%>&name=<%=result[4]%>';"><%=result[4]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[5]%>&name=<%=result[5]%>';"><%=result[5]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[6]%>&name=<%=result[6]%>';"><%=result[6]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[7]%>&name=<%=result[7]%>';"><%=result[7]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[8]%>&name=<%=result[8]%>';"><%=result[8]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[9]%>&name=<%=result[9]%>';"><%=result[9]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[10]%>&name=<%=result[10]%>';"><%=result[10]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[11]%>&name=<%=result[11]%>';"><%=result[11]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[12]%>&name=<%=result[12]%>';"><%=result[12]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[13]%>&name=<%=result[13]%>';"><%=result[13]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[14]%>&name=<%=result[14]%>';"><%=result[14]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[15]%>&name=<%=result[15]%>';"><%=result[15]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[16]%>&name=<%=result[16]%>';"><%=result[16]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[17]%>&name=<%=result[17]%>';"><%=result[17]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[18]%>&name=<%=result[18]%>';"><%=result[18]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[19]%>&name=<%=result[19]%>';"><%=result[19]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[20]%>&name=<%=result[20]%>';"><%=result[20]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[21]%>&name=<%=result[21]%>';"><%=result[21]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[22]%>&name=<%=result[22]%>';"><%=result[22]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[23]%>&name=<%=result[23]%>';"><%=result[23]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[24]%>&name=<%=result[24]%>';"><%=result[24]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[25]%>&name=<%=result[25]%>';"><%=result[25]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[26]%>&name=<%=result[26]%>';"><%=result[26]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[27]%>&name=<%=result[27]%>';"><%=result[27]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[28]%>&name=<%=result[28]%>';"><%=result[28]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[29]%>&name=<%=result[29]%>';"><%=result[29]%>  ></div>
  <div class="cell cell-1" style="font-size: 15px" onclick="location.href='viewDoctor.jsp?hname=<%=hospitalName%>&num=<%=sub_count[30]%>&name=<%=result[30]%>';"><%=result[30]%>  ></div>
  </div>
  
  </div>
	</div>
	
	
	
	</div>
	
   <footer> <div class="footer_container">
<div class="footA"> If's </div> 
<div class="footB"> Copyright © If's All Rights Reserved. </div> 
</div> 
</footer> 

</body> 
</html>