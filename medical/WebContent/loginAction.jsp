<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
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
	
	String Hname = (String)session.getAttribute("hname");
	String name = (String)session.getAttribute("name");
	String Dname = (String)session.getAttribute("Dname");
	String num = (String)session.getAttribute("num");
	
		String loginType = (String)request.getParameter("type");
		System.out.println("타입은 " + loginType);
		
		if(loginType.equals("환자")){
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPW());
		
		//로그인 성공
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("<location.href='reservation.jsp'>");
			script.println("</script>");
			session.setAttribute("userID", user.getUserID());
			session.setAttribute("hname", Hname);
			session.setAttribute("name", name);
			session.setAttribute("Dname", Dname);
			session.setAttribute("num", num);
			response.sendRedirect("reservation.jsp");
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
		
		} /**
			else if(loginType.equals("학생")){
			UserDAO UserDAO = new UserDAO();
			int result = UserDAO.login(user.getUserID(), user.getUserPW());
			
			//로그인 성공
			if(result == 1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("<location.href='studentmain.jsp'>");
				script.println("</script>");
				session.setAttribute("stuID", user.getUserID());
				response.sendRedirect("studentmain.jsp");
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
		} else if(loginType.equals("교수")){
			ProfessorDAO professorDAO = new ProfessorDAO();
			int result = professorDAO.login(Integer.parseInt(user.getUserID()), user.getUserPW());
			
			//로그인 성공
			if(result == 1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("<location.href='studentmain.jsp'>");
				script.println("</script>");
				session.setAttribute("pro_code", user.getUserID());
				response.sendRedirect("professormain.jsp");
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
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		**/
	%>
</body>
</html>