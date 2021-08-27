<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="doctor.DoctorDAO" %>
<%@ page import="doctor.Doctor" %>
<%@ page import="user.UserDAO" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<!-- meta 선언 --> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<!-- link 선언 --> 
<link rel="stylesheet" href="./css/style.css"> 
<link rel="stylesheet" href="./css/timetable.css"> 
<link rel="stylesheet" href="./css/style_index.css">
<link rel="stylesheet" href="./css/profile.css">


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
  <div class="conA">
   <div class="slide img1"></div> 
  <div class="slide img2"></div> 
  <div class="slide img3"></div> </div> 
   
  <div class="conB" style="margin: 0 auto;" align="center"> 
  <div class="conB_title">
  <%
  	String hospitalName = request.getParameter("hname");
    String num = request.getParameter("num");
    System.out.println("오류 체크 = " + num);
    String name = request.getParameter("name");
  %>
  	<h3><%=name %> </h3> </div>
  	
   
   
  <div class="containerG" style="text-align: center;width:1300px; margin: 0auto;">
  <% 
    DoctorDAO doctorDAO = new DoctorDAO();
    ArrayList<Doctor> doctorList = doctorDAO.SubjectDoctor(name, Integer.parseInt(num));
    PrintWriter script = response.getWriter();
   	for(int i=0;i<doctorList.size();i++){
    %>
   <div class="div_obj">
  <div class="thecard">
  
    <div class="card-img">
    
      <img src="./doctorimage/<%=name%>/<%=i+1 %>.png">
    </div>
    <div class="card-caption">
      
      <h0><%=doctorList.get(i).getDname() %> 교수 </h0>
      
      <p></p>
    </div>
    
    <div class="card-outmore" style="height:300px;">
   
      <table class="tabletable">
         <thead>
            <tr>
               <td id="sub1">         </td>
               <td id="sub">월</td>
               <td id="sub">화</td>
               <td id="sub">수</td>
               <td id="sub">목</td>
               <td id="sub">금</td>
              
            </tr>
         </thead>
         <tbody>
            <tr>
               <td id="sub">오전</td>
              
               <td id="box1">
               <%if(doctorList.get(i).getMonam() == 1){
            	%> O
            	<% 
               } else {
          		%>	          			
               X  <%} %></td>
               
               <td id="box2">
               <%if(doctorList.get(i).getTueam() == 1){
            	%> O
            	<% 
               } else {
          		%>	          			
               X  <%} %>
               </td>
               <td id="box3"><%if(doctorList.get(i).getWedam() == 1){
            	%> O
            	<% 
               } else {
          		%>	          			
               X  <%} %>
               </td>
               <td id="box4"><%if(doctorList.get(i).getThram() == 1){
            	%> O
            	<% 
               } else {
          		%>	          			
               X  <%} %></td>
               <td id="box5"><%if(doctorList.get(i).getFriam() == 1){
            	%> O
            	<% 
               } else {
          		%>	          			
               X  <%} %></td>
               
            </tr>
            <tr>
               <td id="sub">오후</td>
               <td id="box1"><%if(doctorList.get(i).getMonopm() == 1){
            	%> O
            	<% 
               } else {
          		%>	          			
               X  <%} %></td>
               <td id="box2"><%if(doctorList.get(i).getTuepm() == 1){
            	%> O
            	<% 
               } else {
          		%>	          			
               X  <%} %></td>
               <td id="box3"><%if(doctorList.get(i).getWedpm() == 1){
            	%> O
            	<% 
               } else {
          		%>	          			
               X  <%} %></td>
               <td id="box2"><%if(doctorList.get(i).getThrpm() == 1){
            	%> O
            	<% 
               } else {
          		%>	          			
               X  <%} %></td>
               <td id="box2"><%if(doctorList.get(i).getFripm() == 1){
            	%> O
            	<% 
               } else {
          		%>	          			
               X  <%} %></td>
               
            </tr>
           
         </tbody>
      </table>
     <a href="login.jsp?hname=<%=hospitalName%>&name=<%=name%>&num=<%=num%>&doctorName=<%=doctorList.get(i).getDname() %>">예약하기</a>
      
    </div>
    
  </div>

</div>
<% }%>

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