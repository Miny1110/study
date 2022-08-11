<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String name = request.getParameter("name");
	String msg = (String)request.getAttribute("msg");
	//자바에서는 msg가 어떤 데이터타입인지 몰라서 object로 넘긴다. 그래서 downcast를 해주어야 한다.
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

리다이렉트 또는 포워딩 한 페이지<br/>
<%=name %>:<%=msg %>

</body>
</html>