<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
/* 	String userName = (String)session.getAttribute("userName");
	String userBirth = (String)session.getAttribute("userBirth"); */
	//ex2에서 올렸던 ex1의 데이터를 가져온다.
	
	String userName = request.getParameter("userName");
	String userBirth = request.getParameter("userBirth");
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	//ex2의 데이터이기 때문에 request로 받을 수 있다.
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

이름:<%=userName %><br/>
생일:<%=userBirth %><br/>
아이디:<%=userId %><br/>
패스워드:<%=userPwd %><br/>
</body>
</html>