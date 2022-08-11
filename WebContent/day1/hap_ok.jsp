<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	//데이터를 꺼내기 전에 인코딩을 바꿔준다. 데이터를 꺼낸 후에 바꾸면 소용 없다.

	//모든 데이터는 String으로 넘어온다.
	String s1 = request.getParameter("su1");
	String s2 = request.getParameter("su2");
	String name = request.getParameter("name");
	//request : 클라이언트가 서버한테 데이터를 주려고 할 때 데이터를 담는 그릇
	//request라는 객체에 담겨서 온다.
	
	int sum = 0;
	
	int n1 = Integer.parseInt(s1);
	int n2 = Integer.parseInt(s2);

	sum = n1 + n2;
	
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

결과 : <%=n1 %> + <%=n2 %> + <%=sum %><br/>
이름 : <%=name %><br/>


</body>
</html>