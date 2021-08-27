<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="doctor.DoctorDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPW"/>
<jsp:setProperty name="user" property="type"/> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset="UTF-8">
<title> 로그인</title>
</head>
<body>
	<%
	
	
	
	 	
	
	
		String loginType = (String)request.getParameter("type");
		System.out.println("타입은 " + loginType);
		
		if(loginType.equals("환자")){
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPW());
		
		//로그인 성
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='usermain.jsp';");
			script.println("</script>");
			session.setAttribute("userID", user.getUserID());
			
		}
		//로그인 실패
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		//아이디 없음
		else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		//DB오류
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DB오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		} else if(loginType.equals("의사")){
			DoctorDAO DoctorDAO = new DoctorDAO();
			int result = DoctorDAO.login(user.getUserID(), user.getUserPW());
			System.out.println(result);
			//로그인 성공
			if(result == 1){
				System.out.println("난가 ?");
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='doctormain.jsp';");
				script.println("</script>");
				session.setAttribute("DnumberID", user.getUserID());
				
			}
			//로그인 실패
			else if(result == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 틀립니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			//아이디 없음
			else if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('존재하지 않는 아이디 입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			//DB오류
			else if(result == -2){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('DB오류가 발생했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		} 
		
		
	%>
</body>
</html>