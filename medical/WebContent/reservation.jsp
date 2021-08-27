<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="doctor.DoctorDAO" %>
<%@ page import="doctor.Doctor" %>
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
  
  
  String hospitalName = (String)session.getAttribute("hname");
	String name = (String)session.getAttribute("name");
	String Dname = (String)session.getAttribute("Dname");
	String num = (String)session.getAttribute("num");
	String userID = (String)session.getAttribute("userID");
	session.setAttribute("userID", userID);
  DoctorDAO doctorDAO = new DoctorDAO();
  String[] result = new String[31];
  result = doctorDAO.SearchSubject(hospitalName);
	PrintWriter script = response.getWriter();
	 ArrayList<Doctor> doctorList = doctorDAO.SubjectDoctor(name, Integer.parseInt(num));
  %>
<div class="container">
<h1 style="text-align:center;"><%= hospitalName %></h1>
<br/>
<div style="display:grid;grid-template-columns: 500px 500px;grid-column-gap: 50px;">
<div style="display:grid;grid-row-gap: 20px;">
<div style="display:flex;">
<h1 style="font-size:15px;">예약 날짜 : </h1>	
<div class="input-group date" style="width:250px;">
  
  <input  id='datetimepicker10' type="text" class="form-control" data-provide="datepicker"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
  </div>
</div>

<div class="custom-select-wrapper">
    <div class="custom-select">
        <div class="custom-select__trigger"><span id="select1"><%=name %></span>
            <div class="arrow"></div>
        </div>
        <div class="custom-options">
        <%
        int i=0;
        while(result[i] != null){
        	if(result[i].equals(name)){
        	 %>
        	 <span class="custom-option selected" data-value="tesla"><%=name%></span>
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
    	
        <div class="custom-select__trigger"><span id="select2"><%=Dname %></span>
            <div class="arrow"></div>
        </div>
       
        <div class="custom-options">
        	<%
    	for(int j=0;j<doctorList.size();j++){
    		if(doctorList.get(j).getDname().equals(Dname)){
    	
    	%>
            <span class="custom-option selected" data-value="tesla"><%=Dname %></span>
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
        <tr>
            <td>-</td>
            <td>-</td>
        </tr>
        <tr class="active-row">
            <td>-</td>
            <td>-</td>
        </tr>
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

