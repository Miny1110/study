<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="ob" class="com.calc.NaverVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

[naver2_ok2]<br/><br/>
아이디:<%=ob.getId() %><br/>
비밀번호:<%=ob.getPw() %><br/>
생년월일:<%=ob.getBir1() %>년&nbsp;<%=ob.getBmonth() %>월&nbsp;<%=ob.getBir2() %>일<br/>
성별:<%=ob.getGender() %><br/>
본인 확인 이메일:<%=ob.getEmail() %><br/>
휴대전화:(<%=ob.getpNum() %>)<%=ob.getpNum1() %><br/>

</body>
</html>