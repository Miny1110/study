<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String bir1 = request.getParameter("bir1");
	String bmonth = request.getParameter("bmonth");
	String bir2 = request.getParameter("bir2");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String pNum = request.getParameter("pNum");
	String pNum1 = request.getParameter("pNum1");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

아이디:<%=id %><br/>
비밀번호:<%=pw %><br/>
생년월일:<%=bir1 %>년&nbsp;<%=bmonth %>월&nbsp;<%=bir2 %>일<br/>
성별:<%=gender %><br/>
본인 확인 이메일:<%=email %><br/>
휴대전화:(<%=pNum %>)<%=pNum1 %><br/>

</body>
</html>