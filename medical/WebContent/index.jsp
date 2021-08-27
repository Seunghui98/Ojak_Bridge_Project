<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Created By CodingNepal -->

<html lang="en" dir="ltr">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Somehow I got an error, so I comment the title, just uncomment to show -->
    <!-- <title>Animated Search Box | CodingNepal</title> -->
    <link rel="stylesheet" href="styles.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  </head>
  <body>
  	<!-- 메뉴불러오기 -->
  	<jsp:include page="header.jsp"></jsp:include>
	<br/>
	<br/>
	<br/>
	

    <div class="search-box" align="center">
      <input type="text" placeholder="Type to search..">
      <div class="search-icon" align="center">
        <i class="fas fa-search"></i>
      </div>
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
          searchData.innerHTML = "You just typed " + "<span style='font-weight: 500;'>" + values + "</span>";
        }else{
          searchData.textContent = "";
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
    </script>
	<jsp:include page="footer.jsp"></jsp:include> 
  </body>
</html>
