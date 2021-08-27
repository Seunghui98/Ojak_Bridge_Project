<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPW" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userNum" />
<jsp:setProperty name="user" property="sex" />
<jsp:setProperty name="user" property="age" />
<jsp:setProperty name="user" property="address"/>
<jsp:setProperty name="user" property="userEmail" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>JSP 웹사이트</title>
</head>
<body>
 
<%
  String userID=null;
  if(session.getAttribute("userID") !=null){
     userID=(String) session.getAttribute("userID");
  }
  if(userID!=null){
     PrintWriter script = response.getWriter();
       script.println("<script>");
       script.println("alert('이미 로그인이 되어있습니다.')");
       script.println("location.href = 'index2.jsp'"); //메인페이지로
       script.println("</script>");  
  }
  if(user.getUserID()==null || user.getUserPW()==null|| user.getUserName()==null
        || user.getUserNum()==null || user.getAge()==null  ||user.getSex()==null){
     PrintWriter script = response.getWriter();
       script.println("<script>");
       script.println("alert('입력이 안 된 사항이 있습니다.')");
       script.println("history.back()");
       script.println("</script>");
  }
  else{
     UserDAO userDAO = new UserDAO();
      int result = userDAO.join(user);
      if(result ==-1){
       PrintWriter script = response.getWriter();
       script.println("alert('이미 존재하는 아이디입니다.')");
       script.println("history.back()");
       script.println("<script>");
   
      }
      else {
         session.setAttribute("userID", user.getUserID());
       PrintWriter script = response.getWriter();
       script.println("<script>");
      
       script.println("location.href='index2.jsp'"); //메인페이지로
       script.println("</script>");  
      }
    
  }

 %>


</body>
</html>