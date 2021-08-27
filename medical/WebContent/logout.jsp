<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate(); //접속한 회원의 세션을 빼앗음
	%>
	
	<script> //메인으로 이동
		alert('로그아웃 완료');
		location.href='index2.jsp';
	</script>
</body>
</html>