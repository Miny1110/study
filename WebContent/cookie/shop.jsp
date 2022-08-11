<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core' %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	Cookie[] ck = request.getCookies();
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1" width="400" cellpadding="0" cellspacing="0">

<tr>
	<th>상품명</th>
	<th>가격</th>
</tr>

<tr>
	<td><a href="jepum1.jsp">냉장고</a></td>
	<td>1000원</td>	
</tr>

<tr>
	<td><a href="jepum2.jsp">세탁기</a></td>
	<td>2000원</td>	
</tr>

<tr>
	<td><a href="jepum3.jsp">LCDTV</a></td>
	<td>3000원</td>	
</tr>

</table>

<hr align="left" width="400" color="red">

오늘 본 상품 목록<br/>

<%
if(ck!=null){
	
	for(int i=ck.length-1;i>=0;i--){
	/* 가장 최근에 본 제품이 제일 위에 뜨게 하기 위해서 역순으로 반복문 실행 */
		
		if(ck[i].getName().indexOf("productName")!=-1){
%>
			<%=URLDecoder.decode(ck[i].getValue(), "utf-8") %><br/>
			<img src="<%=cp%>/cookie/image/<%=URLDecoder.decode(ck[i].getValue(), "utf-8")%>.jpg"
			width="100" height="100"><br/>
<%
	


		}
		
		
	}
}

%>

</body>
</html>