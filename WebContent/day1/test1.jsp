<%@ page contentType="text/html; charset=UTF-8"%>

<%
	int a=10, b=5, c;
	c=a+b;
%>
<!-- <% %>는 자바 영역이다. 웹에서 소스코드 보기를 눌러도 이 부분의 코드는 보이지 않는다. -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

합: <%=a%>+<%=b%>=<%=c %> <br/>


<!-- 내장객체를 사용하여 출력 -->
<!-- 이것을 Servlet이라고 한다. -->
<%
	out.print("합: " + a + "+" + b + "=" + c + "<br/>");

	String str = String.format("합: %d+%d=%d",a,b,c);
	out.print(str);
	
%>

</body>
</html>