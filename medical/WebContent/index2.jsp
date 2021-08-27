<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src="https://kit.fontawesome.com/f646252ccf.js" crossorigin="anonymous"></script>
<script src="./js/script.js"></script> 
<link rel="stylesheet" href="styles.css">

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
  
   <div class="conB_container" style="display:flex;"> <div class="conB_small_container"> 
   
   <div class="conB_icon"> <i class="fas fa-hospital-user"></i> </div> 
   <div class="conB_content"> <h3>Hospital</h3> <p></p> </div>
   </div> <div class="conB_small_container"> <div class="conB_icon"> 
   <i class="fas fa-ambulance"></i> </div> <div class="conB_content"> 
   <h3>Emergency</h3> <p></p> </div> </div>
   <div class="conB_small_container"> 
   <div class="conB_icon"> <i class="fas fa-handshake"></i> </div> 
   <div class="conB_content"> <h3>Connect</h3> <p></p>  
    
   </div>
   </div> 
   </div>
   <br/>
   <br/>
   
   <form method="post" action="searchNameAction.jsp">
   <div class="search-box" align="center">
     <input type="text" placeholder="Type to search.." name="searchName" onKeypress="javascript:if(event.keyCode==13) {search_onclick_submit}"/>
     
      
      <div class="search-icon" align="center">
        <i class="fas fa-search"></i>
      </div>
      </form>
      
<div class="cancel-icon" align="center">
        <i class="fas fa-times"></i>
      </div>
<div class="search-data" align="center">

</div>
</div>
<script>
      const searchBox = document.querySelector(".search-box");
      const searchBtn = document.querySelector(".search-icon");
      const cancelBtn = document.querySelector(".cancel-icon");
      const searchInput = document.querySelector("input");
      const searchData = document.querySelector(".search-data");
      searchBtn.onclick =()=>{
        searchBox.classList.add("active");
        searchBtn.classList.add("active");
        searchInput.classList.add("active");
        cancelBtn.classList.add("active");
        searchInput.focus();
        
        if(searchInput.value != ""){
          var values = searchInput.value;
          searchData.classList.remove("active");
         
        }else{
          searchData.textContent = "";
          href.location
        }
      }
      cancelBtn.onclick =()=>{
        searchBox.classList.remove("active");
        searchBtn.classList.remove("active");
        searchInput.classList.remove("active");
        cancelBtn.classList.remove("active");
        searchData.classList.toggle("active");
        searchInput.value = "";
      }
      function enterkey() {
          if (window.event.keyCode == 13) {
        	  location.href="searchNameAction.jsp/searchName="+values;
          }
  }

    </script>
  </div>
 
   </div>
    
  
   <footer> <div class="footer_container">
<div class="footA"> If's </div> 
<div class="footB"> Copyright © If's All Rights Reserved. </div> 
</div> 
</footer> 

</body> 
</html>

