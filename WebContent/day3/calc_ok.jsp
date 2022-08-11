<%@page import="com.calc.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
/* 	int su1 = Integer.parseInt(request.getParameter("su1"));
	int su2 = Integer.parseInt(request.getParameter("su2"));
	String oper = request.getParameter("oper"); */
	
	/*
	Calc ob = new Calc();
	
	ob.setSu1(su1);
	ob.setSu2(su2);
	ob.setOper(oper);
	
	String str = ob.result();
	*/

%>

<jsp:useBean id="ob" class="com.calc.Calc" scope="page"></jsp:useBean>
<!-- 
bean : 객체 생성 
id="ob" class="com.calc.Calc" : Calc ob = new Calc();과 같은 코드
-->
<%--
<jsp:setProperty property="su1" name="ob" value="<%=su1 %>"/>
<jsp:setProperty property="su2" name="ob" value="<%=su2 %>"/>
<jsp:setProperty property="oper" name="ob" value="<%=oper %>"/>
--%>
<%--
<jsp:setProperty property="su1" name="ob"/>
<jsp:setProperty property="su2" name="ob"/>
<jsp:setProperty property="oper" name="ob"/>
value 생략해도 됨
--%>
<jsp:setProperty property="*" name="ob"/>
<!-- ob에 가서 알아서 찾아가라는 의미. 대신 변수 이름이 같아야 한다.
이렇게 되면 위쪽에서 변수선언도 없어도 된다. 클래스에서 받아온다.-->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=ob.result() %>
</body>
</html>