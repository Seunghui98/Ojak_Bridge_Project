<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="doctor.DoctorDAO" %>
<%@ page import="doctor.Doctor" %>
<%@ page import="user.UserDAO" %>
<%@ page import="reservation.ReservationDAO" %>
<%@ page import="reservation.Reservation" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
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
<link rel="stylesheet" href="./css/selectlist.css"> 

<!-- script 선언 --> 
<!--

<script src="https://kit.fontawesome.com/a076d05399.js"></script>   -->
<script src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script> 
<script src="./js/script.js"></script> 
<link rel="stylesheet" href="styles.css">
    <title>Bootstrap datepicket demo</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script type='text/javascript'>
$(function(){
$('.input-group.date').datepicker({
    calendarWeeks: true,
    todayHighlight: true,
    autoclose: true
   
});

});
</script>
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
  String selName = request.getParameter("selName");
  String date = request.getParameter("date");
  String selDname = request.getParameter("selDName");
  String hospitalName = request.getParameter("hname");
  String mm = date.substring(0,2);
  String dd = date.substring(3,5);
  String yy = date.substring(6,10); 
  String inputDate = yy+mm+dd;
  System.out.println("음"+inputDate);
  DateFormat df = new SimpleDateFormat("yyyyMMdd");
  Date date1 = df.parse(inputDate);
  Calendar calendar1 = Calendar.getInstance();
  calendar1.setTime(date1);
  int whatdate = calendar1.get(Calendar.DAY_OF_WEEK);
  System.out.println("뭐 "+calendar1.get(Calendar.DAY_OF_WEEK));
  String userID = (String)session.getAttribute("userID");
  System.out.println("아이디는" + userID);
  
  /**
  String name = request.getParameter("name");
  System.out.println("오류 체크 = " + name);
  String Dname = request.getParameter("doctorName");
  */
  String num = request.getParameter("num");
  DoctorDAO doctorDAO = new DoctorDAO();
  String[] result = new String[31];
  result = doctorDAO.SearchSubject(hospitalName);
  
  session.setAttribute("userID", userID);
  session.setAttribute("Dnumber", Integer.toString(doctorDAO.ToDnumber(selDname)));
  session.setAttribute("whatdate", Integer.toString(whatdate));
  session.setAttribute("yy", yy);
  session.setAttribute("mm", mm);
  session.setAttribute("dd", dd);
	PrintWriter script = response.getWriter();
	 ArrayList<Doctor> doctorList = doctorDAO.SubjectDoctor(selName, Integer.parseInt(num));
  %>
<div class="container">
<h1 style="text-align:center;"><%= hospitalName %> </h1>
<br/>
<div style="display:grid;grid-template-columns: 400px 400px;grid-column-gap: 50px;">
<div style="display:grid;grid-row-gap: 20px;">
<div style="display:flex;">
<h1 style="font-size:15px;">예약 날짜 : </h1>	
<div class="input-group date" style="width:250px;">
  
  <input  id='datetimepicker10' type="text" value="<%=date%>" class="form-control" data-provide="datepicker"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
  </div>
</div>

<div class="custom-select-wrapper">
    <div class="custom-select">
        <div class="custom-select__trigger"><span id="select1"><%=selName %></span>
            <div class="arrow"></div>
        </div>
        <div class="custom-options">
        <%
        int i=0;
        while(result[i] != null){
        	if(result[i].equals(selName)){
        	 %>
        	 <span class="custom-option selected" data-value="tesla"><%=selDname%></span>
        	 <% 
        	} else {
        		%>
        		<span class="custom-option" data-value="volvo"><%=result[i] %></span>
        	<% 
        	}
        	i++;
        	if(i == 31){
        		break;
        	}
        }
        %>
            
        </div>
    </div>
</div>

<div class="custom-select-wrapper">
	
    <div class="custom-select">
    	
        <div class="custom-select__trigger"><span id="select2"><%=selDname %></span>
            <div class="arrow"></div>
        </div>
       
        <div class="custom-options">
        	<%
    	for(int j=0;j<doctorList.size();j++){
    		if(doctorList.get(j).getDname().equals(selDname)){
    	
    	%>
            <span class="custom-option selected" data-value="tesla"><%=selDname %></span>
            <% }else { %>
            <span class="custom-option" data-value="volvo"><%=doctorList.get(j).getDname() %></span>
            <%}
    	}
    		%>
            
        </div>
        
    </div>
</div>

<div>
       <a href="#" class="c-button" onclick="dateCheck();">예약조회</a>
    </div>
</div>
<table class="styled-table">
    <thead>
        <tr>
            <th>시간</th>
            <th>예약</th>
        </tr>
    </thead>
    <tbody>
        <% 
        int[] possible = doctorDAO.PossibleDay(selDname, whatdate);
        String[] timetable = new String[21];
        timetable[0] = "09:00 ~ 09:15";
        timetable[1] = "09:20 ~ 09:35";
        timetable[2] = "09:40 ~ 09:55";
        timetable[3] = "10:00 ~ 10:15";
        timetable[4] = "10:20 ~ 10:35";
        timetable[5] = "10:40 ~ 10:55";
        timetable[6] = "11:00 ~ 11:15";
        timetable[7] = "11:20 ~ 11:35";
        timetable[8] = "11:40 ~ 11:55";
        timetable[9] = "13:00 ~ 13:15";
        timetable[10] = "13:20 ~ 13:35";
        timetable[11] = "13:40 ~ 13:55";
        timetable[12] = "14:00 ~ 14:15";
        timetable[13] = "14:20 ~ 14:35";
        timetable[14] = "14:40 ~ 14:55";
        timetable[15] = "15:00 ~ 15:15";
        timetable[16] = "15:20 ~ 15:35";
        timetable[17] = "15:40 ~ 15:55";
        timetable[18] = "16:00 ~ 16:15";
        timetable[19] = "16:20 ~ 16:35";
        timetable[20] = "16:40 ~ 16:55";
        
        
        ReservationDAO reservationDAO = new ReservationDAO();
        boolean reservation_possible = true;

        if(possible[0] == 1){
        	
        	for(int k=0;k<7;k+=2){
        
        %>
        <tr>
            <td><%=timetable[k] %></td>
            <% 
            
            reservation_possible = reservationDAO.PossibleTime(doctorDAO.ToDnumber(selDname), k, yy, mm, dd);
            if(reservation_possible){
            %>
            <td><a href="reservationAction.jsp?time=<%=k%>">예약가능</a></td>
            
            <%
            }else{
            	%>
            	
            <td>예약불가</td>
            <%} %>
        </tr>
       
        <tr class="active-row">
            <td><%=timetable[k+1] %></td>
            <% 
             reservation_possible = reservationDAO.PossibleTime(doctorDAO.ToDnumber(selDname), k+1, yy, mm, dd);
            if(reservation_possible){
            %>
            <td><a href="reservationAction.jsp?time=<%=k+1%>">예약가능</a></td>
            <%}else{
            	%>
            <td>예약불가</td>
            <%} %>
            
        </tr>
        
        <%}
        	%>
        	<tr>
            <td><%=timetable[8] %></td>
            <% 
            
            reservation_possible = reservationDAO.PossibleTime(doctorDAO.ToDnumber(selDname), 8, yy, mm, dd);
            if(reservation_possible){
            %>
            <td><a href="reservationAction.jsp?time=<%=8%>">예약가능</a></td>
            <%}else{
            	%>
            <td>예약불가</td>
            <%} %>
        </tr>
        	
        	
        	
        	<% 
        	
        }
        
        
        if(possible[1] == 1){
        	for(int t=9;t<21;t+=2){
        
        %>
        <tr>
            <td><%=timetable[t] %></td>
            <% 
             reservation_possible = reservationDAO.PossibleTime(doctorDAO.ToDnumber(selDname), t, yy, mm, dd);
            if(reservation_possible){
            %>
            <td><a href="reservationAction.jsp?time=<%=t%>">예약가능</a></td>
            <%}else{
            	%>
            <td>예약불가</td>
            <%} %>
        </tr>
       
        <tr class="active-row">
            <td><%=timetable[t+1] %></td>
            <% 
             reservation_possible = reservationDAO.PossibleTime(doctorDAO.ToDnumber(selDname), t+1, yy, mm, dd);
            if(reservation_possible){
            %>
            <td><a href="reservationAction.jsp?time=<%=t+1%>">예약가능</a></td>
            <%}else{
            	%>
            <td>예약불가</td>
            <%} %>
        </tr>
        
        <%}
        }
        %>
        <!-- and so on... -->
    </tbody>
</table>
</div>


</div>
<script type="text/javascript">
    var dates = {};
    $(document).ready(function () {
      $('#datetimepicker10').datepicker({
         viewMode: 'years',
         format: 'yyyy-mm-dd'
      });
   });

    function dateCheck() {
        dates.diffInDays = (new Date($('#datetimepicker10').val()).valueOf() - new Date('2017-04-26').valueOf()) / (3600 * 24 * 1000);
        dates.str = $('#datetimepicker10').val();
        val1 = document.getElementById('select1').innerHTML;
        val2 = document.getElementById('select2').innerHTML;
        
        location.href="reservation2.jsp?selName="+val1+"&selDName="+val2+"&hname=<%=hospitalName%>&num=<%=num%>&date="+dates.str;
        return false;
       
         
     }
</script>
<script>
//document.querySelector('.custom-select-wrapper').addEventListener('click', function () {
//this.querySelector('.custom-select').classList.toggle('open');
//})
for (const dropdown of document.querySelectorAll(".custom-select-wrapper")) {
dropdown.addEventListener('click', function() {
 this.querySelector('.custom-select').classList.toggle('open');
})
}

//window.addEventListener('click', function (e) {
//const select = document.querySelector('.custom-select')
//if (!select.contains(e.target)) {
//  select.classList.remove('open');
//}
//});

window.addEventListener('click', function(e) {
for (const select of document.querySelectorAll('.custom-select')) {
 if (!select.contains(e.target)) {
     select.classList.remove('open');
     var name = $
 }
}
});
</script>
</body>
</html>
