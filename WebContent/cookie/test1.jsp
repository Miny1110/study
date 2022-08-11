<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core' %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	//쿠키에 데이터 저장
	//쿠키는 정보를 서버에 저장하는 것이 아니라 클라이언트에 저장한다.
	
	Cookie c1 = new Cookie("name","suzi");
	Cookie c2 = new Cookie("age","27");
	Cookie c3 = new Cookie("addr",URLEncoder.encode("서울","utf-8"));
	//사실 인코딩 안해도 됨
	
	response.addCookie(c1);
	response.addCookie(c2);
	response.addCookie(c3);
	
	//test1를 실행하는 순간 컴퓨터에 쿠키가 저장된다.
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<a href="test2.jsp">쿠키</a>

<input type="text" placeholder="아이디입력">

</body>
</html>