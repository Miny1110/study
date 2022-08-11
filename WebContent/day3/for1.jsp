<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String eng = "test";
	String kor = "테스트";
	
	String han = URLEncoder.encode(kor, "UTF-8");
%>

<jsp:forward page="for2.jsp">

	<jsp:param value="<%=eng %>" name="eng"/>
	<jsp:param value="<%=han %>" name="kor"/>
	
</jsp:forward>

